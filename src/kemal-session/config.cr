class Session
  class Config
    INSTANCE = self.new

    @timeout      : Time::Span
    @gc_interval  : Time::Span
    @cookie_name  : String
    @engine       : Engine
    property timeout, gc_interval, cookie_name, engine

    def initialize
      @timeout      = Time::Span.new(1, 0, 0)
      @gc_interval  = Time::Span.new(0, 4, 0)
      @cookie_name  = "kemal_sessid"
      @engine       = FileSystemEngine.new({sessions_dir: "./sessions/"})
    end

  end # Config

  def self.config
   yield Config::INSTANCE
  end 

  def self.config
    Config::INSTANCE
  end

end # Session
