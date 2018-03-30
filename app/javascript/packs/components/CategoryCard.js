import React, { Component } from 'react';

export default class CategoryCard extends Component {
  render(){
    const { categories } = this.props;
    return (
      <div class="list-group">
        {categories.map(category =>
          <a href="#" class="list-group-item d-flex justify-content-between align-items-center">
            {category.name}
            <span class="badge badge-primary badge-pill">
              {category.countWork}
            </span>
        </a>
        )}
    </div>
    );
  }
}
