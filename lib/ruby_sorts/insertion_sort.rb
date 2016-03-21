module RubySorts
  class InsertionSort < SortBase

    def sort
      insertion_sort @unsorted
    end

    def insertion_sort(array)
      num_elements = array.length
      return array if num_elements < 2
      # 
      # for clarity I'm going to use "position", 
      # which is one more than "index" in an array
      #
      # the first element is an ordered list of one item.
      #
      # passes start with the second element and go to the end: INSERT_POSITION
      # - pull the value out of the INSERT_POSITION
      # - while INSERT_POSITION >= 0
      #   - break if value >= left_of(INSERT_POSITION)
      #   - shift left_of(INSERT_POSITION) into INSERT_POSITION
      #   - INSERT_POSITION -= 1
      # - put value into INSERT_POSITION
      # - next pass
      #

      first_index = 1 # second element
      last_index  = num_elements - 1

      first_index.upto(last_index) do |insert_index|
        value = array[insert_index]
        while insert_index > 0
          # we're there if we're bigger than the value left of here
          break if value >= value_left_of(array,insert_index)
          # the insert value's less than the value left of the insert slot:
          # move the insert slot left / shift the compared value right
          array[insert_index] = array[insert_index - 1]
          insert_index -= 1
        end
        # at this point, we will either have ended up with an insert_index
        # by way of comparison, of because it is '0'
        array[insert_index] = value
      end

      # ta-da!
      array
    end

    def value_left_of(array,index)
      array[index - 1]
    end
  end
end