fun reverse x = 
	if null x then nil
	else (reverse (t1 x))@[(hd x)]

datatype ''