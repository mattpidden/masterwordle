import React from 'react';
import './Board.css'

function Board() {
  return (
    <div class="board-container">
      <div class="board">
        <div class="row" id="row-1">
          <div class="box" id="box-1-1"></div>
          <div class="box" id="box-1-2"></div>
          <div class="box" id="box-1-3"></div>
          <div class="box" id="box-1-4"></div>
        </div>
        <div class="row" id="row-2">
          <div class="box" id="box-2-1"></div>
          <div class="box" id="box-2-2"></div>
          <div class="box" id="box-2-3"></div>
          <div class="box" id="box-2-4"></div>
        </div>
        <div class="row" id="row-3">
          <div class="box" id="box-3-1"></div>
          <div class="box" id="box-3-2"></div>
          <div class="box" id="box-3-3"></div>
          <div class="box" id="box-3-4"></div>
        </div>
        <div class="row" id="row-4">
          <div class="box" id="box-4-1"></div>
          <div class="box" id="box-4-2"></div>
          <div class="box" id="box-4-3"></div>
          <div class="box" id="box-4-4"></div>
        </div>
        <div class="row" id="row-5">
          <div class="box" id="box-5-1"></div>
          <div class="box" id="box-5-2"></div>
          <div class="box" id="box-5-3"></div>
          <div class="box" id="box-5-4"></div>
        </div>
        <div class="row" id="row-6">
          <div class="box" id="box-6-1"></div>
          <div class="box" id="box-6-2"></div>
          <div class="box" id="box-6-3"></div>
          <div class="box" id="box-6-4"></div>
        </div>
      </div>
    </div>
  );

}

export default Board;