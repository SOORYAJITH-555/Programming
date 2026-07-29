# maze.py

import random
import pygame
from settings import *

class Maze:
    def __init__(self):
        self.walls_set = set() # Store walls as a set of (x, y) tuples
        self.grid = []         # Store map as a grid (0/1) for pathfinding
        self.generate(1)       # Generate initial level 1 map

    def generate(self, level):
        self.walls_set.clear()
        
        # 1. Initialize Grid (all path)
        self.grid = [[0 for _ in range(GRID_WIDTH)] for _ in range(GRID_HEIGHT)]
        
        # 2. Add Boundary Walls
        for x in range(GRID_WIDTH):
            self.walls_set.add((x, 0)); self.grid[0][x] = 1
            self.walls_set.add((x, GRID_HEIGHT - 1)); self.grid[GRID_HEIGHT - 1][x] = 1
            
        for y in range(GRID_HEIGHT):
            self.walls_set.add((0, y)); self.grid[y][0] = 1
            self.walls_set.add((GRID_WIDTH - 1, y)); self.grid[y][GRID_WIDTH - 1] = 1

        # 3. Generate Internal Walls based on level difficulty
        num_walls = (level * 20) 
        
        # Creates blockier walls
        for _ in range(num_walls // 2): 
            start_x = random.randint(2, GRID_WIDTH - 5)
            start_y = random.randint(2, GRID_HEIGHT - 5)
            
            block_width = random.choice([1, 2, 3])
            block_height = random.choice([1, 2])
            
            for bx in range(start_x, start_x + block_width):
                for by in range(start_y, start_y + block_height):
                    if 0 <= bx < GRID_WIDTH -1 and 0 <= by < GRID_HEIGHT -1 and \
                       (bx, by) not in self.walls_set:
                        self.walls_set.add((bx, by))
                        self.grid[by][bx] = 1

        # 4. Create Tunnels (simple left/right)
        tunnel_row = GRID_HEIGHT // 2
        self.walls_set.discard((0, tunnel_row)); self.grid[tunnel_row][0] = 0
        self.walls_set.discard((GRID_WIDTH - 1, tunnel_row)); self.grid[tunnel_row][GRID_WIDTH - 1] = 0

    def is_wall(self, x, y):
        # Use the list-of-lists grid for safe wall check
        if 0 <= y < GRID_HEIGHT and 0 <= x < GRID_WIDTH:
            return self.grid[y][x] == 1
        return True

    def draw(self, screen):
        """Draw maze walls as lined corridors."""
        
        BORDER_COLOR = BLUE
        LINE_THICKNESS = 3 # Thickness of the wall lines
        
        # Iterate over all cells
        for y in range(GRID_HEIGHT):
            for x in range(GRID_WIDTH):
                if self.grid[y][x] == 1:  # Only draw for wall cells
                    
                    wall_x = x * CELL_SIZE
                    wall_y = y * CELL_SIZE
                    
                    # Check neighbors (including boundaries) to draw only the outer lines of the wall block

                    # 1. Check Path/Boundary above (Draw top line)
                    if y == 0 or self.grid[y - 1][x] == 0:
                        pygame.draw.line(screen, BORDER_COLOR, 
                                         (wall_x, wall_y), 
                                         (wall_x + CELL_SIZE, wall_y), 
                                         LINE_THICKNESS)

                    # 2. Check Path/Boundary below (Draw bottom line)
                    if y == GRID_HEIGHT - 1 or self.grid[y + 1][x] == 0:
                        pygame.draw.line(screen, BORDER_COLOR, 
                                         (wall_x, wall_y + CELL_SIZE), 
                                         (wall_x + CELL_SIZE, wall_y + CELL_SIZE), 
                                         LINE_THICKNESS)

                    # 3. Check Path/Boundary to the left (Draw left line)
                    if x == 0 or self.grid[y][x - 1] == 0:
                        pygame.draw.line(screen, BORDER_COLOR, 
                                         (wall_x, wall_y), 
                                         (wall_x, wall_y + CELL_SIZE), 
                                         LINE_THICKNESS)

                    # 4. Check Path/Boundary to the right (Draw right line)
                    if x == GRID_WIDTH - 1 or self.grid[y][x + 1] == 0:
                        pygame.draw.line(screen, BORDER_COLOR, 
                                         (wall_x + CELL_SIZE, wall_y), 
                                         (wall_x + CELL_SIZE, wall_y + CELL_SIZE), 
                                         LINE_THICKNESS)