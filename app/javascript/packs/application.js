// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import SearchPage from './containers/SearchPage';

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <SearchPage />,
    document.getElementById('root-search'),
  )
})
