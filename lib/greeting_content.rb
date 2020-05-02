# frozen_string_literal: true

class Greetings
  def list
    morning_list = ['Hey, Hope you are having an awesome day. The weather is']
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
