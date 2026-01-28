This script assists the solution of substitution cryptograms.  These are found online and in puzzle variety books.
They are for amusement .. nothing more.

It is possible to provide a fancy GUI but I find a script to be more practical.  Any programming language with a substring 
capability could be used but I am using Lua which can run on any platform. A Python programmer could easily convert the
script to a Python solution.

Example: Look for this line near the end of the script "-- M.letter_count(CG)". Remove the "--" comment marker and 
type "lua B4.lua". It will list the cipher alphabet A-Z with a count of each letter. The letter with the highest
count probably represents "E" as in the ETON pattern.  Frequency counting is optional but useful sometimes.

The script is enhanced by dictionary lookup. There are 63000 words in file 'data3.txt'.  The first step of the search
scans the entire file and usually finds about 7000 words which are then filtered to reveal a short list of possible
matches. Sometimes it finds 1 exact match.  This operation takes about 1 second.

Example: Here is a cipher for "possibilities"
local CW = "YWJJUDUPUSUGJ"
Part 1 rules filter out 1788 of 1789 leaving 1 "possibilities"
      if 1==1 then  -- skip unless '1==1'
      -- reject ones that should be equal but are not
         if M.has_repeat( s1, 3, 4) == false then return false end
         if M.has_repeat( s1, 5, 7) == false then return false end
         if M.has_repeat( s1, 7, 9) == false then return false end
         if M.has_repeat( s1, 9,11) == false then return false end
         end

This can only be done with an optional rule or filter in the script which you edit. The actual cipher 
letters like 'JJ' do not matter, the rule function only looks for equality of letters at certain positions.

This is a rare, easy example.  The typical cipher does not have long words with double letters and repeats. 
Part 2 of the rules function is for that.

TBD
