class Personne
  attr_accessor :nom, :points_de_vie, :en_vie

  def initialize(nom)
    @nom = nom
    @points_de_vie = 100
    @en_vie = true
  end

  def info
    # A faire:
    # - Renvoie le nom et les points de vie si la personne est en vie
    if @en_vie == true
      return "#{@nom}: #{@points_de_vie}/100 pv"
      # - Renvoie le nom et "vaincu" si la personne a été vaincue
    else
      return "#{@nom}: Vaincu"
    end
  end

  def attaque(personne)
    # A faire:
    # - Fait subir des dégats à la personne passée en paramètre
    # - Affiche ce qu'il s'est passé
    puts "#{@nom}: attaque #{personne.nom} !"
    personne.subit_attaque(degats)

    sleep 0.6
  end

  def subit_attaque(degats_recus)
    # A faire:
    # - Réduit les points de vie en fonction des dégats reçus
    # - Affiche ce qu'il s'est passé
    # - Détermine si la personne est toujours en_vie ou non
    puts "#{@nom} subit #{degats_recus} HP de dégats !"
    @points_de_vie -= degats_recus

    if @points_de_vie <= 0 && @en_vie
      @en_vie = false
      puts "#{@nom} est vaincu"
    end

    sleep 0.6

  end
end
