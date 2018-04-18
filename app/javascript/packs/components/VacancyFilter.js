import React from 'react';
import { connect } from 'react-redux';

import SalaryFilter from '../components/SalaryFilter';
import ExperienceFilter from '../components/ExperienceFilter';
import ScheduleFilter from '../components/ScheduleFilter';
import CategoryFilter from '../components/CategoryFilter';

export function VacancyFilter(props) {
  const { schedules, categories } = props.menus;
  return (
    <div className="form-group">
      <SalaryFilter/>
      <ExperienceFilter/>
      <ScheduleFilter schedules={schedules}/>
      <CategoryFilter categories={categories}/>
    </div>
  );
}

function mapStateToProps(state) {
  return {
    menus: state.menus
  };
}

export default connect(mapStateToProps)(VacancyFilter);
