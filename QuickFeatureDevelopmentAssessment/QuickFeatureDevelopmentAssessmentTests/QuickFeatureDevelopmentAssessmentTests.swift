//
//  QuickFeatureDevelopmentAssessmentTests.swift
//  QuickFeatureDevelopmentAssessmentTests
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import XCTest
@testable import QuickFeatureDevelopmentAssessment

class QuickFeatureDevelopmentAssessmentTests: XCTestCase {

  var sut: FriendsViewModel!
  
    override func setUp() {
      super.setUp()
        sut = FriendsViewModel()
    }

    override func tearDown() {
        sut = nil
      super.tearDown()
    }

    func testNumberOfEpisodesBeforeGettingAnEpisode() {
      let expectedValue = 0
      XCTAssertEqual(expectedValue, sut.numberOfEpisodes())
    }
  
  func testNumberOfEpisodesAfterGettingData() {
    //let newEpisodeExpectation = expectation(description: "")
    let newEpisode = Episode(airDate: "2019", airStamp: "2018", name: "Kingsley", runtime: 9, summary: "Life's a Blur", image: Image(original: "Sly"))
    let newEpisodeContainer = EpisodeContainer(episode: [newEpisode])
    let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
    sut.getData (session: MockSession(data: newEpisodeContainerData)){
      XCTAssertEqual(self.sut.numberOfEpisodes(), 1)
      //newEpisodeExpectation.fulfill()
    }
    //waitForExpectations(timeout: 2, handler: nil)
  }
  
  func testGetNewEpisodeOfFriends() {
    sut.getTDDNewEpisode {
      XCTAssert(self.sut.episode(for: 0).name.contains("friend"))
    }
  }
  
  func testForEpisodeAtIndex() {
    let firstEpisode = Episode(airDate: "2019", airStamp: "2018", name: "Kingsley", runtime: 9, summary: "Life's a Blur", image: Image(original: "Sly"))
    let secondEpisode = Episode(airDate: "2014", airStamp: "2013", name: "Kingsly", runtime: 10, summary: "Life's been a Blur", image: Image(original: "Why"))
    let newEpisodeContainer = EpisodeContainer(episode: [firstEpisode, secondEpisode])
    let newEpisodeContainerData = try! JSONEncoder().encode(newEpisodeContainer)
    sut.getData (session: MockSession(data: newEpisodeContainerData)){
      XCTAssertEqual(self.sut.episode(for: 0), firstEpisode)
    }
  }
  
//  func testForEpisodeAtIndexWhenThereNoData() {
//    sut.
//  }
}

struct MockSession: Session {
  
  let data: Data?
  
//  init(with data: Data) {
//    self.data = data
//  }
  
  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
    completion?(data, nil)
  }

//  let mockData =
//    """
//{
//"property": "1"
//}
//""".data(using: .utf8)
}

