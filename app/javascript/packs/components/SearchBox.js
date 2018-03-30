import React, { Component } from 'react';
import Picker from '../components/Picker';

const RESOURSES =[
  'Resumes',
  'Vacancies'
]

export default class SearchBox extends Component {
  constructor(props) {
    super(props);

    this.state = {
      text: this.props.search
    }
  }

  render() {
    const { text } = this.state;

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
}
