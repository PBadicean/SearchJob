Ransack.configure do |config|
  config.add_predicate 'beginning_of_day_gteq',
                       arel_predicate: 'gteq',
                       formatter: proc { |v| v.to_date.beginning_of_day },
                       validator: proc { |v| v.present? },
                       type: :string

  config.add_predicate 'end_of_day_lteq',
                       arel_predicate: 'lteq',
                       formatter: proc { |v| v.to_date.end_of_day },
                       validator: proc { |v| v.present? },
                       type: :string

  config.add_predicate 'eq_or_nil',
                       :arel_predicate => 'eq_any',
                       :formatter => proc { |v| 'nil' == v || 0 == v ? nil : v },
                       :validator => proc { |v| v.present? },
                       :compounds => false,
                       :wants_array => true
  
end
