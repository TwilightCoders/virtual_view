require 'active_record'
require 'virtual_view'

module VirtualView
  module ActiveRecord
    module Relation

      def self.prepended(subclass)
        class << subclass
          class_attribute :arel_view
          self.arel_view = false
        end
        subclass.extend(ClassMethods)
      end

      def arel_view
        self.class.arel_view.call.tap do |ar_view|
          unless ar_view.projections.any?
            ar_view.project(arel_table[Arel.star])
          end
        end
      end

      def table_view
        arel_table.create_table_alias(arel_view, table_name)
      end

      def from_clause
        ::ActiveRecord::Relation::FromClause.new(table_view, table_name)
      end

      def from_value
        table_view.to_sql
      end

      module ClassMethods

      end

    end

  end
end
