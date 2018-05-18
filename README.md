Upwork test case by Javier Franco
=================

Test case for search profile on the Upwork site.

Used tools:

Ruby

Selenium

Cucumber


Test cases
-------------

The test cases are described on the file features/search_freelancers.feature

In the test cases, the keywords used for the search are 'dev' and 'QA', these words can be changed in this file for any other word that is intended to be searched within the site. 


Set browser
--------------

To change the browser for the test execution, change the name on the file hooks.rb.

@browser = Selenium::WebDriver.for :firefox

@browser = Selenium::WebDriver.for :chrome


HTML Report
----------------------------

On the file config/cucumber.yml there's a profile to generate the results in an HTML file, which can be found on the results folder.

To use the profile, set it on the command line when executing the test:

cucumber -p report features/search_freelancers.feature