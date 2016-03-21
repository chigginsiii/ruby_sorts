=begin
|a|b|c|d|e|

- first pass: find max of position(1) to position(n), move it to position(n)
- second pass: find max of position(1) to position(n-1), move to position(n-1)
- third pass: find max of position(1) to position(n-2)...
- ...until last position = second element
=end

module RubySorts
  class SelectionSort < SortBase

    def sort
      selection_sort @unsorted
    end

    def selection_sort(array)
      # since the last comparison is always the last two elements,
      # the number of times this needs to be done is, once again,
      # n-1.
      num_elements = array.length
      num_passes   = num_elements - 1

      # this isn't necessary with less than two elements
      return array if num_passes < 1

      1.upto(num_passes) do |pass_num|
        # first index is always 0, last index is length - pass_num
        # eg: 1st pass: length - 1, last pass for 5 elements: 5 - 4
        last_index = num_elements - pass_num

        max_i = 0
        max = 0
        0.upto(last_index) do |i|
          # get the index of the largest value
          if array[i] > max
            max = array[i]
            max_i = i 
          end
        end

        # if the largest is already at the end we save a swap
        swap_elements(array, max_i, last_index) unless max_i == last_index
      end

      array
    end

    def swap_elements(array, elm1, elm2)
      tmp = array[elm1]
      array[elm1] = array[elm2]
      array[elm2] = tmp
    end

  end
end