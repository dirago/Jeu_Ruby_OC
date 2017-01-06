require_relative 'Monde.rb'
require_relative 'Ennemi.rb'
require_relative 'Joueur.rb'
require_relative 'Personne.rb'
class Jeu
  def self.actions_possibles(monde)
    puts "ACTIONS POSSIBLES :"

    puts "0 - Se soigner"
    puts "1 - Améliorer son attaque"

    # On commence à 2 car 0 et 1 sont réservés pour les actions
    # de soin et d'amélioration d'attaque
    i = 2
    monde.ennemis.each do |ennemi|
      puts "#{i} - Attaquer #{ennemi.info}"
      i = i + 1
    end
    puts "99 - Quitter"
  end

  def self.est_fini(joueur, monde)
    # A faire:
    # - Déterminer la condition de fin du jeu
    if monde.ennemis_en_vie.size == 0 || !joueur.en_vie
    	return true
    else
    	return false
    end
  end
end
##############

# Initialisation du monde
monde = Monde.new

# Ajout des ennemis
monde.ennemis = [
    Ennemi.new("Balrog"),
    Ennemi.new("Goblin"),
    Ennemi.new("Squelette")
]

# Initialisation du joueur
puts "Quel est votre prénom ?"

customPlayer = gets.chomp

joueur = Joueur.new(customPlayer)

# Message d'introduction. \n signifie "retour à la ligne"
puts "\n\nAinsi débutent les aventures de #{joueur.nom}\n\n"

# Boucle de jeu principale
100.times do |tour|
  puts "\n------------------ Tour numéro #{tour} ------------------"

  # Affiche les différentes actions possibles
  Jeu.actions_possibles(monde)

  puts "\nQUELLE ACTION FAIRE ?"
  # On range dans la variable "choix" ce que l'utilisateur renseigne
  choix = gets.chomp.to_i

  # En fonction du choix on appelle différentes méthodes sur le joueur
  if choix == 0
    joueur.soin
  elsif choix == 1
    joueur.ameliorer_degats
  elsif choix == 99
    # On quitte la boucle de jeu si on a choisi
    # 99 qui veut dire "quitter"
    break
  else
    # Choix - 2 car nous avons commencé à compter à partir de 2
    # car les choix 0 et 1 étaient réservés pour le soin et
    # l'amélioration d'attaque
    ennemi_a_attaquer = monde.ennemis[choix - 2]
    joueur.attaque(ennemi_a_attaquer)
  end

  puts "\nLES ENNEMIS RIPOSTENT !"
  # Pour tous les ennemis en vie ...
  monde.ennemis_en_vie.each do |ennemi|
    # ... le héro subit une attaque.
    ennemi.attaque(joueur)
  end

  puts "\nEtat du héro: #{joueur.info}\n"

  # Si le jeu est fini, on interompt la boucle
  break if Jeu.est_fini(joueur, monde)
end

puts "\nGame Over!\n"

# A faire:
# - Afficher le résultat de la partie

if joueur.en_vie
  puts "Vous avez gagné ! :-)"
else
  puts "Vous avez perdu ! :-("
end
