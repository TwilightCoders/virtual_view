require 'active_record'
require 'virtual_view/active_record/relation'

module VirtualView
  module ActiveRecord
    module Base
      extend ActiveSupport::Concern

      module ClassMethods

        def arel_view(&block)
          VirtualView.activate(const_get(:ActiveRecord_Relation), &block)
        end

      end

    end

  end
end
