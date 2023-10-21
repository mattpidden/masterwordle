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
        const textToCopy = getMessage();
        navigator.clipboard.writeText(textToCopy);
        alert('Copied to clipboard!');
      }
    } catch (error) {
      console.error('Error sharing:', error);
    }
  };

  return(
    <div id="overlay">
      <div id="popup">
        <button type='button' id="closeButton" onClick={() => hideOverlay('#overlay')}>X</button>
        <h2 className='title'></h2>
        <p className='subtitle'></p>
        <p>Share your result with your friends.</p>
        <button type="button" id="shareButton" onClick={handleShare}>Share</button>
      </div>
    </div>

  );
}

export default WinnerPopup;