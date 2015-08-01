class UniquenessValidator < ActiveRecord::Validations::UniquenessValidator
  def setup(klass)
    super
    @klass = options[:model] if options[:model]
  end

  def validate_each(record, attribute, value)
    if ! options[:model] && ! record.class.ancestors.include?(ActiveRecord::Base)
      # UniquenessValidator can't be used outside of ActiveRecord instances, here
      # we return the exact same error, unless the 'model' option is given.
      raise ArgumentError, "Unknown validator: 'UniquenessValidator'"
    elsif ! options[:model]
      # If we're inside an ActiveRecord class, and `model` isn't set, use the
      # default behaviour of the validator.
      super
    else
      # Custom validator options. The validator can be called in any class, as
      # long as it includes `ActiveModel::Validations`. You can tell the validator
      # which ActiveRecord based class to check against, using the `model`
      # option. Also, if you are using a different attribute name, you can set the
      # correct one for the ActiveRecord class using the `attribute` option.
      record_org, attribute_org = record, attribute

      attribute = options[:attribute].to_sym if options[:attribute]
      record = options[:model].new(attribute => value)

      super

      if record.errors.any?
        record_org.errors.add(attribute_org, :taken,
          options.except(:case_sensitive, :scope).merge(value: value))
      end
    end
  end
end
