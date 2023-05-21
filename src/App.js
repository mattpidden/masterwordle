import React from 'react';
import Board from './Board.js';
import Keyboard from './keyboard.js';
import Header from './Header.js';
import './App.css';

function App() {

  var currentBox = 'box-0-0';

  function getNextBox(box) {
    var [row, column] = box.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
    var nextColumn = column < 4 ? column + 1 : 1; // Increment the column or wrap around to the first column
    var nextRow = nextColumn === 1 ? row + 1 : row; // Increment the row if wrapping around to the first column
  
    return `box-${nextRow}-${nextColumn}`; // Return the ID of the next box
  }
  
  function getPreviousBox(box) {
    var [row, column] = box.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
    var previousColumn = column > 1 ? column - 1 : 4; // Decrement the column or wrap around to the last column
    var previousRow = previousColumn === 4 ? row - 1 : row; // Decrement the row if wrapping around to the last column
    if (previousRow < 1) {
      previousRow = 0;
      previousColumn = 0;
    }
  
    return `box-${previousRow}-${previousColumn}`; // Return the ID of the previous box
  }
  

  function handleKeyPress(key) {
    const boxes = document.querySelectorAll('.box');  
    // Loop through each box and update the text with the pressed key
    if (key == 'delete') {
      boxes.forEach((box) => {
        if (box.id == currentBox) {
          box.textContent = '';
        }
      });
      currentBox = getPreviousBox(currentBox);

    } else if (key == 'enter') {

    } else {
      currentBox = getNextBox(currentBox);
      boxes.forEach((box) => {
        if (box.id == currentBox) {
          box.textContent = key;
        }
      });
    }
    
  }

  return (
    <div>
      <div class="header">
        <Header />
      </div>
      <div className="app-module" role="group">
        <Board currentBox={currentBox} />
        <Keyboard handleKeyPress={handleKeyPress} />
      </div>
    </div>
  );
}

export default App;
