import React from 'react';
import Board from './Board.js';
import Keyboard from './keyboard.js';
import './App.css';

function App() {
  return (
    <div class="app-module" role="group">

      <Board />
      <Keyboard />
    </div>
  );
}

export default App;
