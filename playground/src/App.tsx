import React from 'react';
import './App.css';
import { HoverImage, useDoubleValue } from '@your-npm-repo-name/react-starter-lib';

const App = () => {
  const [double, setDouble] = useDoubleValue(1);

  return (
    <div className="App">
      <header className="App-header">
        <div>
          Hello! Here is the main App.
          <br />
          <br />
          <br />
          Bellow is the imported component.
        </div>
        <HoverImage
          src="https://www.gstatic.com/webp/gallery/4.webp"
          style={{ width: '40%' }}
        />
        Here back to the main App.
        <br />
        <br />
        <br />

        {double}
        
        <button onClick={() => setDouble(double)}>
          Click to use the imported hook
        </button>
      </header>
    </div>
  );
}

export default App;
