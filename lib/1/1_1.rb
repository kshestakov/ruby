# Урок 1
# Задание 1
# реализовать интерфейсы для массива:
# [].convert_all_to(type)

# [].convert_all_to!(type)

# [].with_string_version_of_element do |e|
#   ...
# end

class Array
  TYPES = {
    :string => 'to_s',
    :integer => 'to_i',
    :float => 'to_f',
    :array => 'to_a',
    :symbol => 'to_sym',
    :hash => 'to_h',
    :set => 'to_set',
    :complex => 'to_c',
    :rational => 'to_r',
    :enumerable => 'to_enum',
    :procedure => 'to_proc',
}.freeze

  def convert_all_to(type)
    map { |el| el.public_send(TYPES[type]) }
  rescue NoMethodError, TypeError
    raise ArgumentError, "Cannot convert elements to #{type}"
  end

  def convert_all_to!(type)
    map! { |el| el.public_send(TYPES[type]) }
  rescue NoMethodError, TypeError
    raise ArgumentError, "Cannot convert elements to #{type}"
  end

  def with_string_version_of_element(&block)
    each { |el| block.call(el.to_s) }
  rescue StandardError => e
    "Error in with_string_version_of_element method: #{e}"
  end
end
