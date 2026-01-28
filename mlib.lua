local M = {}

-- check for repeat letters --
-- a=index of 1 letter, b=index of another letter
-- this is just a convenience to reduce rules() substring format
function M.has_repeat( s1, a, b )
      if s1:sub(a,a) ~= s1:sub(b,b) then return false end
      return true
end


function M.letter_count( s1 )
   local LS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      for i=1,#LS do
      	 local v1 = LS:sub(i,i)
	  count = 0
	  for j=1,#s1 do
	      if v1==s1:sub(j,j) then count=count+1 end
	  end
	  print( v1,count )
      end

end

return M   -- end of module code
