import React from 'react';

export default function Picker(props) {
  return (
    <select className="form-control">
      {
        props.options.map(option =>
          <option value={option} key={option}>
            {option}
          </option>
        )
      }
    </select>
  );
}
