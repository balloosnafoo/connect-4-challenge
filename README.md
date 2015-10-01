# Connect Four

At the end of two hours I had a working game, which was modular for board size
and winning length requirement. I spent about one more hour afterwards writing a few
tests and the read me. I think that the key decision that needed to be made was
how to check whether the current board state is a winning one, which I explain
below. I also made the decision to have a player object, despite it having very
little required of it. I did this because it makes future expansion much easier.
For instance, if the game interface assumes that the player is always going to
be driven by user input, then it makes it more time consuming to add a computer
player, whereas if the game assumes that the player object takes care of
everything, then it is easy to add a ComputerPlayer that submits its input to
the game using the interface that is already there.

I enjoyed this challenge, but I have to admit that I have written a
connect four implementation once before in ruby. That implementation can be
found [here](https://github.com/balloosnafoo/app-academy/tree/master/w1d2/connect-4).

### Checking win conditions

The first time I wrote a connect four game, my partner and I made the decision
to check the whole board after each move in order to ensure that we always
knew whether there was a winner. When starting this, however, I realized that
the only difference between the board states before and after a move is the last
placed piece. Therefore, if there is a winner at any point, the last placed
piece must be part of the winning row. For this reason I decided that I would
use a set of vectors and check for winning length rows by moving outward from
the last placed piece.

This solution results in a much better time complexity than the previous
solution. Specifically, my solution has linear complexity with relation to the
length required to make a winning connection. The previous solution would have
require O(nm) time where n is height and m is width. While both solutions take
place in linear time, it is guaranteed to be true that the length of a winning
row is smaller than the area of the board.

Correction: I originally wrote that the solution that checks the entire board
after every play has linear complexity. This is only true if you assume that
the size of the board grows only in one dimension. Realistically the board is
likely to be square or near square, making the previously mentioned solution
quadratic.
