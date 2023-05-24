import './Keyboard.css';

function Keyboard({ handleKeyPress }) {
  return (
    <div className="keyboard" role="group">
      <div className="keyboard-top-row">
        <button type="button" data-key="q" className="keyboard-top-row-elements" onClick={() => handleKeyPress('q')}>q</button>
        <button type="button" data-key="w" className="keyboard-top-row-elements" onClick={() => handleKeyPress('w')}>w</button>
        <button type="button" data-key="e" className="keyboard-top-row-elements" onClick={() => handleKeyPress('e')}>e</button>
        <button type="button" data-key="r" className="keyboard-top-row-elements" onClick={() => handleKeyPress('r')}>r</button>
        <button type="button" data-key="t" className="keyboard-top-row-elements" onClick={() => handleKeyPress('t')}>t</button>
        <button type="button" data-key="y" className="keyboard-top-row-elements" onClick={() => handleKeyPress('y')}>y</button>
        <button type="button" data-key="u" className="keyboard-top-row-elements" onClick={() => handleKeyPress('u')}>u</button>
        <button type="button" data-key="i" className="keyboard-top-row-elements" onClick={() => handleKeyPress('i')}>i</button>
        <button type="button" data-key="o" className="keyboard-top-row-elements" onClick={() => handleKeyPress('o')}>o</button>
        <button type="button" data-key="p" className="keyboard-top-row-elements" onClick={() => handleKeyPress('p')}>p</button>
      </div>
      <div className="keyboard-middle-row">
        <button type="button" data-key="a" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('a')}>a</button>
        <button type="button" data-key="s" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('s')}>s</button>
        <button type="button" data-key="d" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('d')}>d</button>
        <button type="button" data-key="f" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('f')}>f</button>
        <button type="button" data-key="g" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('g')}>g</button>
        <button type="button" data-key="h" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('h')}>h</button>
        <button type="button" data-key="j" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('j')}>j</button>
        <button type="button" data-key="k" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('k')}>k</button>
        <button type="button" data-key="l" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('l')}>l</button>
        <button type="button" data-key="delete" className="keyboard-middle-row-elements" onClick={() => handleKeyPress('delete')}>delete</button>

      </div>
      <div className="keyboard-bottom-row">
        <button type="button" data-key="z" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('z')}>z</button>
        <button type="button" data-key="x" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('x')}>x</button>
        <button type="button" data-key="c" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('c')}>c</button>
        <button type="button" data-key="v" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('v')}>v</button>
        <button type="button" data-key="b" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('b')}>b</button>
        <button type="button" data-key="n" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('n')}>n</button>
        <button type="button" data-key="m" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('m')}>m</button>
        <button type="button" data-key="enter" className="keyboard-bottom-row-elements" onClick={() => handleKeyPress('enter')}>enter</button>
      </div>
    </div>
  );
}

export default Keyboard;