module KnifeAttribute
  module Node
    module Helpers
      include KnifeAttribute::Helpers

      def self.included(base)
        base.class_eval do
          deps do
            require 'chef/node'
            require 'chef/json_compat'
          end

          def self.attribute_type_map
            {
              default: :default_attrs,
              normal: :normal_attrs,
              override: :override_attrs,
            }
          end

          def self.default_attribute_type
            :normal
          end
        end
      end

      def node
        @node ||= Chef::Node.load(entity_name)
      end

      def entity_type
        :node
      end
    end
  end
end
