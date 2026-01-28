--[[
  cryptogram assistant  
  file: B4.lua
  RMM; 2026-jan-28
]]--

local filename1 = "../../../data3.txt"    -- english dictionary words
local filename2 = "work.txt"     -- list of words same length
local infile = assert(io.open(filename1, "r"))
local outfile = io.open(filename2,"w");
local LC = {nWords=0, sWords=0, tWords=0}  -- counters

local M = require "mlib"

---------------------------------------------------------------
-- Enter the cryptogram code here. The source prints this example
-- in multi-line format but the "\z" makes it a single string in Lua

local CG = "U \z
MV  SGPPUCA  FWZ  SKMS UI  SKUCAJ  LMC  LKMCAG  IWN \z
SKG  BWNJG  SKG  WYYWJUSG  UJ  MPJW  SNZG  DZS  WCPF \z
UI  FWZ  WYGC  FWZNJGPI  SW  SKG  YWJJUDUPUSUGJ  NZSK  NGULKP"


------------- 12345678901234567890123456  -- index
local ref1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" -- cipher letters
local ref2 = "...b..e..s.....l..t.i.o.p." -- TBD lower-case letters

------------1234567890123456789  --enter a cipher word here
local CW = "YWJJUDUPUSUGJ"
------------possibilities
---------------------------------------------------------------
-- part 1 is for the cipher upper-case words
-- part 2 is for decoding the lower case words
-- both parts are optional ... one or other .. both .. neither
--
local function rules(s1)
      if 1==1 then  -- skip unless '1==1'
      -- reject ones that should be equal but are not
         if M.has_repeat( s1, 3, 4) == false then return false end
         if M.has_repeat( s1, 5, 7) == false then return false end
         if M.has_repeat( s1, 7, 9) == false then return false end
         if M.has_repeat( s1, 9,11) == false then return false end

      end -- 1==1
      -- skip part 2 unless '2==2'
      if 2==0 then ---- 1234567890123456789
            local m1 = ".e.t.e"
	    -- m1 is the partially decoded "CW" variable
	    local tf = false;
	    for i=1,#CW do
     	    	local w2 = m1:sub(i,i)
      	    	if w2 ~= "." then
      	    	  if s1:sub(i,i) ~= w2 then return false end
	  	end --then1
      	    end  --for
      end -- 2==2

      return true	--success
end -- function rules


---------------------------------------------------------------
local function do_map()
      for w in string.gmatch(CG,"%a+") do
         lc2 = ""
	 for i=1,#w do  --each capital word
	 idx1 = w:sub(i,i)  -- index the A--Z
	 idx2, sz = string.find(ref1,idx1) 
	 lc1 = ref2:sub(idx2,idx2)
	 lc2 = lc2 .. lc1
         end  -- do
	 print( string.format("%-18s %s",w,lc2 ))
         --print(sx)
     end -- do
end -- do_map()


----------------  main loop  -------------------

while true do
   local line1=infile:read()
   if not line1 then break end
   LC.tWords = LC.tWords+1   
   sz = #line1
   if sz == #CW then
      LC.sWords = LC.sWords+1
      local tf = rules(line1)
      if tf == true then
            LC.nWords = LC.nWords+1
	    s2 = string.format(" %s  %d",line1,sz )
	    outfile:write(s2 .. "\n")
	    print( s2)
      end --tf
   end -- sz
end -- main

print("Lines out=", LC.tWords, LC.sWords, LC.nWords)
do_map(CG)
print(">>")
print(CG, #CG, "\n")

infile:close()
outfile:close()

-- M.letter_count(CG)   -- run once for a new cryptogram
-- this is end of script

-------------------------------------------------------------------
--[[  === park a tested rule() in case needed again ===

possibilities  13 letters
Lines out=
63368 dictionary words scanned,
1789  list all possible 13 letter words
1     answer

local ref1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" -- cipher letters
local ref2 = "...b..e..s.....l..t.i.o.p." -- TBD lower-case letters

notice how "possibilities" aligns with the ciper word
local CW = "YWJJUDUPUSUGJ"
------------
Part 1 rules filter out 1788 of 1789 leaving 1 "possibilities"
      if 1==1 then  -- skip unless '1==1'
      -- reject ones that should be equal but are not
         if M.has_repeat( s1, 3, 4) == false then return false end
         if M.has_repeat( s1, 5, 7) == false then return false end
         if M.has_repeat( s1, 7, 9) == false then return false end
         if M.has_repeat( s1, 9,11) == false then return false end
-----
The letters of the qualified word must be added to "ref2". Then run
the script again. It partially decodes most of the cipher. Also
it completely decodes "opposite" at the same time

Can you guess what "SKG" means
$ lua B4.lua
 possibilities  13
Lines out=	63368	1789	1
U                  i
MV                 ..
SGPPUCA            telli..
FWZ                .o.
SKMS               t..t
UI                 i.
SKUCAJ             t.i..s
LMC                ...
LKMCAG             .....e
IWN                .o.
SKG                t.e
BWNJG              .o.se
SKG                t.e
WYYWJUSG           opposite
UJ                 is
MPJW               .lso
SNZG               t..e
DZS                b.t
WCPF               o.l.
UI                 i.
FWZ                .o.
WYGC               ope.
FWZNJGPI           .o..sel.
SW                 to
SKG                t.e
YWJJUDUPUSUGJ      possibilities
NZSK               ..t.
NGULKP             .ei..l

]]--

-- B4.lua --
