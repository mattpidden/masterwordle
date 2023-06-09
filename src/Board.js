import React from 'react';
import './Board.css'
import ReviewCircles from './ReviewCircles';
import Keyboard from './keyboard.js';


function Board({ currentBox }) {


  return (
    <div className="board-container">
      <div className="board">
        <div className="row" id="row-1">
          <div className="box" id="box-1-1"></div>
          <div className="box" id="box-1-2"></div>
          <div className="box" id="box-1-3"></div>
          <div className="box" id="box-1-4"></div>
          <div className="reviewCircles1"><ReviewCircles /></div>
        </div>
        <div className="row" id="row-2">
          <div className="box" id="box-2-1"></div>
          <div className="box" id="box-2-2"></div>
          <div className="box" id="box-2-3"></div>
          <div className="box" id="box-2-4"></div>
          <div className="reviewCircles2"><ReviewCircles /></div>
        </div>
        <div className="row" id="row-3">
          <div className="box" id="box-3-1"></div>
          <div className="box" id="box-3-2"></div>
          <div className="box" id="box-3-3"></div>
          <div className="box" id="box-3-4"></div>
          <div className="reviewCircles3"><ReviewCircles /></div>
        </div>
        <div className="row" id="row-4">
          <div className="box" id="box-4-1"></div>
          <div className="box" id="box-4-2"></div>
          <div className="box" id="box-4-3"></div>
          <div className="box" id="box-4-4"></div>
          <div className="reviewCircles4"><ReviewCircles /></div>
        </div>
        <div className="row" id="row-5">
          <div className="box" id="box-5-1"></div>
          <div className="box" id="box-5-2"></div>
          <div className="box" id="box-5-3"></div>
          <div className="box" id="box-5-4"></div>
          <div className="reviewCircles5"><ReviewCircles /></div>
        </div>
        <div className="row" id="row-6">
          <div className="box" id="box-6-1"></div>
          <div className="box" id="box-6-2"></div>
          <div className="box" id="box-6-3"></div>
          <div className="box" id="box-6-4"></div>
          <div className="reviewCircles6"><ReviewCircles /></div>
        </div>
      </div>
    </div>
  );

}

export default Board;