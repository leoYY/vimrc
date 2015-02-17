##############################################
#
#   STL container print func
#   参考 https://sourceware.org/ml/gdb/2008-02/msg00064/stl-views.gdb
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
  
  if $beg > 0 || $end > $size || $beg > $end
    help pvector
  else 
    set $i = $beg
    while $i < $end
      printf "index[%u]: ", $i
      print *($arg0._M_impl._M_start + $i)
      set $i++
    end
  end
  if $argc > 0 
    printf "vector size = %u\n", $size
    printf "       cap  = %u\n", $capacity
    printf  "Element "
    whatis $arg0._M_impl._M_start
  end
end

document pvector 
  Prints std::vector<T> info
  pvector v           ---- print vector info and element [0, size)
  pvector v from      ---- print vector info and element [from, size)
  pvector v from to   ---- print vector info and element [from, to)
end


#
#   STL list print func
#

define plist 
  if $argc == 0  
    help plist
  else 
    set $head = &($arg0._M_impl._M_node)
    set $cur = $arg0._M_impl._M_node._M_next
    set $size = 0
    set $beg = 0
    set $end = -1
    if $argc == 3
      set $beg = $arg2
    end
    if $argc == 4
      set $end = $arg3
    end

    while $cur != $head
      if $beg <= $size 
        if $end == -1 || $size < $end
          printf "index[%u]", $size    
          p *($arg1*)($cur + 1)
        end 
      set $cur = $cur._M_next
      set $size++
    end
    printf "List size = %u \n", $size
    if $argc < 2
      printf "Element "
      whatis $arg0
    end
  end
end

document plist
  Prints std::list<T> info
  plist l           ---- print list info 
  plist l T         ---- print list info and elements [0, size)
  plist l T from to ---- print list info and element [from, to)
end
