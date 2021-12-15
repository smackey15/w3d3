class Array

    def deep_dup ##not finished
        return self.dup if self.length == 1 || !self.is_a?(Array)
        arr = []
        self.each {|ele| arr << ele.deep_dup}
        arr
    end

#p robot_parts.deep_dup = 
p [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
].deep_dup

end