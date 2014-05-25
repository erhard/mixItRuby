Feature:Commandline functionality

    A User should be able to call a command to get a mixed outputfile
    @announce
    Scenario: CommandlineCall should give an error, when no inputfile
        When I run `mixit`
        Then the output should contain "no inputfile given"




    Scenario: exit status of 0
        When I run `mixit`
        Then the exit status should be 1



    @announce
    Scenario: Generatining an outputfile
        Given the testdatafile is in the aruba filespace
        When I run `mixit -i testdata/testdata.json`
        When I run `cat testdata/testdata.out`
        Then the stdout should contain "Bond"
        
        
    @announce
    Scenario: mixIt should also run from another templatepath
        Given the testdatafile is in the aruba filespace
        Given the templatefiles are in the aruby filespace
        When I run `mixit -i testdata/testdata.json -t tmp/aruba`
        And I run `cat testdata/testdata.out`
        Then the stdout should contain "Bond"
