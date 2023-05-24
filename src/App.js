import React, { useEffect } from 'react';
import Board from './Board.js';
import Keyboard from './keyboard.js';
import Header from './Header.js';
import WinnerPopup from './WinnerPopup.js';
import './App.css';
import data from './words.json';
import { updateTopRow, updateBottomRow } from './ReviewCircles.js'
import allWords from './allwords.txt';
import ErrorPopup from './ErrorPopup.js';


function App() {

  var currentBox = 'n/a';
  var message = 'default';
  var greenresults = [];
  var yellowresults = [];
  var keyboardActive = true;
  window.addEventListener('keydown', handleKeyPress());

  window.onload = function() {
    findWordForCurrentDate();
  };
  
  

  function findWordForCurrentDate() {
    // Get the current date
    const currentDate = new Date().toLocaleDateString('en-US', { timeZone: 'Europe/London' });
  
    const words = data.words;
    const wordObj = words.find(obj => obj.date === currentDate);
    if (wordObj) {
      // Word found for the current date
      return wordObj.word;
    } else {
      // Word not found for the current date
      console.log(`No word found for ${currentDate}`);
    }
  }
  

  function getNextBox(box) {
    if (box == 'n/a') {
      return 'box-1-0';
    }
    var [row, column] = box.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
    var nextColumn = column >= 4 ? 4 : column + 1;
    var nextRow = row;
    return `box-${nextRow}-${nextColumn}`; // Return the ID of the next box
    
  }

  function nextRow(box) {
    var [row, column] = box.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
    var nextColumn = 0;
    var nextRow = row + 1;
    if (nextRow > 6) {
      console.log("End of game");
      nextRow = 6;
    }
    return `box-${nextRow}-${nextColumn}`; // Return the ID of the next box
  }
  
  function getPreviousBox(box) {
    var [row, column] = box.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
    var previousColumn = column >= 1 ? column - 1 : 0; // Decrement the column or wrap around to the last column
    var previousRow = row; // Decrement the row if wrapping around to the last column
  
    return `box-${previousRow}-${previousColumn}`; // Return the ID of the previous box
  }

  function checkFullRow() {
    const box = document.querySelector('#' + currentBox);
    if (box == null) {
      return false
    } else {
      var [row, column] = currentBox.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
      //Check if in last box of row
      if (column ==  4) {
        //Check if last box has got a character in
        if (box.textContent != '') {
          //Check if row contains a real word
          checkWordAvailability(row)
          .then(result => {
            if (result == true) {
              //Row is full and contains real word so update row color
              updateBoxRowColor(row);
              updateKeyboardColor(row);
              //Check if it is correct answer
              if (checkAnswer() == true) {
                console.log('CORRECT');
                //Show winning message
                showOverlay();
              } else {
                //Not correct word so move onto next row
                currentBox = nextRow(currentBox);
              }
            } else {
              flashErrorOverlay();
            }
          })
          .catch(error => {
            console.error('An error occurred:', error);
          });
        }
      }
    }
  }

  function checkWordAvailability(row) {
    const box1 = document.querySelector(`#box-${row}-1`).textContent;
    const box2 = document.querySelector(`#box-${row}-2`).textContent;
    const box3 = document.querySelector(`#box-${row}-3`).textContent;
    const box4 = document.querySelector(`#box-${row}-4`).textContent;
    const word = box1 + box2 + box3 + box4;
    var textByLine = '';
    // Fetch the text file containing the list of words
    return new Promise((resolve, reject) => {
      fetch(allWords)
        .then(r => r.text())
        .then(text => {
          textByLine = text.split('\n')
          resolve(textByLine.includes(word));
        })
        .catch(error => {
          reject(error);
        });
    });
  }

  function updateBoxRowColor(rowNumber) {
    const boxes = document.querySelectorAll('.box');  
    boxes.forEach((box) => {
      var [row, column] = box.id.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
      if (row == rowNumber) {
        box.style.backgroundColor = 'rgb(230, 230, 230)';
      }
    });
  }

  function updateKeyboardColor(rowNumber) {
    const boxes = document.querySelectorAll('.box');  
    boxes.forEach((box) => {
      var [row, column] = box.id.split('-').slice(1).map(Number); // Extract row and column numbers from the box ID
      if (row == rowNumber) {
        document.querySelector(`.keyboard button[data-key="${box.textContent}"]`).style.backgroundColor = 'rgb(200, 200, 200)';
      }
    });
  }

  function evaluateGuess(rowNumber, guess, todaysWord) {
    var samePositionCount = 0;
    var mutualNotSamePositionCount = 0;
    var answerLetters = guess.split('');
    var todaysWordLetters = todaysWord.split('');

    // Count the letters in the same position
    for (var i = 0; i < answerLetters.length; i++) {
      if (answerLetters[i] === todaysWordLetters[i]) {
        samePositionCount++;
        todaysWordLetters[i] = null;
        answerLetters[i] = null;
      }
    }

    // Count the mutual letters not in the same position
    for (let i = 0; i < answerLetters.length; i++) {
      const letter = answerLetters[i];
      const index = todaysWordLetters.indexOf(letter);

      if (index !== -1 && letter != null) {
        mutualNotSamePositionCount++;
        answerLetters[i] = null;
        todaysWordLetters[index] = null; // Mark the letter as visited to avoid counting it multiple times
      }
    }

    updateReviewCircles(rowNumber, mutualNotSamePositionCount, samePositionCount);
  }

  function updateReviewCircles(rowNumber, mutualNotSamePositionCount, samePositionCount) {
    greenresults.push(samePositionCount);
    yellowresults.push(mutualNotSamePositionCount);
    const reviewCirclesClassName = `.reviewCircles${rowNumber}`
    const topRowElements = document.querySelectorAll(reviewCirclesClassName + ' .topRow');
    const bottomRowElements = document.querySelectorAll(reviewCirclesClassName + ' .bottomRow');
    updateTopRow(topRowElements, mutualNotSamePositionCount);
    updateBottomRow(bottomRowElements, samePositionCount);
  }
  
  function checkAnswer() {
    var [row, column] = currentBox.split('-').slice(1).map(Number);
    const todaysWord = findWordForCurrentDate();
    const box1 = document.querySelector(`#box-${row}-1`).textContent;
    const box2 = document.querySelector(`#box-${row}-2`).textContent;
    const box3 = document.querySelector(`#box-${row}-3`).textContent;
    const box4 = document.querySelector(`#box-${row}-4`).textContent;
    const answer = box1 + box2 + box3 + box4;
    evaluateGuess(row, answer, todaysWord);
    if (answer == todaysWord) {
      keyboardActive = false;
      return true
    } else { 
      return false
    }
    
  }

  function handleKeyPress(key) {
    if (keyboardActive == true) {
      const boxes = document.querySelectorAll('.box');  
      if (key == 'delete') {
        boxes.forEach((box) => {
          if (box.id == currentBox) {
            box.textContent = '';
          }
        });
        currentBox = getPreviousBox(currentBox);
      } else if (key == 'enter') {
        checkFullRow();
      } else {
        currentBox = getNextBox(currentBox);
  
        boxes.forEach((box) => {
          if (box.id == currentBox) {
            if (box.textContent == '') {
              box.textContent = key;
            }
          }
        });
      }
    } else {
      showOverlay();
    }
  }

  function showOverlay() {
    const overlay = document.querySelector('#overlay');
    if (overlay != null) {
      overlay.style.display = 'flex';
    }
  }

  function hideOverlay(overlayName) {
    const overlay = document.querySelector(overlayName);
    if (overlay != null) {
      overlay.style.display = 'none';
    }
  }

  function flashErrorOverlay() {
    const overlay = document.querySelector('#erroroverlay');

    overlay.style.display = 'flex';

    setTimeout(() => {
      overlay.style.display = 'none';
    }, 1000);
  }

  function shareMessage() {
    const currentDate = new Date().toLocaleDateString('en-US', { timeZone: 'Europe/London' });
    const words = data.words;
    const wordObj = words.find(obj => obj.date === currentDate);
    if (wordObj == null) {
      return 'error'
    }
    const specificDateObj = new Date('5/24/2023');
    const currentDateObj = new Date();
    const timeDifference = currentDateObj - specificDateObj;
    const daysPassed = Math.floor(timeDifference / (24 * 60 * 60 * 1000)) + 1;

    var [row, column] = currentBox.split('-').slice(1).map(Number);
    var messageTitle = `MasterWordle\nDay ${daysPassed}, ${row}/6\n`;
    var finalMessage = messageTitle;
    for (var i = 0; i < row; i++) {
      finalMessage = finalMessage + `\n ${greenresults[i]}🟢 ${yellowresults[i]}🟡`
    }
    message = finalMessage;
    return finalMessage;
  }


  return (
    <div>
      <div class="header">
        <Header />
      </div>
      <div className="app-module" role="group">
        <WinnerPopup hideOverlay={hideOverlay} getMessage={shareMessage} />
        <ErrorPopup />
        <Board currentBox={currentBox} />
        <Keyboard handleKeyPress={handleKeyPress} />
      </div>
    </div>
  );
}

export default App;
