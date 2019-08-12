//
//  FilterSortClosureAssignment.swift
//  FilterClosureProject
//
//  Created by MAC on 7/30/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct FilterSortClosureAssignment {
    func sort(array: [Int], sortClosure: (Int, Int) -> Bool) -> [Int] {
        //TODO: Students fill out this function
        var result: [Int] = array
        var temp = 0
        
        guard !array.isEmpty else {return [] }
        
        for i in 0..<result.count-1{
            for j in i+1..<result.count{
                if sortClosure(result[j],result[i]){
                    temp = result[i]
                    result[i] = result[j]
                    result[j] = temp
                }
            }
        }
        return result
    }
  
  func filter(array: [Int], filterClosure: (Int) -> Bool) -> [Int] {
    //TODO: Students fill out this function
    var result: [Int] = []
    
    guard !array.isEmpty else {return [] }
    
    for element in array {
        if filterClosure(element){
            result.append(element)
        }
    }
    
    return result
  }
  
  func test() {
    //Students may run tests here to make sure that theit functions work as expected.
  }
}
