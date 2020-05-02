# frozen_string_literal: true

class Greetings
  def list
    morning_list = ['we hope that everything is good. The weather is mainly']
    morning_list.sample
  end

  def warm
    morning_list_hot = ['Embrace yourself for a little heat! The temperature is']
    morning_list_hot.sample
  end

  def cold
    morning_list_cold = ['Embrace yourself for a little breeze!
      The temperature is']
    morning_list_cold.sample
  end
end
