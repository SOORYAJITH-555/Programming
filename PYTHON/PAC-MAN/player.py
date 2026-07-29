# player.py

import time
import pygame
from settings import *
# Removed: from spritesheet import SpriteSheet (for simple image loading)

class Player:
    def __init__(self, x, y, maze):
        self.x = x 
        self.y = y 
        self.maze = maze
        self.radius = CELL_SIZE // 2 - 2
        
        self.velocity = PACMAN_SPEED  # Tiles per second
        self.last_move_time = time.time()

        self.next_move = None
        self.current_direction = (1, 0) # Start facing right (CRITICAL for initial movement/rotation)

        # --- Single Image Setup ---
        self.sprite_image = None
        self.rotated_image = None
        self.angle = 0
        
        try:
            # Load the single Pac-Man image directly
            temp_img = pygame.image.load("assets/images/pacman_sprites.png").convert_alpha()
            self.sprite_image = pygame.transform.scale(temp_img, (CELL_SIZE, CELL_SIZE))
            self.rotated_image = self.sprite_image.copy()
        except pygame.error as e:
            self.sprite_image = None

    def handle_input(self, event):
        """Sets the next desired direction (one-step movement only)"""
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_LEFT:
                self.next_move = (-1, 0)
            elif event.key == pygame.K_RIGHT:
                self.next_move = (1, 0)
            elif event.key == pygame.K_UP:
                self.next_move = (0, -1)
            elif event.key == pygame.K_DOWN:
                self.next_move = (0, 1)

    def move(self):
        """Moves one step if enough time has passed and the move is valid."""
        current_time = time.time()
        
        # Check if it's time to move (CRITICAL: this must be hit for any movement)
        if current_time - self.last_move_time >= 1 / self.velocity:
            
            # Prioritize the new input direction if one is pending
            move_attempt_dir = self.next_move if self.next_move else self.current_direction 
            
            dx, dy = move_attempt_dir
            
            new_x = self.x + dx
            new_y = self.y + dy
            
            # --- Wraparound logic ---
            new_x_wrapped = new_x % GRID_WIDTH
            new_y_wrapped = new_y % GRID_HEIGHT
            
            # Check for wall collision at the wrapped position
            if not self.maze.is_wall(new_x_wrapped, new_y_wrapped):
                # SUCCESSFUL MOVE
                self.x, self.y = new_x_wrapped, new_y_wrapped
                self.current_direction = (dx, dy) # Update continuous direction
            
            self.next_move = None # Clear input for one-step control
            self.last_move_time = current_time # Reset time whether move was successful or hit a wall

    def update(self):
        self.move()
        self.animate() # Still call animate to handle image rotation

    def animate(self):
        """Updates the image angle based on current direction."""
        if self.sprite_image:
            dx, dy = self.current_direction
            
            if dx == 1: self.angle = 0 # Right
            elif dx == -1: self.angle = 180 # Left
            elif dy == -1: self.angle = 90 # Up
            elif dy == 1: self.angle = 270 # Down
            
            # Store the rotated image for drawing
            self.rotated_image = pygame.transform.rotate(self.sprite_image, self.angle)

    def draw(self, screen):
        draw_x = self.x * CELL_SIZE
        draw_y = self.y * CELL_SIZE
        
        if self.sprite_image:
            screen.blit(self.rotated_image, (draw_x, draw_y))
        else:
            px = draw_x + CELL_SIZE // 2
            py = draw_y + CELL_SIZE // 2
            pygame.draw.circle(screen, YELLOW, (px, py), self.radius)