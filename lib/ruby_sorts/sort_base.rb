=begin

  provides basic methods for sorting classes. Of interest:
	- YOU need to subclass sort_algorithm, which should
	  expect to find @unsorted as the list to be sorted.

  usage:

  module RubySorts
	  class SortMe < SortBase
			private
			def sort_algorithm
        @sorted = @unsorted.clone
        # ...do things to @sorted...
        @sorted
			end
	  end
	end
	
=end

module RubySorts
	class SortBase
		def initialize(*args) 
			@unsorted = from_args(args) || []
		end

		def sort
			raise "MUST SUBCLASS!"
		end

		def from_args(args)
			return [] if args.nil?
			(args.is_a?(Array) ? args : Array(args)).flatten
		end
	end
end