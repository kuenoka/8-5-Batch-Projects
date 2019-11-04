//
//  Abercrombie_CodeTestTests.swift
//  Abercrombie_CodeTestTests
//
//  Created by MCS on 9/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import XCTest
@testable import Abercrombie_CodeTest

class Abercrombie_CodeTestTests: XCTestCase {
  
  var sut: ViewModel!
  
  override func setUp() {
    super.setUp()
    sut = ViewModel()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testNumberOfCardsBeforeGettingData() {
    let expectedValue = 0
    XCTAssertEqual(sut.numberOfCards(), expectedValue)
  }
  
  func testNumberOfCardsAfterGettingData() {
    let newPromotionCard = PromotionCard(title: "Best Card", backgroundImage: "", promoMessage: "Gucci Gang", content: [Content(target: "Men", title: "Women")], topDescription: "Hello World", bottomDescription: "Life is a Blur")
    let newPromotionCardArray = [newPromotionCard]
    let newPromotionCardData = try! JSONEncoder().encode(newPromotionCardArray)
    sut.getData (session: MockSession(data: newPromotionCardData)) {
      XCTAssertEqual(self.sut.numberOfCards(), 1)
    }
  }
  
  func testForCardAt() {
    let firstPromotionCard = PromotionCard(title: "Best Card", backgroundImage: "", promoMessage: "Gucci Gang", content: [Content(target: "Men", title: "Women")], topDescription: "Hello Earth", bottomDescription: "Life is a Blur")
    let secondPromotionCard = PromotionCard(title: "Happy", backgroundImage: "", promoMessage: "LV Gang", content: [Content(target: "Shop", title: "")], topDescription: "Hello Mars", bottomDescription: "Nirvana")
    let newPromotionCardArray = [firstPromotionCard, secondPromotionCard]
    let newPromotionData = try! JSONEncoder().encode(newPromotionCardArray)
    sut.getData(session: MockSession(data: newPromotionData)) {
      XCTAssertEqual(self.sut.card(at: 1), secondPromotionCard)
    }
  }
  
}

struct MockSession: Session {
  
  let data: Data?
  
  func getData(from url: URL, completion: ((Data?, Error?) -> Void)?) {
    completion?(data, nil)
  }
}

