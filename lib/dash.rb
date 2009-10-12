class Dash < Hash
		#Load in a user's hash if they give me one
	def initialize( hash = nil )
		hash.each do |k, v| 
			self[k] = v 
		end if !hash.nil?
	end

    #Deal with array addresses
  def []( key )
    super
  end

    #Deal with array addresses
  def []=( key, value )
    super
  end

		#define id's
	def id; self[:id] || self['id']; end; def id=(v); self[:id] = v; end;

    #Transfer all symbol keys to string keys
  def transfer
    self.keys.each do |k|
      self[k.to_s] = self[k] if k.is_a? Symbol
    end
    return self
  end

		#Define the respond to method
	def respond_to?(v)
		self.has_key?(v)
	end

		#Attempt to index this guy via the the index requested
	def method_missing( sym, *args )
		(args.size == 0)? self[sym] || self[sym.to_s]: self[sym] = args[0]
	end
end
