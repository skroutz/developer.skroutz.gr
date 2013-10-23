module ResponseMate
  class << self
    attr_accessor :configuration
  end

  class Configuration
    attr_accessor :output_dir, :requests_manifest

    def initialize
      @output_dir = './output/responses/'
      @requests_manifest = './requests.yml'
    end
  end

  def self.setup
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end
end

ResponseMate.setup
