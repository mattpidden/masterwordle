import React from 'react';
import './WinnerPopup.css'

function WinnerPopup({ hideOverlay, getMessage }) {

  const handleShare = async () => {
    try {
      if (navigator.share) {
        await navigator.share({
          text: getMessage()
        });
      } else {
        console.log('Web Share API not supported.');
      }
    } catch (error) {
      console.error('Error sharing:', error);
    }
  };

  return(
    <div id="overlay">
      <div id="popup">
        <button type='button' id="closeButton" onClick={() => hideOverlay('#overlay')}>X</button>
        <h2>Congratulations!</h2>
        <button type="button" id="shareButton" onClick={handleShare}>Share</button>
      </div>
    </div>

  );
}

export default WinnerPopup;