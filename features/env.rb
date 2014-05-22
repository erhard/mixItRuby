require 'capybara/cucumber'
require 'capybara/poltergeist'
    @processingWorkingDir=File.dirname(__FILE__)
    @processingWorkDir=@processingWorkingDir+"/../processing/vert/"
#Start the two servers :
#
#Processing Server :
  #  @t1 = fork do
  #      system("cd #{@processingWorkDir} && rvm use jruby-1.7.1@masha_gems && vertx run #{@processingWorkDir}server_app.js -conf test.json") 
  #  end
  #  sleep(5)
  #  @siteServerPath=File.dirname(__FILE__) + "/../site/bin/" # This is a Serverinstance which is not deployed. It simulates the server of the provider
  #  @t2 = fork do
  #      system("cd #{@siteServerPath} && ruby pageServer.rb -p 4568") 
  #  end
  #  sleep(5)
if ENV['IN_BROWSER']
  # On demand: non-headless tests via Selenium/WebDriver
  # To run the scenarios in browser (default: Firefox), use the following command line:
  # IN_BROWSER=true bundle exec cucumber
  # or (to have a pause of 1 second between each step):
  # IN_BROWSER=true PAUSE=1 bundle exec cucumber
  Capybara.default_driver = :selenium
  AfterStep do
    sleep (ENV['PAUSE'] || 0).to_i
  end
else
  # DEFAULT: headless tests with poltergeist/PhantomJS
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      window_size: [1280, 1024]#,
      #debug:       true
    )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end
at_exit do

    puts @t1
    puts @t2
    
    
    if @t1
        puts "processserver killed"
      Process.kill("HUP",@t1)
      sleep(10)
    end
    if @t2
        puts "pageServer killed"
     Process.kill("HUP",@t2)
     sleep(10)
    end
    puts "bye"
end
