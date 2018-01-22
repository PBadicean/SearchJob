module SelectDateMacros
  def select_date(date)
    find(:xpath, ".//select[contains(@id,'#{date}')]")[:id]
  end
end
