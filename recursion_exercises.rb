#Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

#Write both a recursive and iterative version of sum of an array.

def range_iter(min, max)
    range = []
    (min...max).each {|num| range << num}
    range
end

p range_iter(5, 2) ## []
p range_iter(0, 0) ## []
p range_iter(0, 1) ## [0]
p range_iter(0, 2) ## [0, 1]
p range_iter(0, 3) ## [0, 1, 2]
p range_iter(0, 4) ## [0, 1, 2, 3]
p range_iter(-3, 4) ## [-3, -2, -1, 0, 1, 2, 3]


def range_rec(min, max)
    return [] if min >= max
    range_rec(min, max - 1) << (max - 1)
end

 p range_rec(5, 2) ## []
 p range_rec(0, 0) ## []
 p range_rec(0, 1) ## [0] 
 p range_rec(0, 2) ## [0, 1]
 p range_rec(0, 3) ## [0, 1, 2]
 p range_rec(0, 4) ## [0, 1, 2, 3]
 p range_rec(-3, 4) ## [-3, -2, -1, 0, 1, 2, 3]

#recursion 1
#exp(b, 0) = 1
#exp(b, n) = b * exp(b, n - 1)
def exp(base, power)
    return 1 if power == 0 
    if power > 0
        base * exp(base, power - 1)
    end
end

p exp(2, 0) #2 ^ 0 = 1
p exp(2, 1) #2 * exp(2,0) = 2
p exp(2, 2) #2 * exp(2, 1) = 4
p exp(2, 3) #2 * exp(2, 2) = 8
p exp(2, 4) #2 * exp(2, 3) = 16

#recursion 2
#exp(b, 0) = 1
#exp(b, 1) = b
#exp(b, n) = exp(b, n / 2) ** 2             [for even n]
#exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exp(base, power)
    return 1 if power == 0
    return base if power == 1
    if power.even?
        exp(base, power / 2) ** 2 #(2, 2) ** 2 = 16
    else
        base * (exp(base, (power - 1) / 2) ** 2) # 2 * (exp(2, 1))
    end
end

p exp(2, 0) #2 ^ 0 = 1
p exp(2, 1) #2 * exp(2,0) = 2
p exp(2, 2) #2 * exp(2, 1) = 4
p exp(2, 3) #2 * exp(2, 2) = 8
p exp(2, 4) #2 * exp(2, 3) = 16

#Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.
#Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.
#It's okay to iterate over array elements using the normal each for this one :-)
#You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

class Array
    def deep_dup
        #return self.dup if self.length == 1 || !self.is_a?(Array)
        arr = []
        self.each do |ele| 
            if ele.is_a?(Array) 
                arr << ele.deep_dup
            else
                arr << ele
            end
        end
        arr
    end

p robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

end

#Fibonacci
#Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

#You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fibonacci_iter(n)
    return [1] if n == 1
    return [1, 1] if n == 2

    seq = [1, 1]
    while seq.length < n
        seq << seq[-1] + seq[-2]
    end
    seq
end

p fibonacci_iter(1)
p fibonacci_iter(2)
p fibonacci_iter(3)
p fibonacci_iter(5)
p fibonacci_iter(10)

def fibonacci_rec(n)
    return [1] if n == 1
    return [1, 1] if n == 2
    prev = fibonacci_rec(n - 1)
    next_num = prev[-1] + prev[-2]
    prev << next_num
end

p fibonacci_rec(1)
p fibonacci_rec(2)
p fibonacci_rec(3)
p fibonacci_rec(5)
p fibonacci_rec(10)

#Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.
def bsearch(array, target)
    return target if array[array.length / 2] == target
    #use something like we learned in quick sort?

end

#Make sure that these test cases are working:

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil