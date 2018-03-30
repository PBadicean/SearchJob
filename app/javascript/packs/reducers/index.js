import { combineReducers } from 'redux';

import { FETCH_VACANCIES } from '../actions';

const vacanciesState = {
  items: []
};

function vacanciesReducer(state = vacanciesState, action) {
  switch (action.type) {
    case FETCH_VACANCIES:
      return Object.assign({}, state, { items:  action.payload });
    default:
      return state;
  }
};

export default combineReducers({
  vacancies: vacanciesReducer,
});
