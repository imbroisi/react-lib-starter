import React from 'react';
import './App.css';
import { HoverImage, useDoubleValue } from '@imbroisi/react-starter-lib';

function App() {
  const [double, setDouble] = useDoubleValue(1);

  return (
    <div className="App">
      <header className="App-header">
        <HoverImage
          src="https://rollupjs.org/rollup-logo.svg"
          alt=""
          style={{}}
          className={''}
        />
        {double}
        <button onClick={() => setDouble(double)}>Click</button>
      </header>
    </div>
  );
}

export default App;

