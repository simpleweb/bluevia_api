module BlueviaApi
  module Configuration
    attr_accessor :token, :secret, :sandbox
    attr_writer :keyword, :sandbox

    def keyword
      prefix = if @sandbox then "SAND"
               elsif @testing then "TEST"
               else ""
               end

      "#{prefix}#{@keyword}"
    end

    def sandbox
      @sandbox ||= false
    end
  end
end
