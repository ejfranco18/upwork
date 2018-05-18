module ValidateSearchResults

  def validate_profiles(keyword)
    #Validate which profiles and attributes contain keyword
    index = 0
    index_keyword = []
    index_no_keyword = []

    #Create array to store index of elements that contain keyword
    while index <= @results_data.size - 1
      @results_data[index].each {|key, value|
        atributte = "#{key}: #{value}"

        if atributte.downcase.include?(keyword.downcase)
          index_keyword << index
        else
          index_no_keyword << index
        end
      }

      index+=1
    end

    @index_keyword = index_keyword.uniq
    @index_no_keyword = index_no_keyword - index_keyword
  end

  def keyword_in_profile
    #Validate and store profiles and attributes that contain keyword
    x = 0
    y = 0
    freelance_keyword = []
    freelance_no_keyword = []

    while x <= @index_keyword.size - 1
      @results_data[@index_keyword[x]].each {|key, value|
        atributte = "#{key}: #{value}"

        if key.to_s != "name"

          if  atributte.downcase.include?(@keyword.downcase) && !freelance_keyword.include?(@results_data[x].first)
            freelance_keyword << @results_data[x].first
            freelance_keyword << atributte
          elsif atributte.downcase.include?(@keyword.downcase) && freelance_keyword.include?(@results_data[x].first)
            freelance_keyword << atributte
          end
        end
      }

      x += 1
    end

    puts "Freelancers with the keyword on its attributes\n"
    freelance_keyword.each do |x|
      puts x
    end

    #Store profiles that don't contain keyword
    while y <= @index_no_keyword.size - 1

      @results_data[@index_no_keyword[y]].each {|key, value|
        atributte = "#{key}: #{value}"

        if key.to_s != "name"

          if  atributte.downcase.include?(@keyword.downcase) && !freelance_no_keyword.include?(@results_data[y].first)
            freelance_no_keyword << @results_data[y].first
            freelance_no_keyword << atributte
          elsif atributte.downcase.include?(@keyword.downcase) && freelance_no_keyword.include?(@results_data[y].first)
            freelance_no_keyword << atributte
          end
        end
      }

      y += 1
    end

    puts "\nFreelancers without the keyword on its attributes\n"
    freelance_no_keyword.each do |x|
      puts x
    end

    #Keyword not found on any result
    if freelance_keyword.none?
      puts "No keyword found on results"
      fail
    end
  end
end