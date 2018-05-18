module Search

  def search_by_keyword(keyword)
    #Search keyword on search bar on home
    search_field = @browser.find_element(id: 'q')
    search_field.send_keys(keyword)
    @browser.action.send_keys(:enter).perform
  end

  def validate_search_result
    #Validate that the user is on the result page
    search_result_headline = 'oSearchContractorsHeader'
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until { @browser.find_element(id: search_result_headline).displayed? }
  end

end