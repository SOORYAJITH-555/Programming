# ghost.py (Simplified to load a single character image)

import pygame
import time
from settings import *
# Removed: from spritesheet import SpriteSheet

class Ghost:
    def __init__(self, x, y, maze, color=RED, algorithm="bfs"):
        self.x = x
        self.y = y
        self.maze = maze
        self.color = color 
        self.radius = CELL_SIZE // 2 - 2
        self.path = []
        self.algorithm = algorithm
        
        self.velocity = GHOST_SPEED
        self.last_move_time = time.time()

        # --- Single Image Setup ---
        self.current_sprite = None
        try:
            # Load the single Ghost image (assuming it's red)
            temp_img = pygame.image.load("assets/images/ghost_sprites.png").convert_alpha()
            self.current_sprite = pygame.transform.scale(temp_img, (CELL_SIZE, CELL_SIZE))
        except pygame.error as e:
            print(f"ERROR: Could not load ghost sprite. Using circle fallback. {e}")
            self.current_sprite = None

    def _set_current_sprite(self):
        """This function now only updates the primitive color, not the sprite."""
        # We rely entirely on the base sprite being loaded and drawn.
        pass
            
    def update(self, player_pos, algorithm_func):
        current_time = time.time()
        
        # We no longer call _set_current_sprite here as it does nothing but confuse things.

        if current_time - self.last_move_time >= 1 / self.velocity:
            self.last_move_time = current_time

            start_pos = (self.x, self.y)
            self.path = algorithm_func(self.maze.grid, start_pos, player_pos)

            if self.path:
                next_pos = self.path[0]
                new_x, new_y = next_pos
                
                new_x = new_x % GRID_WIDTH
                new_y = new_y % GRID_HEIGHT
                
                if not self.maze.is_wall(new_x, new_y):
                    self.x, self.y = new_x, new_y

    def draw(self, screen):
        draw_x = self.x * CELL_SIZE
        draw_y = self.y * CELL_SIZE
        
        # 1. Draw the path (Visualization/Debug)
        path_color_rgb = self.color
        path_color_translucent = path_color_rgb + (70,) 
        
        for px, py in self.path:
            rect = pygame.Rect(px * CELL_SIZE, py * CELL_SIZE, CELL_SIZE, CELL_SIZE)
            s = pygame.Surface((CELL_SIZE, CELL_SIZE), pygame.SRCALPHA)
            s.fill(path_color_translucent)
            screen.blit(s, rect)

        # 2. Draw the ghost sprite or circle fallback
        if self.current_sprite is not None:
            screen.blit(self.current_sprite, (draw_x, draw_y))
        else:
            gx = draw_x + CELL_SIZE // 2
            gy = draw_y + CELL_SIZE // 2
            pygame.draw.circle(screen, self.color, (gx, gy), self.radius)