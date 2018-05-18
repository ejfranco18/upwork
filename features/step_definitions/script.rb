require_relative 'modules/globals'
require_relative 'modules/search'
require_relative 'modules/store_results'
require_relative 'modules/select_profile'
require_relative 'modules/validate_results'
require_relative 'modules/validate_profile'

include Globals
include Search
include StoreData
include SelectProfile
include ValidateSearchResults
include ValidateDataInProfile

Given(/^The user is on the Upwork site$/) do
  goto_site("http://www.upwork.com/")
end

And(/^The user searches "([^"]*)" on the search field$/) do |keyword|
  @keyword = keyword
  search_by_keyword(keyword)
end

Then(/^The results should be displayed$/) do
  validate_search_result
end

And(/^The results should contain the keyword$/) do
  store_results
  validate_profiles(@keyword)
  keyword_in_profile
end

When(/^The user enters to a random profile$/) do
  store_results
  select_random_profile

end

Then(/^The profile attributes should match the displayed on the results for the selected freelancer$/) do
  validate_attributes_profile
end

And(/^The keyword should be contained in at least one attribute$/) do
  validate_keyword_attributes
end