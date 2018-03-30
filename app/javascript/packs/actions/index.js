import axios from 'axios';

export const FETCH_VACANCIES = 'FETCH_VACANCIES';

export const fetchVacancies = () => {
  return dispatch => {
    // todo изучить промисы
    axios.get('http://localhost:3000/api/v1/vacancies')
      .then(function(response) {
          dispatch({
            type: FETCH_VACANCIES,
            payload: response.data
          });
       });
   }
};
