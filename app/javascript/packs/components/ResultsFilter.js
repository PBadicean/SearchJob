import React, { Component } from 'react';
import VacanciesList from '../components/VacanciesList';
import { connect } from 'react-redux';

class ResultsFilter extends Component {
  render(){
    const { vacancies } = this.props
    return (
      <div>
        <div className="row">
          <div className="col-md-8">
            <h4>Searched vacancies {vacancies.length}</h4>
          </div>
          <div className="col-md-4">
            <div className="float-right">
              <select className="custom-select my-1 mr-sm-2">
                <option>Sort for Date</option>
                <option>Sort for salary-big</option>
              </select>
            </div>
          </div>
        </div>
        <VacanciesList vacancies={vacancies}/>
      </div>
    )
  }
}

export default connect((state) => {
  console.log(state);
  return {
    vacancies: state.vacancies.items
  };
})(ResultsFilter);
