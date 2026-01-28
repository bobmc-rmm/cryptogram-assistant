This script assists the solution of substitution cryptograms.  These are found online and in puzzle variety books.
They are for amusement .. nothing more.

It is possible to provide a fancy GUI but I find a script to be more practical.  Any programming language with a substring 
capability could be used but I am using Lua which can run on any platform. A Python programmer could easily convert the
script to a Python solution.

Example: Look for this line near the end of the script "-- M.letter_count(CG)". Remove the "--" comment marker and 
type "lua B4.lua". It will list the cipher alphabet A-Z with a count of each letter. The letter with the highest
count probably represents "E" as in the ETON pattern. Furthermore, the cipher letters must be uppercase with no
punctuation.  The solution letters are lower-case with dots "." for unknowns.

