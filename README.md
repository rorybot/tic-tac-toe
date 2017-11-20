# Tic-Tac-Toe


## Goal

We were instructed to build a basic tic-tac-toe application. The goal was not to design it as a fully-featured app with a user interface, but instead to focus on good OOD practice, such that the code could be easily understood and then hooked into an interface. The idea was to create something with good, clean logic, that could be easily modified, if need be, or else connected straight to a command-line interface, GUI, or piece of hardware.

This is built purely in Ruby.

## Code analysis

The game operates primarily through the TicTacToe class. This injects Players 1 and 2 (with their respective symbols, as class instance), as well as the Grid (also a class instance). The responsibilites break down like so:

* TicTacToe:
  - generates and stores all other classes
  - Calls the Grid to ask if someone has won, and the Printer to interpret the result
  - Inputs the player, and where they'd like to place a pieces, which then performs the following operations:
    - Returns an Illegal Move if a player tries to go twice in a row
  - Returns Occupied Space if a player tries to take an already filled-in space
  - If it passes these checks, it logs who took a turn (to inform the Illegal Move checker), and then calls the Grid to place the symbol
  - It then calls the Grid to check if the board now contains a Win or a Draw, printing the result, else it returns the state of the board's rows
  - It raises an error if none of the above returns are successfully called
  
  
* Grid:
  - Holds state for the board, as well as performing all logic to store symbols on rows and analyse the state of rows
    - I tried splitting some of these responsibilites out, but it became very convoluted, with TicTacToe having to go through a tortorous process to request anything
  - It can tell you the state of a row or of all rows (depending on whether Row Query is passed an index or not)
  - It can place symbols and look for occupied spaces 
  - It can look for winners, through various permtuations of using the private #every_letter_the_same method
  - It queries draws by performing a #row_query, and then asking if every index in that row is occupied (the success of this method depends on it only being called by TicTacToe *after* a Win Query is made, or else it could recognise a Win as a Draw)
 
* Player:
  - The player is very simple and just holds its symbol, name and how many turns it has taken
 
* Printer:
  - The printer is just a series of strings that can be called if needed
 
  
