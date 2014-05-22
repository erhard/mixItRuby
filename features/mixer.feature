Feature:Commandline functionality

    A User should be able to call a command to get a mixed outputfile

Scenario: CommandlineCall
        Given a empty testenvironment with one erb file and one data file
        When I enter "mix dataInput dataoutput templateDir"
        Then I should get a file with the name dataInput and the suffix mixed
        




