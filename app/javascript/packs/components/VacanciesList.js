import React from 'react';

function VacanciesList(props) {
  return (
    <div className="list-group">
      {
        props.vacancies.map(vacancy =>
          <li key={vacancy.name}
            className="list-group-item list-group-item-action flex-column align-items-start">
            <div className="d-flex w-100 justify-content-between">
              <h4 className="mb-1"><a href="#">{vacancy.name}</a></h4>
              <small>{vacancy.created_at}</small>
            </div>
            <h6 className="mb-1"><a href="#">{vacancy.company}</a></h6>
            <p>{vacancy.country}</p>
          </li>
        )
      }
    </div>
  );
}

export default VacanciesList;
