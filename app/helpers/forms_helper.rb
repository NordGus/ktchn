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

  def select_class(action = :none, skip = false)
    classes = ['select']

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

  def can_be_infinity(num)
    return num unless num.infinite?

    output = "Infinity"

    num < 0 ? "-" + output : output
  end
end