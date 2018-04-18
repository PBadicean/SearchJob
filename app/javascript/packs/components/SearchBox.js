import React from 'react';
import Picker from '../components/Picker';

const RESOURSES = [
  'Resumes',
  'Vacancies'
];


export default function SearchBox() {
  return (
    <div>
      <form>
        <div className="form-row">
          <div className="col-md-8">
            <input className="form-control"/>
          </div>
          <div className="col-md">
            <Picker options={RESOURSES} />
          </div>
          <div className="col-md">
            <button className="btn btn-danger">Search</button>
          </div>
        </div>
      </form>
    </div>
  );
}
