class Greetings
  def list
    list = ['We hope that everything is good. The weather is mainly',
            'Life is short, so enjoy! The weather is',
            'For today, we will have this weather']
    list.sample
  end

  def warm
    list_hot = ['Embrace yourself for a little heat! The temperature is',
                'Be ready to sweat a little because we will have a hot day with',
                'Hope you are ready for a little warm. We have']
    list_hot.sample
  end

  def cold
    list_cold = ['Embrace yourself for a little breeze! The temperature is',
                 "Don't forget your sweeter because today will be a little cold! We have",
                 'Use this cold weather as an opportunity to wear some jackets. The temperature is']
    list_cold.sample
  end
end
