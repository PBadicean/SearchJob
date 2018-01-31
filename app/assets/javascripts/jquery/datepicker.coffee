$(document).ready ->
  $('.datepicker').datepicker
    format: 'dd.mm.yyyy'
    language: 'ru'
    todayBtn: true
    clearBtn: true
    todayHighlight: true
    autoclose: true
    setDate: new Date()

  $('.input-daterange').datepicker
    format: 'dd.mm.yyyy'
    language: 'ru'
    todayBtn: true
    clearBtn: true
    todayHighlight: true
    autoclose: true
    setDate: new Date()
