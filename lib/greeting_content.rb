# frozen_string_literal: true

class Greetings
  def morning_list
    morning_list = ['Good Morning! Today we have a day ',
                    'Hey, Have a nice day! For today the temperature is']
    morning_list.sample
  end

  def morning_list_hot
    morning_list_hot = ['Embrace yourself for a little heat! The temperature is']
    morning_list_hot.sample
  end

  def morning_list_cold
    morning_list_cold = ['Embrace yourself for a little breeze!
      The temperature is']
    morning_list_cold.sample
  end

  def night_list
    night_list = ['Now it is time to rest. Have a wondefull night.']
    night_list.sample
  end

  def night_list_warm
    @night_list_warm = ['Embrace yourself for a little heat.']
    @night_list_warm.sample
  end

  def night_list_cold
    @night_list_cold = ['Embrace yourself for a little cold.']
    @night_list_cold.sample
  end
end
