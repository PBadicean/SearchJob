import React, { Component } from 'react';

export default class SalaryFilter extends Component {
  render(){
    return (
      <div className="form-group">
        <h6>Salary</h6>
        <div className="form-row">
          <div className="col-md-5">
            <label>start</label>
            <input type="number" className="form-control"/>
          </div>

          <div className="col-md-5">
            <label>end</label>
            <input type="number" className="form-control"/>
          </div>
        </div>
      </div>
    );
  }
}
