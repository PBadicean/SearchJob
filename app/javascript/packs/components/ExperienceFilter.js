import React, { Component } from 'react';
import { connect } from 'react-redux';
import { setFilter } from '../actions';

const experiences = ['No expericence years', 'From 1 to 3 years', 'From 3 to 6 years'];

export class ExperienceFilter extends Component {
  state = {
    currentIndex: ''
  }

  render() {
    return (
      <div className="form-group">
        <h6>Experience</h6>
        <div className="list-group" id="list-tab" role="tablist">
          {
            experiences.map((experience, i) => {
              return (
                <a
                  href='#'
                  key={experience}
                  className={
                    this.state.currentIndex == i
                      ? 'list-group-item list-group-item-action active'
                      : 'list-group-item list-group-item-action'
                  }
                  onClick={(e) => {
                    e.preventDefault();
                    this.setState({currentIndex: i});
                    this.props.setFilter('experience', i);
                  }}
                > {experience}
                  <br/>
                </a>
              );
            })
          }
        </div>
      </div>
    );
  }
}

export default connect(null, {setFilter})(ExperienceFilter);
