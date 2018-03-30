// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import SearchPage from './containers/SearchPage';
import { Provider } from 'react-redux'
import { createStore, applyMiddleware } from 'redux';
import { fetchVacancies } from './actions';
import rootReducer from './reducers';
import thunk from 'redux-thunk';

const store = createStore(
  rootReducer,
  applyMiddleware(thunk)
);

store.dispatch(fetchVacancies());

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <SearchPage />
    </Provider>,
    document.getElementById('root-search'),
  )
})
