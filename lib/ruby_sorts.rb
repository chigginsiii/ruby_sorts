require "ruby_sorts/version"
require "ruby_sorts/sort_base"
require "ruby_sorts/bubble_sort"
require "ruby_sorts/selection_sort"
require "ruby_sorts/insertion_sort"
require "ruby_sorts/shell_sort"
require "ruby_sorts/merge_sort"
require "ruby_sorts/quick_sort"
require "ruby_sorts/quick_sort_loud"

module RubySorts
  def self.bubble_sort(*args)
  	BubbleSort.new(args).sort
  end

  def self.selection_sort(*args)
    SelectionSort.new(args).sort
  end

  def self.insertion_sort(*args)
    SelectionSort.new(args).sort
  end

  def self.shell_sort(*args)
    ShellSort.new(args).sort
  end

  def self.merge_sort(*args)
    MergeSort.new(args).sort
  end

  def self.quick_sort(*args)
    QuickSort.new(args).sort
  end

  def self.quick_sort_loud(*args)
    QuickSortLoud.new(args).sort
  end
end
