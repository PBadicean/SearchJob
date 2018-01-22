# frozen_string_literal: false

formats = {
  fsr_backup: '%d_%m_%Y',
  ru_date: '%d.%m.%Y',
  ru_datetime: '%d.%m.%Y %H:%M',
  ru_time: '%H:%M',
  fansy_full: '%FT%T',
  fansy_short: '%F'
}

Date::DATE_FORMATS.merge! formats
Time::DATE_FORMATS.merge! formats
