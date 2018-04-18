import axios from 'axios';

export const FETCH_VACANCIES = 'FETCH_VACANCIES';
export const FETCH_MENUS = 'FETCH_MENUS';
export const SET_FILTER = 'SET_FILTER';

const params = {};

export const fetchMenus = () => {
  return dispatch => {
    axios.get('http://localhost:3000/api/v1/menus')
      .then(function(response) {
        dispatch({
          type: FETCH_MENUS,
          payload: response.data
        });
      });
  };
};

export const fetchVacancies = () => {
  return dispatch => {
    axios.get('http://localhost:3000/api/v1/vacancies')
      .then(function(response) {
        dispatch({
          type: FETCH_VACANCIES,
          payload: response.data
        });
      });
  };
};


export const setFilter = (key, value) => (dispatch, getState) => {
  dispatch({
    type: SET_FILTER,
    key, value
  });

  const { salary_min, salary_max, experience, schedule, category } = getState().filter;

  if (salary_min > 0) {
    params['q[salary_min_gt]'] = salary_min;
  }

  if (salary_max > 0) {
    params['q[salary_max_lt]'] = salary_max;
  }

  [0, 1, 2].map(val => {
    if (experience == val) {
      params['q[experience_eq]'] = val;
    }
  });

  if (schedule == 'remote') {
    params['q[schedule_eq]'] = 0;
  } else {
    params['q[schedule_eq]'] = 1;
  }

  params['q[category_id_eq]'] = category;

  axios.get('http://localhost:3000/api/v1/vacancies', {
    params
  }).then(function(response) {
    dispatch({
      type: FETCH_VACANCIES,
      payload: response.data
    });
  });
};
