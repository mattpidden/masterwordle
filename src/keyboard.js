import './Keyboard.css';

function Keyboard({ handleKeyPress }) {
  return (
    <div className="keyboard" role="group">
      <div className="keyboard-top-row">
        <button type="button" data-key="q" className="keyboard-button" onClick={() => handleKeyPress('q')}>q</button>
        <button type="button" data-key="w" className="keyboard-button" onClick={() => handleKeyPress('w')}>w</button>
        <button type="button" data-key="e" className="keyboard-button" onClick={() => handleKeyPress('e')}>e</button>
        <button type="button" data-key="r" className="keyboard-button" onClick={() => handleKeyPress('r')}>r</button>
        <button type="button" data-key="t" className="keyboard-button" onClick={() => handleKeyPress('t')}>t</button>
        <button type="button" data-key="y" className="keyboard-button" onClick={() => handleKeyPress('y')}>y</button>
        <button type="button" data-key="u" className="keyboard-button" onClick={() => handleKeyPress('u')}>u</button>
        <button type="button" data-key="i" className="keyboard-button" onClick={() => handleKeyPress('i')}>i</button>
        <button type="button" data-key="o" className="keyboard-button" onClick={() => handleKeyPress('o')}>o</button>
        <button type="button" data-key="p" className="keyboard-button" onClick={() => handleKeyPress('p')}>p</button>
      </div>
      <div className="keyboard-middle-row">
        <button type="button" data-key="a" className="keyboard-button" onClick={() => handleKeyPress('a')}>a</button>
        <button type="button" data-key="s" className="keyboard-button" onClick={() => handleKeyPress('s')}>s</button>
        <button type="button" data-key="d" className="keyboard-button" onClick={() => handleKeyPress('d')}>d</button>
        <button type="button" data-key="f" className="keyboard-button" onClick={() => handleKeyPress('f')}>f</button>
        <button type="button" data-key="g" className="keyboard-button" onClick={() => handleKeyPress('g')}>g</button>
        <button type="button" data-key="h" className="keyboard-button" onClick={() => handleKeyPress('h')}>h</button>
        <button type="button" data-key="j" className="keyboard-button" onClick={() => handleKeyPress('j')}>j</button>
        <button type="button" data-key="k" className="keyboard-button" onClick={() => handleKeyPress('k')}>k</button>
        <button type="button" data-key="l" className="keyboard-button" onClick={() => handleKeyPress('l')}>l</button>
      </div>
      <div className="keyboard-bottom-row">
        <button type="button" data-key="enter" className="keyboard-button" onClick={() => handleKeyPress('enter')}>enter</button>
        <button type="button" data-key="z" className="keyboard-button" onClick={() => handleKeyPress('z')}>z</button>
        <button type="button" data-key="x" className="keyboard-button" onClick={() => handleKeyPress('x')}>x</button>
        <button type="button" data-key="c" className="keyboard-button" onClick={() => handleKeyPress('c')}>c</button>
        <button type="button" data-key="v" className="keyboard-button" onClick={() => handleKeyPress('v')}>v</button>
        <button type="button" data-key="b" className="keyboard-button" onClick={() => handleKeyPress('b')}>b</button>
        <button type="button" data-key="n" className="keyboard-button" onClick={() => handleKeyPress('n')}>n</button>
        <button type="button" data-key="m" className="keyboard-button" onClick={() => handleKeyPress('m')}>m</button>
        <button type="button" data-key="delete" className="keyboard-button" onClick={() => handleKeyPress('delete')}>delete</button>
      </div>
    </div>
  );
}

export default Keyboard;