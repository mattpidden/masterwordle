import React from 'react';
import './Header.css'

function Header() {
  const gameName = "MasterWordle";
  const currentDate = new Date().toLocaleDateString();
  return(
    <header>
      <h1>{gameName}</h1>
    </header>
  );
}

export default Header;