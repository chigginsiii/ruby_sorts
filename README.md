# RubySorts

A number of sorting algorithms implented and benchmarked.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_sorts', git: 'https://github.com/chigginsiii/ruby_sorts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_sorts

## Usage

    unsorted = [4, 8, 7, 3, 9, 1, 5, 10, 2, 6]

    sorted = RubySorts.bubble(unsorted)
    # or...
    sorted = RubySorts::BubbleSort.new(unsorted).sort

## Sort Algorithms

    # RubySorts::BubbleSort
    sorted = RubySorts.bubble_sort unsorted

    # RubySorts::SelectionSort
    sorted = RubySorts.selection_sort unsorted

    # RubySorts::InsertionSort
    sorted = RubySorts.insertion_sort unsorted

    # RubySorts::ShellSort
    sorted = RubySorts.shell_short unsorted

    # RubySorts::MergeSort
    sorted = RubySorts.merge_sort unsorted

    # RubySorts::QuickSort
    sorted = RubySorts.quick_sort unsorted

## Benchmark

    > bin/benchmark -h 
    Options:
      -s, --size=<s>          size of array ('sm', 'md', 'lg') (default: 'md')
      -n, --iterations=<i>    number of times to sort (default: 10)
      -h, --help              Show this message

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ruby_sorts.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

