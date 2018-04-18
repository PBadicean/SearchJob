import React from 'react';
import SearchBox from '../components/SearchBox.js';
import VacancyFilter from '../components/VacancyFilter';
import ResultsFilter from '../components/ResultsFilter';

export default function SearchPage(props) {
  return (
    <div>
      <h1 className="text-center display-4">SearchPage</h1>
      <div className="row">
        <div className="col-sm-3">
          <h3>Filter for Vacancy</h3>
          <VacancyFilter/>
        </div>
        <div className="col-sm-9 list-group">
          <div className="list-group-item">
            <SearchBox search={props.search}/>
          </div>
          <div className="list-group-item">
            <ResultsFilter/>
          </div>
        </div>
      </div>
    </div>
  );
}
