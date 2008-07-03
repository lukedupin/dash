class Dash < Hash
		#Load in a user's hash if they give me one
	def initialize( hash = nil )
		hash.each { |k, v| self[k.to_sym] = v } if !hash.nil?
	end

		#Attempt to index this guy via the the index requested
	def method_missing( sym, *args )
		if args.size == 0
			return self[sym]
		else
			return self[sym.to_s[0..-2].to_sym] = args[0]
		end
	end
end
