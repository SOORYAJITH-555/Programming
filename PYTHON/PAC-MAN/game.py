# game.py
import asyncio
import pygame
import sys
import random
import time
from settings import *
from maze import Maze
from player import Player
from ghost import Ghost
from fruits import Fruit
from algorithms import bfs, astar # Import specific functions

class Game:
    def __init__(self):
        pygame.init()
        # SCREEN_WIDTH and SCREEN_HEIGHT are now fixed based on the largest map size
        self.screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
        pygame.display.set_caption(TITLE)
        self.clock = pygame.time.Clock()
        self.running = True

        self.maze = Maze()
        # Player and Ghost are initialized with dummy start values; positions are set dynamically
        self.player = Player(1, 1, self.maze) 
        self.ghost = Ghost(GRID_WIDTH - 2, 1, self.maze, color=RED, algorithm="bfs") 

        self.score = 0
        self.level = 1
        self.MAX_LEVEL = MAX_LEVEL
        self.level_up_score_threshold = 100 

        self.food = []
        self.fruits = []
        
        self.game_over = False 
        self.win = False       
        
        self.level_cleared = False
        self.level_cleared_timer = 0
        self.level_cleared_duration = FPS * 2

        self.initialize_level_content()
        self.update_ghost_ai()

    def initialize_level_content(self):
        """Sets up the current level map, entities, food, and fruits with random placement."""
        
        # 1. Generate the map (dynamic difficulty)
        self.maze.generate(self.level)
        
        # 2. Reset Player and Ghost positions
        self.player.x, self.player.y = 1, 1
        self.ghost.x, self.ghost.y = GRID_WIDTH - 2, 1 
        self.player.next_move = None
        self.ghost.path = []
        self.player.current_direction = (1, 0) # Start facing right
        
        # 3. Find ALL available path tiles
        all_path_tiles = []
        for r in range(GRID_HEIGHT):
            for c in range(GRID_WIDTH):
                # Ensure the tile is a path (0) and not an entity starting position
                if self.maze.grid[r][c] == 0 and \
                   (c, r) != (self.player.x, self.player.y) and \
                   (c, r) != (self.ghost.x, self.ghost.y):
                    all_path_tiles.append((c, r))
        
        # --- CRITICAL FIX: Random Fruit Placement ---
        num_fruits = 5
        
        # 4. Randomly select tiles for fruits
        num_fruits_to_place = min(num_fruits, len(all_path_tiles))
        fruit_positions = random.sample(all_path_tiles, num_fruits_to_place)
        
        # 5. The rest of the tiles are for pellets (food)
        self.food = [tile for tile in all_path_tiles if tile not in fruit_positions]
        
        # 6. Initialize Fruit objects
        self.fruits = []
        fruit_types_list = ['cherry', 'strawberry', 'orange']
        
        for pos in fruit_positions:
            fruit_type = random.choice(fruit_types_list)
            self.fruits.append(Fruit(pos[0], pos[1], fruit_type))

        self.level_cleared = False
        self.level_cleared_timer = 0
        
    def update_ghost_ai(self):
        """Sets the ghost's algorithm and color based on the current level progression."""
        # Colors match the generated sprite sheet indices
        if self.level in [1, 2]:
            self.ghost.algorithm = "bfs"
            self.ghost.color = (255, 192, 203) # Pink (BFS)
        elif self.level in [3, 4]:
            self.ghost.algorithm = "astar"
            self.ghost.color = RED # Red (A*)
        else:
            self.ghost.algorithm = "astar" 
            self.ghost.color = CYAN

    def get_algorithm_func(self):
        """Returns the function reference for the current ghost algorithm."""
        if self.ghost.algorithm == "bfs":
            return bfs
        elif self.ghost.algorithm == "astar":
            return astar
        return bfs # Default fallback

    def check_progression(self):
        """Checks for map cleared and score threshold for level advancement."""
        
        if not self.food and not self.fruits and not self.level_cleared:
            self.level_cleared = True
            self.level_cleared_timer = self.level_cleared_duration
            print(f"Level {self.level} Map Cleared!")

        if self.level_cleared:
            self.level_cleared_timer -= 1
            if self.level_cleared_timer <= 0:
                
                if self.level < self.MAX_LEVEL and self.score >= self.level_up_score_threshold:
                    self.level += 1
                    self.level_up_score_threshold += 100 
                    self.update_ghost_ai()
                    self.initialize_level_content()
                    print(f"Level Up! New Level: {self.level}. AI: {self.ghost.algorithm.upper()}")
                
                elif self.level == self.MAX_LEVEL and self.score >= self.level_up_score_threshold:
                    self.win = True
                
                else:
                    self.initialize_level_content() 
                    print(f"Score ({self.score}) needed for next level ({self.level_up_score_threshold}) not met. Re-initializing map content.")

    def run(self):
        while self.running:
            self.handle_events()
            self.update()
            self.draw()
            self.clock.tick(FPS)

        pygame.quit()
        sys.exit()

    def handle_events(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self.running = False
            self.player.handle_input(event)
            if event.type == pygame.KEYDOWN and event.key == pygame.K_ESCAPE:
                self.running = False

    def update(self):
        if self.game_over or self.win:
            return
        
        if self.level_cleared:
            self.check_progression()
            return

        self.player.update()
        player_pos = (self.player.x, self.player.y)
        
        algorithm_func = self.get_algorithm_func()
        self.ghost.update(player_pos, algorithm_func)

        # Eating Food/Fruits
        if player_pos in self.food:
            self.food.remove(player_pos)
            self.score += 1 

        fruit_to_remove = None
        for fruit in self.fruits:
            if player_pos == (fruit.x, fruit.y):
                self.score += fruit.points
                fruit_to_remove = fruit
                break
        
        if fruit_to_remove:
            self.fruits.remove(fruit_to_remove)

        self.check_progression()

        # Check Ghost collision
        if self.player.x == self.ghost.x and self.player.y == self.ghost.y:
            self.game_over = True

    def draw(self):
        self.screen.fill(BLACK)
        self.maze.draw(self.screen)

        # Draw food/pellets
        for fx, fy in self.food:
            px = fx * CELL_SIZE + CELL_SIZE // 2
            py = fy * CELL_SIZE + CELL_SIZE // 2
            pygame.draw.circle(self.screen, WHITE, (px, py), 2) 

        # Draw fruits
        for fruit in self.fruits:
            fruit.draw(self.screen)

        # Draw player and ghost (Entities blink if level is cleared)
        blink_condition = not self.level_cleared or (self.level_cleared_timer % 10 < 5)

        if blink_condition:
             self.player.draw(self.screen)
             self.ghost.draw(self.screen)

        # Draw score and UI
        font = pygame.font.SysFont(None, 30)
        
        score_text = font.render(f"Score: {self.score}", True, WHITE)
        self.screen.blit(score_text, (10, SCREEN_HEIGHT - 30))

        level_text = font.render(f"Level: {self.level} / {self.MAX_LEVEL}", True, YELLOW)
        self.screen.blit(level_text, (10, SCREEN_HEIGHT - 60))

        threshold_text = font.render(f"Next Level @{self.level_up_score_threshold}", True, WHITE)
        self.screen.blit(threshold_text, (SCREEN_WIDTH - 250, SCREEN_HEIGHT - 60))

        alg_text = font.render(f"Ghost AI: {self.ghost.algorithm.upper()}", True, self.ghost.color)
        self.screen.blit(alg_text, (SCREEN_WIDTH - 250, SCREEN_HEIGHT - 30))

        # Draw game state messages
        if self.game_over:
            over_text = font.render("GAME OVER! Press ESC to quit.", True, RED)
            self.screen.blit(over_text, (SCREEN_WIDTH // 4, SCREEN_HEIGHT // 2))
        elif self.win:
            win_text = font.render("ULTIMATE VICTORY! Game Complete!", True, YELLOW)
            self.screen.blit(win_text, (SCREEN_WIDTH // 8, SCREEN_HEIGHT // 2))
        elif self.level_cleared and self.level < self.MAX_LEVEL:
            win_text = font.render("MAP CLEARED! LOADING NEXT LEVEL...", True, YELLOW)
            self.screen.blit(win_text, (SCREEN_WIDTH // 8, SCREEN_HEIGHT // 2))


        pygame.display.flip()


async def main():
    game = Game()
    game.run()

if __name__ == "__main__":
    asyncio.run(main())