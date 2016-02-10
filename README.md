# Assignment2
DT228/2 Christmass Assignment

This is a processing sketch my own version of a "Bounce" game.

Game Description:
The user controls a ball, which bounces constantly, by moving it left or right.
The sketch is made using the Box2D library by Daniel Shiffman.
The jump is done using a negative impulse force, that pushes the ball up against gravity.
The left and right movement is done using a wind-like force, rather than decrementing the x value of the ball's vector, which makes it possible for the ball to reach platforms that are farther away.
The ball is also wrapped around the screen.
