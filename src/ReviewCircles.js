import React from 'react';
import './ReviewCircles.css'

function ReviewCircles({ rowNumber, updateTopRow, updateBottomRow }) {



  return (
    <div>
      <div className="row">
        <div className="circle topRow" id="1"></div>
        <div className="circle topRow" id="2"></div>
        <div className="circle topRow" id="3"></div>
        <div className="circle topRow" id="4"></div>
      </div>
      <div className="row">
        <div className="circle bottomRow" id="1"></div>
        <div className="circle bottomRow" id="2"></div>
        <div className="circle bottomRow" id="3"></div>
        <div className="circle bottomRow" id="4"></div>
      </div>
    </div>
  )
}

export function updateTopRow(topRowCircles, number) {
  //const topRowCircles = document.querySelectorAll('.topRow');

  // Loop through each circle in the top row
  topRowCircles.forEach((circle, index) => {
    
    if (index < number) {
      // Set the background color to yellow 
      circle.style.backgroundColor = "yellow";
    } else {
      // Leave the circle as just a border
    }
  });
}

export function updateBottomRow(bottomRowCircles, number) {
  //const bottomRowCircles = document.querySelectorAll('.bottomRow');

  // Loop through each circle in the top row
  bottomRowCircles.forEach((circle, index) => {
    if (index < number) {
      // Set the background color to green 
      circle.style.backgroundColor = 'green';
    } else {
      // Leave the circle as it is
    }
  });
}

export default ReviewCircles
