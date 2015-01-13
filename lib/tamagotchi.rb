class Tamagotchi

  define_method(:initialize) do |name|
    @name=name
    @food=10
    @sleep=10
    @activity=10
    @age = 0.0
    @current_time_sleep= Time.now
    @current_time_food= Time.now
    @current_time_activity= Time.now


  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food
  end
  define_method(:sleep_level) do
    @sleep
  end

  define_method(:activity_level) do
    @activity
  end

  define_method(:get_age) do
    @age
  end

  define_method(:add_to_age) do |years|
    @age+=years
  end

  define_method(:time_passes) do
    @food=@food-1

  end

  define_method(:day_passes) do
    @sleep -= 1
    @activity -= 1
    @age += 0.1
  end

  define_method(:put_it_to_sleep) do
    @sleep += 1
  end

  define_method(:feed_it) do
    t=Time.now

    @food -= (t.tv_sec - @current_time_food.tv_sec)

    food_level_set(@food)
    #binding.pry
    add_to_age(t.tv_sec-@current_time_food.tv_sec)
    if (@food<20 && is_alive?())
       @food += 1
       @current_time_food=Time.now
    end
  end

  define_method(:activity) do
    @activity += 1
  end


  define_method(:food_level_set) do |value|
    @food = value
  end

  define_method(:sleep_level_set) do |value|
    @sleep = value
  end

  define_method(:activity_level_set) do |value|
    @activity = value
  end

  define_method(:is_alive?) do

    if (@food>0 && @food < 20) && (@activity>0 && @activity<20) && (@sleep>0 && @sleep<20)
      return true
    else
      return false

    end

  end
end
