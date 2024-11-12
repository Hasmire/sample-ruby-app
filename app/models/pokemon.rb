class Pokemon < ApplicationRecord
  belongs_to :user
  has_one :daycare_slot
  has_one_attached :image
  
  enum :pokemon_type, {
    normal: 0,
    fire: 1,
    water: 2,
    grass: 3,
    electric: 4,
    ice: 5,
    fighting: 6,
    poison: 7,
    ground: 8,
    flying: 9,
    psychic: 10,
    bug: 11,
    rock: 12,
    ghost: 13,
    dragon: 14,
    dark: 15,
    steel: 16,
    fairy: 17,
  }
end
