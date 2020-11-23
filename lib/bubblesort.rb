# frozen_string_literal: true

def bubble_sort(ary)
  n = ary.length

  swapped = true

  while swapped
    swapped = false
    0.upto(ary.size - 2) do |i|
      if ary[i] > ary[i + 1]
        ary[i], ary[i + 1] = ary[i + 1], ary[i]
        swapped = true
      end
    end
   end

  ary
end

bubble_sort([3, 2, 1])
