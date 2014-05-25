

    Given(/^the testdatafile is in the aruba filespace$/) do
      `mkdir tmp/aruba/testdata && cp testdata/testdata.json tmp/aruba/testdata`
    end


    Given(/^the templatefiles are in the aruby filespace$/) do
      `mkdir tmp/aruba/templates && cp templates/* tmp/aruba/templates`
    end



