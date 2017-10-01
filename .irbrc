# encoding: utf-8
require 'rubygems'

# Awesomeprint replaces irb's default pretty printing with fancier formatting
require "awesome_print"
AwesomePrint.irb!

IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY] = 10_000
IRB.conf[:PROMPT_MODE]  = :SIMPLE
IRB.conf[:AUTO_INDENT]  = true