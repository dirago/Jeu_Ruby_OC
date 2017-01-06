class Monde
  attr_accessor :ennemis

  def ennemis_en_vie
    # A faire:
    # - Ne retourner que les ennemis en vie
    @ennemis.select do |ennemi|
    	ennemi.en_vie
    end
  end
end


