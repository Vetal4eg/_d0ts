# encoding: utf-8
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 10_000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
