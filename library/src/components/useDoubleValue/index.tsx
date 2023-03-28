import { useState } from 'react';

// const useDoubleValue = useState;
type DoubleValueOUT = [a: number, b: (c: number) => void];

const useDoubleValue = (defaultValue: number): DoubleValueOUT => {
  const [double, setDouble]: DoubleValueOUT = useState(defaultValue * 2);

  const cb = (value: number) => {
    console.log('==>> recebi', value);
    setDouble(value * 2);
  };

  const out: DoubleValueOUT = [double, cb];

  return out;
};

export default useDoubleValue;
