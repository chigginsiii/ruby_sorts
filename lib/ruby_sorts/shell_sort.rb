module RubySorts
  class ShellSort < SortBase

    # - pick some number of partitions
    #   - let's say 2-5 depending on the length of the array
    # - make NUM_PARTITIONS virtual arrays out of the array like so:
    #   arr = (0..21).to_a
    #   NUM_PARTITIONS is 4
    #
    #   arr_virt_1 = arr[0, 4,  8, 12, 16, 20]
    #   arr_virt_2 = arr[1, 5,  9, 13, 17, 21]
    #   arr_virt_3 = arr[2, 6, 10, 14, 18]
    #   arr_virt_4 = arr[3, 7, 11, 15, 19]
    # 
    # THIS PARTITIONS AN ARRAY:
    # -------------------------
    # partitions = Array.new(NUM_PARTITIONS) {[]}
    # until input_array.empty?
    #   (0..NUM_PARTITIONS-1).do |i|
    #     partitions[i] << input_array.unshift
    #   end
    # end
    # -------------------------
    #
    # changing 'indexes.unshift' to 'array[indexes.unshift]'
    # makes 'partitions' into a two dimensional array of values
    #
    # if we can reverse that partitioning...
    #
    # DEPARTITION:
    # departitioned = [].zip(partitions).flatten
    # end
    #
    def sort
      shell_sort @unsorted
    end

    def shell_sort(array)
      parted = partition_array(array)

      # insertion sort each of the sub arrays
      parted.each do |sub_array|
        insertion_sort(sub_array)
      end

      # now departition, and insertion sort the flattened zipped array one time
      unparted = departition_array(parted)
      insertion_sort(unparted)
    end

    def num_partitions(array)
      # should keep each subarray down to ~5 elements
      array.length >= 10 ? Integer(array.length / 5) : 2
    end

    def partition_array(array)
      partitions = Array.new( num_partitions(array) ) {[]}
      partitions.cycle do |partition|
        partition << array.shift
        break if array.empty?
      end
      partitions
    end

    def departition_array(parted_array)
      parted_array[0].zip(parted_array[1..-1])
      parted_array.flatten!
      parted_array
    end

    def insertion_sort(array)
      # easy enough...
      return array if array.length < 2

      # - start with a 'sorted list of one element'
      # - insert_i will be the currently blank slot, initially 
      #   the slot just right of the already sorted list
      #   - on the first pass that will be [1], second pass: [2]..
      #   - up to n-1 pass: [n]
      # we'll compare it to its left-neighbor
      (1..array.length-1).each do |insert_i|
        val = array[insert_i]

        # if the insert slot gets to slot-0, use that.
        while insert_i > 0
          compare_val = array[insert_i - 1]
          # use this slot if val is greater than the left neighbor
          break if val > compare_val
          # otherwise shift the value in compare slot right...
          array[insert_i] = compare_val
          # ... and decrement the insert-slot index
          insert_i -= 1
        end
        array[insert_i] = val
      end
      array
    end
  end
end