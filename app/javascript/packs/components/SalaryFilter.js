import React from 'react';
import { connect } from 'react-redux';
import { setFilter } from '../actions';

function SalaryFilter(props) {
  return (
    <div className="form-group">
      <h6>Salary</h6>
      <div className="form-row">
        <div className="col-md-6">
          <label>start</label>
          <input
            type="number"
            className="form-control"
            onChange={(e) => {
              e.preventDefault();
              props.setFilter('salary_min', e.target.value);
            }}
          />
        </div>

        <div className="col-md-6">
          <label>end</label>
          <input
            type="number"
            className="form-control"
            onChange={(e) => {
              e.preventDefault();
              props.setFilter('salary_max', e.target.value);
            }}
          />
        </div>
      </div>
    </div>
  );
}

export default connect(null, { setFilter })(SalaryFilter);
