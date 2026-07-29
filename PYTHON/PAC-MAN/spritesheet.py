# spritesheet.py

import pygame

class SpriteSheet:
    def __init__(self, filename):
        """Load the sheet."""
        try:
            self.sheet = pygame.image.load(filename).convert_alpha()
        except pygame.error as e:
            print(f"Error: Unable to load spritesheet image: {filename}")
            raise SystemExit(e) 

    def get_image(self, x, y, width, height, scale=None):
        """Extract a single image from the sheet."""
        image = pygame.Surface([width, height], pygame.SRCALPHA).convert_alpha()
        image.blit(self.sheet, (0, 0), (x, y, width, height))
        
        if scale:
            # Use basic scale, relying on CELL_SIZE being an integer multiple of sprite size
            image = pygame.transform.scale(image, scale)
        return image