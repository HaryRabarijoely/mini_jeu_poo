
class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points <= 0
      print "#{@name} a 0 point de vie!"
    else @life_points > 0
      print "#{@name} a #{@life_points} points de vie"
    end
  end


  def gets_damage(damages)
    @life_points = @life_points - damages
    @life_points <= 0
    puts "-----"
    puts "Fin de la partie, #{self.name} a été tué"
  end

  def attacks(player)
    damage = compute_damage
    puts "Le joueur #{self.name} attaque le joueur #{player.name}"
    puts "Il lui inflige #{damage} points de dommages"
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end

class HumanPlayer < Player
  attr_accessor :weapon_level
  attr_accessor :compute_damage_rand

  def initialize(name)
    super(name)

    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} a 0 points de vie"
    else
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level} "
    end
  end

  def compute_damage
    super * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon} "
    if new_weapon > @weapon_level
      puts "Cette arme est plus puissante"
      @weapon_level = new_weapon
    else
      puts "Cette arme est moins puissante"
    end
  end

  def search_health_pack
    new_health_pack = rand(1..6)
    if new_health_pack == 1
      puts "tu n'as rien trouvé "
    elsif new_health_pack >= 2 && new_health_pack <= 5
      puts "bravo, tu as trouvé un pack de + 50 points de vie"
      if @life_points >= 50
        @life_points = 100
      else
        @life_points = @life_points + 50
      end
    else
      puts "waow, tu as trouvé un pack de + 80 points de vie"
      if @life_points >= 20
        @life_points = 100
      else
        @life_points = @life_points + 80
      end
    end
  end

end
