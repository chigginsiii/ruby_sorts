=begin

Basic sort algorithm:
list = |a|b|c|d|

switch_on_greater(position)
	* switch them if list[position] is greater than list[position+1]

* first run: a <=> b, b <=> c, c <=> d (i from 1 to 3)
	* switch_on_greater i
* second run: a <=> b, b <=> c
	* switch_on_greater i
* third run: a <=> b
	* switch_on_greater i

=end

module RubySorts
	class BubbleSort < SortBase

		def sort
			bubble_sort @unsorted
		end

		private

		def bubble_sort(arr)
			#
			# we'll need to do n-1 series of passes...
			#
			num_elements = arr.length
			num_passes   = num_elements - 1

			#
			# and each pass we'll do positions ranging from 1 to this pass_num,
			# ( that is, 1..n-1 ), comparing that position to the position to its right.
			#
			num_passes.downto(1) do |last_position|

				num_swaps_this_pass = 0
				1.upto(last_position) do |pos|
					#
					# if we get through all these positions and swap none, we're done
					#
					left,right = (pos - 1), pos
					next if arr[left] < arr[right]
					#
					# swap left with right
					#
					tmp = arr[left]
					arr[left] = arr[right]
					arr[right] = tmp
					#
					# we did at least one swap this pass
					#					
					num_swaps_this_pass += 1
				end

				break if num_swaps_this_pass == 0
			end

			arr
		end
	end
end