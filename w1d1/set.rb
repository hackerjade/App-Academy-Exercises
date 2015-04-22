require 'byebug'

class MyHashSet
  debugger

  attr_reader :store

  def initialize set = {}
    @store = set
  end

  def insert el
    @store[el] = true
  end

  def include? el
    @store.has_key?(el)
  end

  def delete el
    !!@store.delete(el)
  end

  def to_a
    @store.keys
  end

  def union(set)
    MyHashSet.new @store.merge(set.store)
  end

  def intersect(set)
    result_set = MyHashSet.new
    set.to_a.each do |key|
      if include?(key)
        result_set.insert key
      end
    end
    result_set
  end

  def minus(set)
    result_set = MyHashSet.new
    self.to_a.each do |key|
      unless set.include?(key)
        result_set.insert key
      end
    end
    result_set
  end

end

set1 = MyHashSet.new
set2 = MyHashSet.new


set1.insert(5)
set1.insert(3)
set2.insert(3)
set2.insert(1)
p set1.minus(set2)

# paired with Jay Gabriels jgabriels30@gmail.com
