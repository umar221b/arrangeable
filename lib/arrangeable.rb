require "arrangeable/version"
require "active_support/concern"

module Arrangeable
  # class Error < StandardError; end

  extend ActiveSupport::Concern
  included {}

  class_methods do
    def arrange(order_param)
      order_by_clause = order_string(order_param)
      order(order_by_clause)
    end

    # array of strings of fields that support being sorted by
    def arrangeable_fields
      raise NotImplementedError, 'You need to overwrite this method in the calling class'
    end

    private

    def order_string(sort_string)
      keys = sort_string.gsub(' ', '').split(',').uniq.reject(&:blank?)
      keys << 'id' unless keys.include?('id') || keys.include?('-id')
      keys.map do |key|
        order = ' ASC'
        if key[0] == '-'
          order = ' DESC'
          key = key[1..-1]
        end
        next unless arrangeable_fields.include?(key)
        "#{self.table_name}.#{key} #{order}"
      end.compact.join(', ')
    end
  end
end
