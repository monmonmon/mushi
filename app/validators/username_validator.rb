class UsernameValidator < ActiveModel::EachValidator
  MIN_LENGTH = 3
  MAX_LENGTH = 30
  USERNAME_REGEXP = /^[a-z0-9_][a-z0-9_-]*$/

  def validate_each(record, attribute, value)
    # not allowing too short username for new users
    if record.new_record? && value.size < MIN_LENGTH
      record.errors[attribute] << (options[:message] || "is too short (min is %d characters)" % MIN_LENGTH)
    end
    # length
    if MAX_LENGTH < value.size
      record.errors[attribute] << (options[:message] || "is too long (maximum is %d characters)" % MAX_LENGTH)
    end
    # format validation
    if value !~ USERNAME_REGEXP
      record.errors[attribute] << (options[:message] || I18n.t(:username_format_error))
    end
  end
end
