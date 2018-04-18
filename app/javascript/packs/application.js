import React from 'react';
import ReactDOM from 'react-dom';
import SearchPage from './containers/SearchPage';
import { Provider } from 'react-redux';
import { fetchVacancies, fetchMenus } from './actions';
import  store from './store';

store.dispatch(fetchVacancies());
store.dispatch(fetchMenus());

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <SearchPage />
    </Provider>,
    document.getElementById('root-search'),
  );
});
