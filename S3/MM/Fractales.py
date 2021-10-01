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
screen = pygame.display.set_mode((500,500))
pygame.display.set_caption("Fractale")

for x in range(int(image_x)):
    for y in range(int(image_y)):
        cr = x/zoom+x1
        ci = y/zoom+y1
        zr = 0
        zi = 0
        i = 0

        while (zr*zr + zi*zi < 4 and i < max_it):
            tmp = zr
            zr = zr*zr - zi*zi + cr
            zi = 2*tmp*zi + ci
            i+=i

        if i == max_it:
            screen.set_at((x,y), (255,255,255))
        else:
            screen.set_at((x,y),(0,0,0))
        
    pygame.display.flip()

loop = True;
while loop:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            loop = False