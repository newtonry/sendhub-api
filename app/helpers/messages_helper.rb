module MessagesHelper
  def numbers_valid?(phone_numbers)
    phone_numbers.each do |number|
      return false if !is_number_valid?(number)
    end
    true
  end
  
  def is_number_valid?(phone_number)
    #not valid if the length is off or includes any non-integers
    return false if phone_number.length !=10 || !(Integer(phone_number) rescue false)
    true
  end
  
  def determine_bucket_sizes(phone_number_count)
    #we are going to use a greedy algorithm, because it works for the given size of buckets
    #similar to the change making solution
    #however, it wouldn't work if the currencies were different
    
    sizes = [1,5,10,25]
    buckets = []
    
    while phone_number_count > 0
      if phone_number_count >= sizes.last
        phone_number_count -= sizes.last
        buckets << sizes.last
      end
      
      sizes.pop if sizes.last > phone_number_count
    end 
    buckets
  end
end
