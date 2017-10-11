# encoding: utf-8
require 'rubygems'

require 'irb/ext/save-history'
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 20_000
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true

# require files from gems that are not in the bundle
def require_without_bundler(gem, file)
  return require(file) unless defined?(::Bundler)
  if gem_path = Dir.glob("{#{Gem.path.join(',')}}/gems/#{gem}*").first
    $LOAD_PATH << "#{gem_path}/lib"
    require file
  else
    raise LoadError, "Gem #{gem} not found via require_without_bundler"
  end
end


def sql(query)
  ActiveRecord::Base.connection.select_all(query)
end