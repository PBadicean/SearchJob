import React, { Component } from 'react';
import SalaryFilter from '../components/SalaryFilter';
import ExperienceFilter from '../components/ExperienceFilter';
import SheduleFilter from '../components/SheduleFilter';
import CategoryFilter from '../components/CategoryFilter';

export default class ResumeFilter extends Component {
  render(){
    return (
      <div className="form-group">
        <SalaryFilter/>
        <ExperienceFilter/>
        <SheduleFilter/>
        <CategoryFilter/>
      </div>
    );
  }
}
