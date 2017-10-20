Pry.editor = 'nvim'

if defined?(AwesomePrint)
  require "awesome_print"
  AwesomePrint.pry!
end

Pry.config.history.should_save = false

# Disable pry-buggy-plug:
Pry.plugins["buggy-plug"].disable!