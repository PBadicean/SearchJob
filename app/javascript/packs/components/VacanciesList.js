import React, { Component } from 'react';

export default class VacanciesList extends Component {
  render(){
    return (
      <div class="list-group">
        <li class="list-group-item list-group-item-action flex-column align-items-start">
          <div class="d-flex w-100 justify-content-between">
            <h4 class="mb-1"><a href="#">Junior Programmer Ruby On Rails</a></h4>
            <small>13 May, 2015</small>
          </div>
          <h6 class="mb-1"><a href="#">Google</a></h6>
          <p>Moscow</p>
        </li>

        <li class="list-group-item list-group-item-action flex-column align-items-start">
          <div class="d-flex w-100 justify-content-between">
            <h4 class="mb-1"><a href="#">Programmer PHP</a></h4>
            <small>18 Aprile, 2017</small>
          </div>
          <h6 class="mb-1"><a href="#">Subito</a></h6>
          <p>Milano</p>
        </li>
      </div>
    )
  }
}
