class SkypeIdValidator < ActiveModel::EachValidator
  MIN_LENGTH = 6
  MAX_LENGTH = 32
  SKYPE_ID_REGEXP = /^[a-z][a-z0-9@\.\:,\-_]{5,31}$/i

  def validate_each(record, attribute, value)
    if value.size < MIN_LENGTH
      record.errors[attribute] << (options[:message] || "is too short (min is %d characters)" % MIN_LENGTH)
    end
    if MAX_LENGTH < value.size
      record.errors[attribute] << (options[:message] || "is too long (maximum is %d characters)" % MAX_LENGTH)
    end
    if value !~ SKYPE_ID_REGEXP
      record.errors[attribute] << (options[:message] || I18n.t(:skypename_format_error))
    end
  end
end
