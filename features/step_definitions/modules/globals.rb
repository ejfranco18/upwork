module Globals

  def wait
    sleep 5
  end

  def goto_site(site)
    #Go to site
    @browser.navigate.to site
  end

end