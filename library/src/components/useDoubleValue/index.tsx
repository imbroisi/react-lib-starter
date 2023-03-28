import { useState } from 'react';

type DoubleValueOUT = [a: number, b: (c: number) => void];

const useDoubleValue = (defaultValue: number): DoubleValueOUT => {
  const [double, setDouble]: DoubleValueOUT = useState(defaultValue * 2);

  const cb = (value: number) => {
    setDouble(value * 2);
  };

  return [double, cb];
};

export default useDoubleValue;
