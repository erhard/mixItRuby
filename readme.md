MIX
===

What is MIX ?
-------------
Mix is a gem for mixing data with tamplatefiles.

Example Use Case
----------------
You have to print bills for a list of items/products.
What you do :
Transform the data to a hash which lasts a specific form
Run mix with a erb template. Viola the output is (depending on the template)
ready to be formatted in latex of whatever.

But whatever...... 



Install
-------
gem mix

run (form commandline)
-----------------------
mix inputfile template outputfile


run withing a programm
----------------------


current project status 
----------------------
Work in progress just started


You want to contributes ?
==========================
Contact erhard@kargers.org




Structure of the data
=====================

json Format recursive, selfcontained.

recursive      : substructures possible (nodes)
selfcontained  : The name of the erb (id, for DB or File or whatever) is within the data









