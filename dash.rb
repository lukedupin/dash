class Dash < Hash
		#Load in a user's hash if they give me one
	def initialize( hash = nil )
		hash.each { |k, v| self[k] = v } if hash.is_a? Hash
	end

		#Attempt to index this guy via the the index requested
	def method_missing( sym, *args )
		(args.size == 0)? self[sym]: self[sym] = args[0]
	end
end
