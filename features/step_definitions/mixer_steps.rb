



Given(/^a empty testenvironment with one erb file and one data file$/) do
    ###just do something
      if File.exists?("features/testDir/output/test.txt")
          system("rm /features/testDir/output/*")
      end
      end

When(/^I enter "(.*?)"$/) do |arg1|
      system(arg1)
end

Then(/^I should get a file with the name dataInput and the suffix mixed$/) do
      File.exists?("features/testDir/output/test.txt").should==true
end
