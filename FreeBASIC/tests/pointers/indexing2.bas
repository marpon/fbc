
	dim i as integer, dp as integer pointer pointer 
	dim array(0 to 4) as integer 

	for i = 0 to 4 
  		array(i) = i 
	next 

	dp = allocate( len(integer pointer pointer) ) 
	*dp = allocate( len(integer pointer) ) 

	*dp = @array(0) 
  
	for i = 0 to 4 
  		assert( *(*dp + i) = i )
	next 
