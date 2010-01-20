
module ActionController #:nodoc:
  module Caching
    class Sweeper < ActiveRecord::Observer #:nodoc:
      private
        def callback_with_controller_check
          super if controller
        end
        alias_method_chain :callback, :controller_check
    end
  end
end

