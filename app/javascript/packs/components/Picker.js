import React, { Component } from 'react';

export default class Picker extends Component {
  render(){
    const { value, options } = this.props;

    return (
      <select className="form-control">
        {
          options.map(option =>
            <option value={option} key={option}>
              { option }
            </option>
          )
        }
      </select>
    );
  }
}
