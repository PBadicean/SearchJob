import { combineReducers } from 'redux';
import { FETCH_MENUS, FETCH_VACANCIES, SET_FILTER } from '../actions';

const vacanciesState = {
  items: []
};

const menusState = {
  categories: [],
  schedules: {}
};

function vacanciesReducer(state = vacanciesState, action) {
  switch (action.type) {
    case FETCH_VACANCIES:
      return Object.assign({}, state, { items:  action.payload });
    default:
      return state;
  }
}

function menusReducer(state = menusState, action) {
  switch (action.type) {
    case FETCH_MENUS:
      return Object.assign({}, state, action.payload);
    default:
      return state;
  }
}

function filterReducer(state = {}, action) {
  switch (action.type) {
    case SET_FILTER: {
      const { key, value } = action;
      const nextState = {};

      nextState[key] = value;
      return {...state, ...nextState};
    }

    default: {
      return state;
    }
  }
}

export default combineReducers({
  vacancies: vacanciesReducer,
  menus: menusReducer,
  filter: filterReducer
});
