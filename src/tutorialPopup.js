import React from 'react';
import './tutorialPopup.css'

function tutorialPopup({ hideOverlay }) {

  return(
    <div id="welcomeoverlay">
      <div id="welcomepopup">
        <button type='button' id="xButton" onClick={() => hideOverlay('#welcomeoverlay')}>X</button>
        <h2>Welcome to MasterWordle</h2>
        <p className=''>Developed by Matt Pidden to rival his familiy wordle group chat. It is a perfect mix of Wordle and MasterMind.</p>
        <h3>How to play</h3>
        <p>Enter a 4 letter word.</p>
        <p>A yellow circle means you have a correct letter in the wrong spot.</p>
        <p>A green circle means you have a correct letter in the correct spot.</p>
        <p>If no circles appear, you have no correct letters at all.</p>
        <p>Use this feedback to narrow your guesses and get todays word in 8 goes or less.</p>
        <button type="button" id="playButton" onClick={() => hideOverlay('#welcomeoverlay')}>Play</button>
      </div>
    </div>

  );
}

export default tutorialPopup;