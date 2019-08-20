//
//  APIStruct.swift
//  PokeApiProject
//
//  Created by MCS on 8/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct FirstTuple {
    var property: String
    var myURL: String
}

struct SecondTuple {
    var property: String
    var output: Any
}

struct PokeAPI: Codable{
    let ability: String
    let berry: String
    let berryFirmness: String
    let berryFlavor: String
    let characteristic: String
    let contestEffect: String
    let contestType: String
    let eggGroup: String
    let encounterCondition: String
    let encounterConditionValue: String
    let encounterMethod: String
    let evoulutionChain: String
    let evolutionTrigger: String
    let gender: String
    let generation: String
    let growthRate: String
    let item: String
    let itemAttribute: String
    let itemCategory: String
    let itemFlingEffect: String
    let itemPocket: String
    let language: String
    let location: String
    let locationArea: String
    let machine: String
    let move: String
    let moveAilment: String
    let moveBattleStyle: String
    let moveCategory: String
    let moveDamageClass: String
    let moveLearnMethod: String
    let moveTarget: String
    let nature: String
    let palParkArea: String
    let pokeathlonStat: String
    let pokedex: String
    let pokemon: String
    let pokemonColor: String
    let pokemonForm: String
    let pokemonHabitat: String
    let pokemonShape: String
    let pokemonSpecies: String
    let region: String
    let stat: String
    let superContestEffect: String
    let type: String
    let version: String
    let versionGroup: String
    
    enum CodingKeys: String, CodingKey{
        case ability
        case berry
        case berryFirmness = "berry-firmness"
        case berryFlavor = "berry-flavor"
        case characteristic
        case contestEffect = "contest-effect"
        case contestType = "contest-type"
        case eggGroup = "egg-group"
        case encounterCondition = "encounter-condition"
        case encounterConditionValue = "encounter-condition-value"
        case encounterMethod = "encounter-method"
        case evoulutionChain = "evolution-chain"
        case evolutionTrigger = "evolution-trigger"
        case gender
        case generation
        case growthRate = "growth-rate"
        case item
        case itemAttribute = "item-attribute"
        case itemCategory = "item-category"
        case itemFlingEffect = "item-fling-effect"
        case itemPocket = "item-pocket"
        case language
        case location
        case locationArea = "location-area"
        case machine
        case move
        case moveAilment = "move-ailment"
        case moveBattleStyle = "move-battle-style"
        case moveCategory = "move-category"
        case moveDamageClass = "move-damage-class"
        case moveLearnMethod = "move-learn-method"
        case moveTarget = "move-target"
        case nature
        case palParkArea = "pal-park-area"
        case pokeathlonStat = "pokeathlon-stat"
        case pokedex
        case pokemon
        case pokemonColor = "pokemon-color"
        case pokemonForm = "pokemon-form"
        case pokemonHabitat = "pokemon-habitat"
        case pokemonShape = "pokemon-shape"
        case pokemonSpecies = "pokemon-species"
        case region
        case stat
        case superContestEffect = "super-contest-effect"
        case type
        case version
        case versionGroup = "version-group"
    }
}

struct NextAPI: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Result]
}

struct Result: Codable {
    let name: String
    let url: URL
}
