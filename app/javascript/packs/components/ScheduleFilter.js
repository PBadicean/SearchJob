import React, { Component } from 'react';
import { connect } from 'react-redux';
import { setFilter } from '../actions';

export class ScheduleFilter extends Component {
  state = {
    currentIndex: ''
  }

  render() {
    return (
      <div className="form-group">
        <h6>Schedule</h6>
        {
          Object.keys(this.props.schedules).map((schedule, i) => {
            return (
              <a
                href="#"
                key={schedule}
                className={
                  this.state.currentIndex == i
                    ? 'list-group-item list-group-item-action active'
                    : 'list-group-item list-group-item-action'
                }
                onClick={(e) => {
                  e.preventDefault();
                  this.setState({currentIndex: i});
                  this.props.setFilter('schedule', schedule);
                }}
              > {schedule}
              </a>
            );
          })
        }
      </div>
    );
  }
}

export default connect(null, {setFilter})(ScheduleFilter);
