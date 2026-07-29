# settings.py

# --- Screen & Grid Dimensions ---
# CRITICAL FIX: Set CELL_SIZE to 32 for perfect 2x scaling of 16x16 sprites
CELL_SIZE = 32          # Grid cell size

# Max dimensions a maze can be (These define the fixed window size)
MAX_MAZE_COLUMNS = 30
MAX_MAZE_ROWS = 22

# Calculate fixed screen dimensions. +60 for score/level UI.
SCREEN_WIDTH = MAX_MAZE_COLUMNS * CELL_SIZE  # 960
SCREEN_HEIGHT = MAX_MAZE_ROWS * CELL_SIZE + 60 # 764

# Calculate grid dimensions based on fixed screen size and cell size
GRID_WIDTH = SCREEN_WIDTH // CELL_SIZE
GRID_HEIGHT = (SCREEN_HEIGHT - 60) // CELL_SIZE # Subtract UI area

# --- Movement & Progression Constants ---
PACMAN_SPEED = 8  # Moves per second (10 tiles/sec)
GHOST_SPEED = 4    # Moves per second (8 tiles/sec)
MAX_LEVEL = 4      # Our BFS/A* progression stops at 4

# --- Asset Paths (ASSUMES: assets/images exists and contains PNG files) ---
ASSETS_DIR = 'assets'
IMAGES_DIR = f'{ASSETS_DIR}/images'
PACMAN_SPRITE_SHEET = f'{IMAGES_DIR}/pacman_sprites.png' 
GHOST_SPRITE_SHEET = f'{IMAGES_DIR}/ghost_sprites.png'   
FRUIT_CHERRY_SPRITE = f'{IMAGES_DIR}/cherry.png'        

# Colors (R, G, B)
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
YELLOW = (255, 255, 0)
RED = (255, 0, 0)
BLUE = (0, 0, 255)
CYAN = (0, 255, 255) 

# Game settings
FPS = 60
TITLE = "Pac-Man AI Project"