import pygame
 
pygame.init()
 
width, height = 640, 480
screen = pygame.display.set_mode((width, height))

time = pygame.time.Clock()

x, y = 100, 100

x1, y1 = 200, 200

xDistance = x1 - x
yDistance = y1 - y

speed = 50
ticks = 0

while True:
    screen.fill((255, 255, 255))
    
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
    
    
    character = pygame.Rect(x, y, 20, 20)    
    pygame.draw.rect(screen, (255, 0, 0), character)
    
    x += speed * (ticks/1000)
    ticks = time.tick(30)

    pygame.display.flip()

