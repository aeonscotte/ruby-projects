class BubbleSort
  def sort(n_arr)
    flag = true
    while flag
      flag = false
      for i in 0..n_arr.length - 2 do 
        j = n_arr[i] <=> n_arr[i + 1]                                        
        case j                                                               
          when -1                                                            
            next                                                             
          when 0
            next
          else
            flag = true
            swp = n_arr[i]                                                   
            n_arr[i] = n_arr[i + 1]                                          
            n_arr[i + 1] = swp                                               
        end                                                        
      end 
    end
    p n_arr
  end
end
