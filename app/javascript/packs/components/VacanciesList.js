import React, { Component } from 'react';

export default class VacanciesList extends Component {
  render(){
    return (
      <ul className="list-group">
        {
          this.props.items.map((vacancy, key) => {
            return (
              <li key={key} className="list-group-item list-group-item-action flex-column align-items-start">
                <div className="d-flex w-100 justify-content-between">
                  <h4 className="mb-1"><a href="#">{vacancy.name}</a></h4>
                <small>13 May, 2015</small>
                </div>
                <h6 className="mb-1"><a href="#">{vacancy.company}</a></h6>
                <p>Moscow</p>
              </li>
            )
          })
        }
      </ul>
    )
  }
}
