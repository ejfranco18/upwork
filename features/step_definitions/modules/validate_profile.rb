module ValidateDataInProfile

  def agency_profile?
    #Validates if the profile is freelancer or agency
    agency_name = @browser.find_elements(xpath: "//h2[@class='m-xs-bottom ng-binding']").any?

    if agency_name
      @agency_element = true

    else
      @agency_element = false
    end
  end

  def validate_attributes_profile
    #Executes the method for attributes validation based on whether the profile is freelancer or not
    agency_profile?

    if @agency_element
      agency_attributes_profile
    else
      non_agency_attributes_profile
    end
  end

  def validate_keyword_attributes
    #Executes the method for keyword validation on profile based on whether the profile is freelancer or not
    agency_profile?

    if @agency_element
      agency_keyword_attributes
    else
      non_agency_keyword_attributes
    end
  end

  def non_agency_attributes_profile

    #Validate attributes inside the profile with the ones on the results page
    @profile_name = @browser.find_element(xpath: "//h2[@class='m-xs-bottom']//span[@class='ng-binding']").text
    @profile_role = @browser.find_element(css: ".up-active-context.up-active-context-title.fe-job-title").text
    @profile_overview = @browser.find_element(xpath: "(//p[@class='break text-pre-line up-active-context m-0-bottom ng-isolate-scope'])[1]").text
    @profile_skill_1 = @browser.find_element(xpath: "(//a[@class='o-tag-skill ng-binding ng-scope'])[1]").text
    @profile_skill_2 = @browser.find_element(xpath: "(//a[@class='o-tag-skill ng-binding ng-scope'])[2]").text
    @profile_skill_3 = @browser.find_element(xpath: "(//a[@class='o-tag-skill ng-binding ng-scope'])[3]").text
    @profile_skill_4 = @browser.find_element(xpath: "(//a[@class='o-tag-skill ng-binding ng-scope'])[4]").text

    check_name = @profile_name.include?(@results_data[@index_rand-1][:name])
    check_role = @profile_role.include?(@results_data[@index_rand-1][:role])
    check_overview = @profile_overview.include?(@results_data[@index_rand-1][:overview][0...6])
    check_skill_1 = @profile_skill_1.include?(@results_data[@index_rand-1][:skill_1])
    check_skill_2 = @profile_skill_2.include?(@results_data[@index_rand-1][:skill_2])
    check_skill_3 = @profile_skill_3.include?(@results_data[@index_rand-1][:skill_3])
    check_skill_4 = @profile_skill_4.include?(@results_data[@index_rand-1][:skill_4])

    if check_name && check_role && check_overview && check_skill_1 && check_skill_2 && check_skill_3 && check_skill_4
      puts "Attributes match"
    else
      puts "Attributes don't match"
      fail
    end
  end

  def agency_attributes_profile
    #Validate attributes inside the profile with the ones on the results page for an agency profile
    @profile_name = @browser.find_element(xpath: "//h2[@class='m-xs-bottom ng-binding']").text
    @profile_role = @browser.find_element(xpath: "(//h4[@class='m-sm-bottom ng-binding ng-scope'])[2]").text
    @profile_overview = @browser.find_element(xpath: "//div[@class='break text-pre-line ng-isolate-scope']").text

    check_name = @profile_name.include?(@results_data[@index_rand-1][:name])
    check_role = @profile_role.include?(@results_data[@index_rand-1][:role])
    check_overview = @profile_overview.include?(@results_data[@index_rand-1][:overview][0...6])

    if check_name && check_role && check_overview
      puts "Attributes match"
    else
      puts "Attributes don't match"
      fail
    end
  end

  def non_agency_keyword_attributes

    #Validate that attributes contain keyword
    keyword_on_name = @profile_name.downcase.include?(@keyword.downcase)
    keyword_on_role = @profile_role.downcase.include?(@keyword.downcase)
    keyword_on_overview = @profile_overview.downcase.include?(@keyword.downcase)
    keyword_on_skill_1 = @profile_skill_1.downcase.include?(@keyword.downcase)
    keyword_on_skill_2 = @profile_skill_2.downcase.include?(@keyword.downcase)
    keyword_on_skill_3 = @profile_skill_3.downcase.include?(@keyword.downcase)
    keyword_on_skill_4 = @profile_skill_4.downcase.include?(@keyword.downcase)

    if keyword_on_name || keyword_on_role || keyword_on_overview || keyword_on_skill_1 || keyword_on_skill_2 || keyword_on_skill_3 || keyword_on_skill_4
      puts "Keyword on attribute"
    else
      puts "Keyword not found on attributes"
      fail
    end
  end

  def agency_keyword_attributes
    #Validate that attributes contain keyword for an agency profile
    skills = @browser.find_element(xpath: "//div[@class='o-profile-skills m-sm-top ng-scope']").text

    keyword_on_name = @profile_name.downcase.include?(@keyword.downcase)
    keyword_on_role = @profile_role.downcase.include?(@keyword.downcase)
    keyword_on_overview = @profile_overview.downcase.include?(@keyword.downcase)
    keyword_on_skills = skills.downcase.include?(@keyword.downcase)

    if keyword_on_name || keyword_on_role || keyword_on_overview || keyword_on_skills
      puts "Keyword on attributes"
    else
      puts "Keyword not found on attributes"
      fail
    end
  end
end