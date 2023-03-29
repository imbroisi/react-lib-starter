import React from 'react';
import { render, screen } from '@testing-library/react';
import HoverImage from '../HoverImage';

describe('Main Div', () => {
  test('should be in document', async () => {
    render(<HoverImage src="https://www.gstatic.com/webp/gallery/4.webp" />);

    const mainDiv = screen.queryByTestId('container');
    expect(mainDiv).toBeInTheDocument();
  });
});
