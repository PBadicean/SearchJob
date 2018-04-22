import React, { Component } from 'react';
import { connect } from 'react-redux';
import { setFilter } from '../actions';

const DEFAULT_LIST_CLASS = 'list-group-item d-flex justify-content-between' +
  ' list-group-item-action align-items-center';

export class CategoryCard extends Component {
  state = {
    currentIndex: ''
  }

  render() {
    return (
      <div className="list-group" id="list-tab" role="tablist">
        {
          this.props.categories.map((category, i) => (
            <a
              href="#"
              key={category.name}
              className={
                this.state.currentIndex == i
                  ? `${DEFAULT_LIST_CLASS} active`
                  : DEFAULT_LIST_CLASS
              }
              onClick={(e) => {
                e.preventDefault();
                this.setState({ currentIndex: i });
                this.props.setFilter('category', category.id);
              }}
            >
              {category.name}
              <span className="badge badge-primary badge-pill">
                {category.countWork}
              </span>
            </a>
          ))
        }
      </div>
    );
  }
}
export default connect(null, { setFilter })(CategoryCard);
