module RubySorts
  class MergeSort < SortBase

    #
    # there's two steps to this sort:
    #
    # NOTE: in my example, it works on the array in-place
    #
    # STEP 1: split the halves
    #
    # (left, right) = split_in_half(array)
    #
    # STEP 2: recurse if the list is bigger than one element
    #
    # merge_sort left if left.length > 1
    # merge_sort right if right.length > 1
    #
    # STEP 3: grab the lowest value from the left side
    #         of left or right, push onto merged array
    #         until both sides are emptied.
    # 
    def sort
      merge_sort @unsorted
    end

    def merge_sort(arr)
      # okay, first part: split
      left_half = arr.shift( Integer(arr.length / 2) )
      right_half = arr.shift( arr.length )

      # recursion begins/breaks here
      # (don't recurse on single-element lists)
      merge_sort left_half if left_half.length > 1
      merge_sort right_half if right_half.length > 1

      # stop when either is empty
      until left_half.empty? || right_half.empty?
        next_val = (left_half.first <= right_half.first) ? left_half.shift : right_half.shift
        arr << next_val
      end

      # these will push remainder onto end
      # from whichever side is not empty.
      arr.push(*left_half)
      arr.push(*right_half)
    end
  end
end