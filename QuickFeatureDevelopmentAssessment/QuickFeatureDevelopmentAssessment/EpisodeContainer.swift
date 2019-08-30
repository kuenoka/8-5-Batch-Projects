//
//  EpisodeContainer.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct EpisodeContainer: Codable {
  let episodes: [Episode]
  
  enum EpisodeCodingKeys: String, CodingKey {
    case episodes
  }
  
  enum TopLevelCodingKeys: String, CodingKey {
    case topLevel = "_embedded"
  }
  
  init(from decoder: Decoder) throws {
    let topContainer = try decoder.container(keyedBy: TopLevelCodingKeys.self)
    let subContainer = try topContainer.nestedContainer(keyedBy: EpisodeCodingKeys.self, forKey: .topLevel)
    self.episodes = try subContainer.decode([Episode].self, forKey: .episodes)
  }
}

struct Episode: Codable {
  let airDate: String
  let airStamp: String
  let name: String
  let runtime: Int
  let summary: String
  let image: Image
  
  enum CodingKeys: String, CodingKey {
    case airDate = "airdate"
    case airStamp = "airstamp"
    case name
    case runtime
    case summary
    case image
  }
}

struct Image: Codable {
    let original: String
}
