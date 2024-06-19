# Реализовать упрощенную стейт машину, подключается через module. Объявляются стейты и начальное состояние. Текущее состояние доступно через вызов state.
# Метод с ! переводит модель в соответствующее состояние, с ? проверяет находится ли она в состоянии. Т.е.
# state_machine states: [:first, :second, :final]
# first! переведет в first
# first? возвращает boolean
# пример использования:
# module StateMachine
#   # TODO: implement me
#  end

#  class MyClass
#   include StateMachine

#   state_machine states: [:first, :second, :final], default: :first
#  end

#  t = MyClass.new
#  t.state # first
#  t.final! # final
#  t.state # final
#  t.first? # false

module StateMachine
  def self.included(extensible_class)
    extensible_class.extend(StateMachineMethods)
  end

  module StateMachineMethods
    def state_machine(states:, default:)
      attr_reader :state

      states.each do |state|
        define_method("#{state}!") { @state = state }

        define_method("#{state}?") { @state == state }
      end

      define_method('initialize') { @state = default }
    end
  end
end

class MyClass
  include StateMachine

  state_machine states: %i[first second final], default: :first
end
