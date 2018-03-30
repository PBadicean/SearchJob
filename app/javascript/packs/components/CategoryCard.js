import React, { Component } from 'react';

export default class CategoryCard extends Component {
  render(){
    const { categories } = this.props;
    return (
      <div className="list-group">
        {categories.map((category, key) =>
          <a key={key} href="#" className="list-group-item d-flex justify-content-between align-items-center">{category.name}  <span className="badge badge-primary badge-pill">{category.countWork}</span></a>
        )}
    </div>
    );
  }
}
