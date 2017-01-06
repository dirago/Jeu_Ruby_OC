class Joueur < Personne
  attr_accessor :degats_bonus

  def initialize(nom)
    # Par défaut le joueur n'a pas de dégats bonus
    @degats_bonus = 0

    # Appelle le "initialize" de la classe mère (Personne)
    super(nom)
  end

  def degats
    # A faire:
    # - Calculer les dégats
    # - Affiche ce qu'il s'est passé
    puts "#{@nom} profite de #{@degats_bonus} points de dégâts bonus"
    sleep 0.6
    rand(20..40) + @degats_bonus + 5
  end

  def soin
    # A faire:
    # - Gagner de la vie
    # - Affiche ce qu'il s'est passé
    @points_de_vie += rand(20..40)
    if @points_de_vie > 100
      @points_de_vie = 100
    end
    puts "#{@nom} a gagné de la vie !"

    sleep 0.6
  end

  def ameliorer_degats
    # A faire:
    # - Augmenter les dégats bonus
    # - Affiche ce qu'il s'est passé
    @degats_bonus += rand(5..15)
    puts "#{@nom} prend de la puissance !"

    sleep 0.6
  end
end
