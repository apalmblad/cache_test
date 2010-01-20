class TestStore < ActiveSupport::Cache::MemoryStore #:nodoc:
  attr_reader :written, :deleted, :deleted_matchers

  def initialize
    super
    @written = []
    @deleted = []
    @deleted_matchers = []
  end
                
  def reset
    @data.clear
    @written.clear
    @deleted.clear
    @deleted_matchers.clear
  end

  def write(name, value, options = nil)
    @written.push(name)
    super
  end

  def delete(name, options = nil)
    @deleted.push(name)
    super
  end

  def delete_matched(matcher, options = nil)
    @deleted_matchers.push(matcher)
  end

  def written?(name)
    @written.include?(name)
  end

  def deleted?(name)
    @deleted.include?(name) || @deleted_matchers.detect { |matcher| name =~ matcher }
  end
end
