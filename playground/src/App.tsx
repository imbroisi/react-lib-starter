import React from 'react';
import './App.css';
import { HoverImage, useDoubleValue } from '@your-npm-repo-name/react-starter-lib';

function App() {
  const [double, setDouble] = useDoubleValue(1);

  return (
    <div className="App">
      <header className="App-header">
        <div>
          Hello! Here is the main App.
          <br />
          <br />
          <br />
          Bellow is an imported component.
        </div>
        <HoverImage
          src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcX_rwuMH3bgloMb8cw45_4I4fVmtQ022TDtIkP6hOFxNFNTWTcVWV4m_qrcA2ye4v9m8&usqp=CAU"
          alt=""
          style={{}}
          className={''}
        />
        Here back to the main App.
        <br />
        <br />
        <br />
        {double}
        <button onClick={() => setDouble(double)}>Click to call the imported hook</button>
      </header>
    </div>
  );
}

export default App;

