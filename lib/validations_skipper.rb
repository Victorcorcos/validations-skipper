module ValidationsSkipable
  def self.included(base)
    base.class_eval do
      attr_accessor :skip_validations

      def initialize(*)
        @original_methods = self.class.instance_methods.map do |instance_method|
          [instance_method, method(instance_method)]
        end.to_h
        super
      end

      def skip_validations
        @skip_validations ||= []
      end

      def skip_validations=(skip_validations)
        @skip_validations = skip_validations

        @skip_validations.each do |validation_method|
          define_singleton_method(validation_method) do
            return if __method__.in? @skip_validations
            @original_methods[validation_method].call
          end
        end
      end
    end
  end
end
