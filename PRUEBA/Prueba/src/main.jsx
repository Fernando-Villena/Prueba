// Importa createRoot desde react-dom/client
import { createRoot } from 'react-dom/client';
import React from 'react';
import { Provider } from 'react-redux';
import store from './store';
import App from './App';

// Utiliza createRoot en lugar de ReactDOM.render
const root = createRoot(document.getElementById('root'));

root.render(
  <Provider store={store}>
    <App />
  </Provider>
);
