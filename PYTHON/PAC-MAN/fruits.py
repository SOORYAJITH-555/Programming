# fruits.py

import pygame
import random
from settings import *
from spritesheet import SpriteSheet # Needed for sprite fallback

class Fruit:
    def __init__(self, x, y, fruit_type=None):
        self.x = x
        self.y = y
        
        if fruit_type is None:
            fruit_types = ['cherry', 'strawberry', 'orange'] 
            self.type = random.choice(fruit_types)
        else:
            self.type = fruit_type
            
        # Assign points based on type (10, 20, 30)
        if self.type == 'cherry':
            self.points = 10
            self.color = (255, 0, 0)
        elif self.type == 'strawberry':
            self.points = 20
            self.color = (255, 165, 0)
        elif self.type == 'orange':
            self.points = 30
            self.color = (128, 0, 128)
        else:
            self.points = 0
            self.color = (255, 255, 255)

        # --- Load Fruit Sprite (Simplified to one main sprite for all) ---
        self.image = None
        try:
            # Assuming a single cherry.png file, scaled to CELL_SIZE
            temp_image = pygame.image.load(FRUIT_CHERRY_SPRITE).convert_alpha()
            self.image = pygame.transform.scale(temp_image, (CELL_SIZE, CELL_SIZE))
        except pygame.error as e:
            # Fallback will use the colored circle
            pass 
            
    @property
    def score(self):
        return self.points

    def draw(self, screen):
        """Draw the fruit on the screen, using sprite if available, else a circle."""
        
        draw_x = self.x * CELL_SIZE
        draw_y = self.y * CELL_SIZE

        if self.image:
            # Draw using sprite
            screen.blit(self.image, (draw_x, draw_y))
        else:
            # Fallback to drawing a colored circle
            fx = draw_x + CELL_SIZE // 2
            fy = draw_y + CELL_SIZE // 2
            pygame.draw.circle(screen, self.color, (fx, fy), CELL_SIZE // 3)