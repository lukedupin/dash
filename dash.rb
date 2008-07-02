class Dash < Hash
	def method_missing( sym, *args )
		(args.size == 0)? self[sym]: self[sym] = args[0]
	end
end
