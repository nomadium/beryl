# Here are defined all Smalltalk object and classes expected
# to be available at runtime.
#
# At the present time, only a dummy implementation of Transcript
# is available.
#
# The goal is to have all Smalltalk classes written in Smalltalk
# and remove this bootstrap file eventually, but first I'll to
# implement some classes in Ruby.
module Transcript
  def self.show(obj)
    print obj
  end
end
