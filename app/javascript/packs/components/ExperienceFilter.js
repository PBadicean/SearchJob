import React, { Component } from 'react';

export default class ExperienceFilter extends Component {
  render(){
    return (
      <div className="form-group">
        <h6>Experience</h6>
        <a href="#">No years</a>
        <br/>
        <a href="#">1 - 3 years</a>
        <br/>
        <a href="#">3 - 6 years</a>
      </div>
    );
  }
}
