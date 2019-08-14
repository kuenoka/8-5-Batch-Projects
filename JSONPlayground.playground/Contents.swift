import UIKit

struct Ability: Decodable {
    let name: String
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey{
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    enum AbilityCodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .ability)
        name = try abilityContainer.decode(String.self, forKey: .name)
        isHidden = try container.decode(Bool.self, forKey: .isHidden)
        slot = try container.decode(Int.self, forKey: .slot)
    }
}

struct Forms: Decodable {
    let name: String
}

struct GameIndices: Decodable{
    let gameIndex: Int
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case gameIndex = "game_index"
        case version
    }
    
    enum VersionCodingKeys: String, CodingKey{
        case name
    }
    
    init( from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy: VersionCodingKeys.self, forKey: .version)
        gameIndex = try container.decode(Int.self, forKey: .gameIndex)
        name = try abilityContainer.decode(String.self, forKey: .name)
    }
}

struct VersionGroupDetails: Decodable{
    let levelLearnedAt: Int
    var name: String
    
    enum CodingKeys: String, CodingKey{
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
    
    enum MoveLearnMethodKeys: String, CodingKey{
        case name
    }
    
    enum VersionGroupKeys: String, CodingKey{
        case name
    }
    
    init( from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let moveLearnMethodContainer = try container.nestedContainer(keyedBy: MoveLearnMethodKeys.self, forKey: .moveLearnMethod)
        let versionGroupContainer = try container.nestedContainer(keyedBy: VersionGroupKeys.self, forKey: .versionGroup)
        levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
        name = try moveLearnMethodContainer.decode(String.self, forKey: .name)
        name = try versionGroupContainer.decode(String.self, forKey: .name)
    }
    
}

struct Moves: Decodable{
    let name: String
    let versionGroupDetail: [VersionGroupDetails]
    
    enum CodingKeys: String, CodingKey{
        case move
        case versionGroupDetail = "version_group_details"
    }
    
    enum MoveCodingKey: String, CodingKey{
        case name
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let moveContainer = try container.nestedContainer(keyedBy: MoveCodingKey.self, forKey: .move)
        name = try moveContainer.decode(String.self, forKey: .name)
        versionGroupDetail = try container.decode([VersionGroupDetails].self, forKey: .versionGroupDetail)
    }
}

struct Species: Decodable{
    let name: String
}

struct Sprites: Decodable{
    let backDefault: URL?
    let backFemale: URL?
    let backShiny: URL?
    let backShinyFemale: URL?
    let frontDefault: URL?
    let frontFemale: URL?
    let frontShiny: URL?
    let frontShinyFemale: URL?
    
    enum CodingKeys: String, CodingKey{
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_Shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct Stats: Decodable{
    let baseStat: Int
    let effort: Int
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case baseStat = "base_stat"
        case effort
        case stat
    }
    
    enum StatCodingKeys: String, CodingKey{
        case name
    }
    
        init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let statContainer = try container.nestedContainer(keyedBy: StatCodingKeys.self, forKey: .stat)
        baseStat = try container.decode(Int.self, forKey: .baseStat)
        effort = try container.decode(Int.self, forKey: .effort)
        name = try statContainer.decode(String.self, forKey: .name)
    }
}

struct Types: Decodable{
    let slot: Int
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case slot
        case type
    }
    
    enum TypeCodingKeys: String, CodingKey{
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try container.nestedContainer(keyedBy: TypeCodingKeys.self, forKey: .type)
        slot = try container.decode(Int.self, forKey: .slot)
        name = try typeContainer.decode(String.self, forKey: .name)
    }
}

struct Pokemon: Decodable{
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Forms]
    let gameIndices: [GameIndices]
    let height: Int
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: URL
    let moves: [Moves]
    let name: String
    let order: Int
    let species: Species
    let sprites: Sprites
    let stats: [Stats]
    let types: [Types]
    let weight: Int
    
    enum CodingKeys: String, CodingKey{
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case name
        case order
        case species
        case sprites
        case stats
        case types
        case weight
    }
}

if let pokemonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"),
    let pokemonData = try? Data(contentsOf: pokemonURL){
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData)
    
    print(pokemon)
}
else {
    print("something went wrong")
}

