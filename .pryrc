Pry.editor = 'nvim'

# awesome print
if defined?(AwesomePrint)
  require "awesome_print"
  AwesomePrint.pry!
end

# See https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

Pry.config.history.should_save = false

# Disable pry-buggy-plug:
Pry.plugins["buggy-plug"].disable!