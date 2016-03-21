=begin

Quicksort does some presorting before splitting, 
and then recurses the halves. So:

BEGIN THE QUICK SORT FUNCTION:

  |d|b|f|e|a|c|

  - 0:'d' will be the pivot, it will become the node after the split
  - 1:'b' will be the initial left mark
  - 5:'c' will be the initial right mark

  - the left and right mark move towards each other until they reach the middle like so:
    - left-side current is 1, right-side current is 5  d |b| f  e a |c|

    LOOP: STEP_TO_SPLIT_POINT
    - compare value on left-side to pivot:
      - 'b' < 'd', move left 1 right     d  b [f| e  a |c]
      - 'f' > 'd', STOP on 2:            d  b (f) e  a |c]

    - compare value on right-side to pivot:
      - 'c' < 'd', STOP on 5:            d  b (f) e  a (c)

    - left < right? no split point
      - switch 2 and 5:                  d  b (c) e  a (f)
      - move left 1 right, right 1 left: d  b  c [e||a] f

    - STEP_TO_SPLIT_POINT again:
      - 'e' > 'd': STOP on 3             d  b  c (e)|a] f
      - 'a' < 'd': STOP on 4             d  b  c (e)(a) f
      - left:'3' < right:'4'
        - switch                         d  b  c (a)(e) f
        - move left->right, right->left  d  b  c |a][e| f

    - STEP_TO_SPLIT_POINT again, this time...
      - 'e' > 'd': STOP on 4             d  b  c (a)[e| f
      - 'a' < 'd': STOP on 3             d  b  c (a)(e) f
      - left:'4' > right:'3'
        - put pivot at midpoint: 3       _  _  _  d  _  _
        - left:1-3                       b  c  a
        - right:4-5                      e  f
        - QUICK SORT left, pivot, QUICK SORT right

  - IMPORTANT:
    - the quick_sort function should return lists of 1 as 'sorted'
    - the quick_sort function should sort a <=> b and return the pair


=end

module RubySorts
  class QuickSort < SortBase

    def sort
      quick_sort @unsorted
    end

    def render(arr,left,right,pivot)
      last_i = arr.length - 1
      elms = (0..last_i).map do |i|
        val = arr[i]
        val = ">#{val}" if i == left
        val = "#{val}<" if i == right
        val = "[#{val}"  if i == 0
        val = "#{val}]"  if i == last_i
        val = " #{val} "
      end
      "|#{pivot}| #{elms.join}"
    end

    def quick_sort(arr)
      # quick returns break recursion for one/two element arrays
      if arr.length <= 2
        arr.reverse! if arr.length == 2 && arr[0] > arr[1]
        return arr
      end

      # pull the pivot, partition remainder
      pivot = arr.shift
      left, right = partition_array(arr, pivot)

      # sort the sides recursively
      left = quick_sort(left) unless left.empty?
      right = quick_sort(right) unless right.empty?

      # re-assemble / unwind
      [*left, pivot, *right]
    end

    # takes an array and splits it into left (less than) and right (greater than)
    # by moving in from both sides, swapping values as positions move towards the midpoint
    def partition_array(array, pivot)
      left_i  = 0
      right_i = (last_i = array.length - 1)

      # haven't crossed/met yet...
      while left_i < right_i
        while array[left_i] <= pivot && left_i < last_i
          left_i += 1
        end

        while array[right_i] >= pivot && right_i > 0
          right_i -= 1
        end

        # four possibilities (extract this part)
        if left_i < right_i # stopped but not crossed
          # swap left and right values
          tmp = array[left_i]
          array[left_i] = array[right_i]
          array[right_i] = tmp
          # repeat loop
        else
          if left_i > right_i # # crossed, midpoint found
            midpoint = left_i #left_i is to right of midpoint after cross
            left = array
            right = left.slice!(midpoint..-1)
          elsif right_i == 0 # right marker came all the way over: ALL GREATER THAN
            left, right = [], array
          else left_i == last_i # left marker came all the way right: ALL LESS THEN
            left, right = array, []
          end
          break
        end

      end

      return left, right
    end

  end
end