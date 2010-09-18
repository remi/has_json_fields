module HasJsonFields
  module Mixin

    def has_json_fields *fields # {{{
      fields.each do |field|

        define_method field do |*args|
          a = self.read_attribute(field)
          return {} if a.nil?
          JSON.parse(a, :symbolize_names => true)
        end

        define_method "#{field}=" do |new_value|
          self.write_attribute(field, ActiveSupport::JSON.encode(new_value))
        end

        # TODO
        # def merge!

      end
    end # }}}

  end
end
# vim: fdm=marker:
