mixItRuby
===

What is mixItRuby ?
-------------
MixItRuby is a gem for mixing data (in form of a nested Hash) with templatefiles.

Example Use Case
----------------
You have to print bills for a list of items/products.
What you do :
Transform the data to a hash which lasts a specific form
Run mixit with an erb template. The output is (depending on the template)
ready to be formatted in latex of whatever.


Install
-------
gem install mixItRuby

run (from commandline)
-----------------------
mixit -i inputfile < -t templateDir -o outputfile  >


run withing a programm
----------------------
    
    require "mixer"
    mixer = MIX::Mixer.new
    mixer.mixItRuby(inputdata_hash)
    mixer.writeResult2File(outputfile)


current project status 
----------------------
Work in progress just started 


You want to contributes ?
==========================
Contact erhard@kargers.org




Structure of the data
=====================

json, recursive, selfcontained.

recursive      : substructures possible (nodes)
selfcontained  : The name of the erb (id, for DB or File or whatever) is within the data

Here an example:

{"id":"adress.erb","name":"Bond","prename":"James",
    "items":
        [
        {"id":"item.erb","product":"car1","prize":"10"},
        {"id":"item.erb","product":"car2","prize":"11"}
    ]
}

A building block consists of an id and other key value pairs.

id: is a must. It represents the identifier under which the template is accesible.
At the moment it is a filename. The other attributes on the same level, which are no array or hash are 
the key value pairs which fill the erb.
The adress.erb looks like this
<%=name%>, <%=prename%>
Then an array follow. An Array must be build of hashes, which can have subarrays or like in the example building blocks again.


What is mixItRuby needed for ?
==============================
With that little gem you can build up personalized letters or emails or html pages, with nested data.
Just imagine the erb file are tex files or xml-fo or html files or they are files with are ruby file again, which produce some output.

Another possibility is create other json files. Imagine the template erbs are templates for json. Then for example in SOA business objects can be  chained and enriched from services. 

There are a lot of posibilities.
Post some it would be nice to hear what is possible.
 



Licence:
MIT

Author:
Erhard Karger
