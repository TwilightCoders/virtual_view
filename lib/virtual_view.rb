require 'virtual_view/version'
require 'virtual_view/railtie' if defined?(Rails::Railtie)

module VirtualView

  class << self
    attr_writer :logger

    def logger
      @logger ||= Logger.new($stdout).tap do |log|
        log.progname = self.name
        log.level = Logger::INFO
      end
    end

    def activate(klass, &block)
      klass.prepend(VirtualView::ActiveRecord::Relation)
      klass.arel_view = block
    end
  end

  private

end
