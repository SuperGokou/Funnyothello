# Othello Game App

## Overview

This project is a part of CS 458 and involves creating an app that allows two local, human players to play Othello (Reversi). The app is responsible for updating the game board after each move, keeping score, indicating whose turn it is, and providing an option to start a new game.

## Rules of Othello

- **Board Setup**: Played on an 8x8 grid with initial four disks placed in the center.
- **Game Play**: Players alternate turns placing disks on the board to capture the opponent's pieces.
- **Ending the Game**: The game ends when no valid moves are available, or the board is filled. The player with the most disks on the board wins.

## Functionality Requirements

- **Responsive Layout**: The app should neatly layout and rescale for any phone screen.
- **Game Interaction**: The custom view should display the Othello board and accept tap inputs for moves.
- **Legal Moves Only**: The app should only accept legal moves as per the game rules.
- **Score Display**: Current scores for both players should be visible.
- **Turn Indication**: Display whose turn it is.
- **Game Over Detection**: Detect when the game is over and display the winner.
- **New Game Option**: Allow players to start a new game at any time.

## Technologies Used

- **Platform**: iOS / Android (Specify your development platform)
- **Languages**: Swift for iOS, Kotlin or Java for Android
- **Tools**: Xcode for iOS, Android Studio for Android

## Setup and Installation

- **Clone the Repository**: Clone this repository to your local machine.
- **Open and Run**: Open the project in the respective IDE and run it on a simulator or physical device.

## Project Structure

- `Model`: Contains logic for game state management (turns, score, board state).
- `View`: Manages the display of the Othello board and player interactions.
- `Controller`: Links the model and view, processing game logic based on player actions.

## Submission

Generate a zip file of your project directory and submit it via Canvas as per your course requirements.

## Grading

- **Style / Compilation**: 10 pts
- **Interface**: 5 pts
- **Game Features**: 35 pts
  - Displays scores and active player: 5 pts
  - Supports starting new games: 5 pts
  - Correct Othello gameplay: 20 pts
- **Extra Credit**: Up to 5 pts
  - Implementing enhanced features such as legal move notifications, displaying all legal moves, support for passing turns, or AI opponents.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
