import pygame

x1 = -2.1
x2 = 0.6
y1 = -1.2
y2 = 1.2
zoom = 100
max_it = 50

image_x = (x2 - x1) * zoom
image_y = (y2 - y1) * zoom

pygame.init()
screen = pygame.display.set_mode((500, 500))
pygame.display.set_caption("Fractal")

for x in range(int(image_x)):
    for y in range(int(image_y)):
        c_reelle = x / zoom + x1
        c_imaginaire = y / zoom + y1
        zr = x / zoom + x1
        zi = y / zoom + y1
        i = 0

        for i in range(max_it):
            if zr**2 + zi**2 < 4:
                zr , zi = zr**2 - zi**2 + c_reelle, 2 * zr * zi + c_imaginaire
                if i == max_it - 1:
                    screen.set_at((x, y), (i, 255, i*255/max_it))
            else:
                screen.set_at((x, y), (0, 0, 0))


pygame.display.flip()
loop = True
while loop:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            loop = False
