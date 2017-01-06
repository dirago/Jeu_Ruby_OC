require_relative 'Personne'

class Ennemi < Personne
  def degats
    # A faire:
    # - Calculer les dégats
    rand(5..15)
  end
end
