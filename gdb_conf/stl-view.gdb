##############################################
#
#   STL container print func
#
##############################################

#
#   STL vector print func
# 

define pvector 
  if $argc == 0
    help pvector
  else
    set $size = $arg0._M_impl._M_finish - $arg0._M_impl._M_start
    set $capacity = $arg0._M_impl._M_end_of_storage - $arg0._M_impl._M_start
  end
  set $beg = 0
  set $end = $size
  if $argc == 2 
    set $beg = $arg1
  end
  if $argc == 3
    set $end = $arg2
  end
  
  if $beg > 0 || $end >= $size || $beg > $end
    help pvector
  else 
    set $i = $beg
    while $i < $end
      printf "index[%u]: ", $i
      p *($arg0._M_impl._M_start + $i)
      set $i++
    end
  end
  if $argc > 0 
    printf "vector size = %u", $size
    printf "       cap  = %u", $capacity
    print  "Element :"
    whatis $arg0._M_impl._M_start
  end
end

document pvector 
  Prints std::vector<T> info
  pvector v           ---- print vector info and element [0, size)
  pvector v from      ---- print vector info and element [from, size)
  pvector v from to   ---- print vector info and element [from, to)
end
