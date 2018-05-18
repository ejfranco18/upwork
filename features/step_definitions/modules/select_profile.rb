module SelectProfile

  def select_random_profile
    #Enter a random profile on the results page
    freelance_data = "responsive-visitor-tile"
    profile_path = "(//article[@class='row responsive-visitor-tile'])"
    name = "//a[@class='freelancer-tile-name']"
    results_size = @browser.find_elements(class: freelance_data).size

    @index_rand = rand (1..results_size)
    selected_profile = @browser.find_element(xpath: profile_path + "[" + @index_rand.to_s + "]" + name)

    puts "The selected profile is: " + selected_profile.text
    selected_profile.click
    wait
  end
end