module CC
  module Integer
    def commatize
      self.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
    end
  end
end

Fixnum.send(:include, CC::Integer)
