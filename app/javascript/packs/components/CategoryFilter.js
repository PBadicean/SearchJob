import React from 'react';
import CategoryCard from '../components/CategoryCard';

export default function CategoryFilter(props) {
  return (
    <div className="form-group">
      <h6>Category</h6>
      <CategoryCard categories={props.categories}/>
    </div>
  );
}
