module StoreData

  def store_results
    #Save all results on the first page in an array, where each profile is an element, and the attributes are hashes
    wait
    freelance_data = "responsive-visitor-tile"
    name_data = ".m-0-top-bottom.ellipsis"
    role_data = ".m-0.freelancer-tile-title.ellipsis"
    overview_data = ".p-0-left.m-0.freelancer-tile-description"
    skill_data = ".o-tag-skill.m-sm-top.m-0-bottom"
    profile_path = "(//article[@class='row responsive-visitor-tile'])"
    agency_skill_path = "//div[@class='col-xs-12']//a[@class='o-tag-skill m-sm-top m-0-bottom']"
    results_size = @browser.find_elements(class: freelance_data).size
    @results_data = []
    x = 1

    #Iterate through each result
    while x <= results_size
      element_parent = @browser.find_element(xpath: profile_path.to_s + "[" + x.to_s + "]")
      name = element_parent.find_element(css: name_data).text
      role = element_parent.find_element(css: role_data).text
      overview = element_parent.find_element(css: overview_data).text
      current_profile = {}
      current_profile[:name] = name
      current_profile[:role] = role
      current_profile[:overview] = overview
      skills_size = element_parent.find_elements(css: skill_data).size

      #Iterate through the profile skills
      for i in 1..skills_size
        agency_element = (@browser.find_elements(xpath: profile_path.to_s + "[" + x.to_s + "]" + agency_skill_path.to_s).any?)

        #Validates if the profile has agency element
        if agency_element
          skill = @browser.find_element(xpath: "(" + profile_path.to_s + "[" + x.to_s + "]" + agency_skill_path.to_s + ")[" + i.to_s + "]").text
        else
          skill = @browser.find_element(xpath: profile_path.to_s + "[" + x.to_s + "]").find_element(css:"span:nth-child(" + (i+2).to_s + ")").text
        end
        current_profile[:"skill_#{i}"] = skill
      end

      #Store elements on array
      @results_data << current_profile
      x += 1
    end
  end

end