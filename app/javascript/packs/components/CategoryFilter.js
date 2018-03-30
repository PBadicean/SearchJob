import React, { Component } from 'react';
import CategoryCard from '../components/CategoryCard';
import { CATEGORIES}  from '../constants/categories.js';

export default class CategoryFilter extends Component {
  render(){
    return (
      <div className="form-group">
        <h6>Category</h6>
          <CategoryCard categories={CATEGORIES}/>
      </div>
    );
  }
}
