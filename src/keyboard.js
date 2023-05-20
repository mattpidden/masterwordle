import './Keyboard.css';

function Keyboard() {
  return (
    <div class="keyboard" role="group">
      <div class="keyboard-top-row">
        <button type="button" data-key="q" class="keyboard-top-row-elements">q</button>
        <button type="button" data-key="w" class="keyboard-top-row-elements">w</button>
        <button type="button" data-key="e" class="keyboard-top-row-elements">e</button>
        <button type="button" data-key="r" class="keyboard-top-row-elements">r</button>
        <button type="button" data-key="t" class="keyboard-top-row-elements">t</button>
        <button type="button" data-key="y" class="keyboard-top-row-elements">y</button>
        <button type="button" data-key="u" class="keyboard-top-row-elements">u</button>
        <button type="button" data-key="i" class="keyboard-top-row-elements">i</button>
        <button type="button" data-key="o" class="keyboard-top-row-elements">o</button>
        <button type="button" data-key="p" class="keyboard-top-row-elements">p</button>
      </div>
      <div class="keyboard-middle-row">
        <button type="button" data-key="a" class="keyboard-middle-row-elements">a</button>
        <button type="button" data-key="s" class="keyboard-middle-row-elements">s</button>
        <button type="button" data-key="d" class="keyboard-middle-row-elements">d</button>
        <button type="button" data-key="f" class="keyboard-middle-row-elements">f</button>
        <button type="button" data-key="g" class="keyboard-middle-row-elements">g</button>
        <button type="button" data-key="h" class="keyboard-middle-row-elements">h</button>
        <button type="button" data-key="j" class="keyboard-middle-row-elements">j</button>
        <button type="button" data-key="k" class="keyboard-middle-row-elements">k</button>
        <button type="button" data-key="l" class="keyboard-middle-row-elements">l</button>
      </div>
      <div class="keyboard-bottom-row">
        <button type="button" data-key="enter" class="keyboard-bottom-row-elements">enter</button>
        <button type="button" data-key="z" class="keyboard-bottom-row-elements">z</button>
        <button type="button" data-key="x" class="keyboard-bottom-row-elements">x</button>
        <button type="button" data-key="c" class="keyboard-bottom-row-elements">c</button>
        <button type="button" data-key="v" class="keyboard-bottom-row-elements">v</button>
        <button type="button" data-key="b" class="keyboard-bottom-row-elements">b</button>
        <button type="button" data-key="n" class="keyboard-bottom-row-elements">n</button>
        <button type="button" data-key="m" class="keyboard-bottom-row-elements">m</button>
        <button type="button" data-key="delete" class="keyboard-bottom-row-elements">delete</button>
      </div>
    </div>
  );
}

export default Keyboard;