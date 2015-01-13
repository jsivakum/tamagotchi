require('rspec')
require('tamagotchi')
require('pry')


describe("Tamagotchi") do
  describe("#initialize") do
    it("sets the name and a few other properties") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()
      expect(my_pet.food_level()).to(eq(9))
    end
  end
  describe("#day_passes") do
    it("decreases the activity and sleep of the Tamagotchu by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.day_passes()
      expect(my_pet.sleep_level()).to(eq(9))
      expect(my_pet.activity_level()).to(eq(9))
    end
  end

  describe("#get_Age") do
    it("displays the age of the tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.day_passes()
      my_pet.day_passes()
      expect(my_pet.get_age()).to(eq(0.2))
    end
  end

describe("#feed_it") do
  it("checks to make sure tamagotchi is not dead before feeding") do
    my_pet = Tamagotchi.new("lil dragon")
    my_pet.feed_it()
    sleep(8)
    my_pet.feed_it()
    expect(my_pet.get_age()).to(eq(0.2))
  end
end

  describe("#is_alive?") do
    it("is alive if the food/sleep/activity level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive?()).to(eq(true))
    end

    it("is dead if the food level is 20") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.food_level_set(20)
      expect(my_pet.is_alive?()).to(eq(false))
    end
    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.food_level_set(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end

    it("is dead if the activity level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.activity_level_set(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end

    it("is dead if the sleep level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.sleep_level_set(0)
      expect(my_pet.is_alive?()).to(eq(false))
    end
  end
end
