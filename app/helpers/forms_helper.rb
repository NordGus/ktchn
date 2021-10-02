module FormsHelper
  def input_class(action = :none, skip = false)
    classes = ['input']

    return classes.join(' ') if skip

    case action
    when :danger
      classes << 'is-danger'
    when :success
      classes << 'is-success'
    when :warning
      classes << 'is-warning'
    end

    classes.join(' ')
  end

  def textarea_class(action = :none, skip = false)
    classes = ['textarea']

    return classes.join(' ') if skip

    case action
    when :danger
      classes << 'is-danger'
    when :success
      classes << 'is-success'
    when :warning
      classes << 'is-warning'
    end

    classes.join(' ')
  end

  def has_errors_for(model, attr)
    model.errors[attr].any?
  end
end