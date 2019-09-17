//
//  ProblemSolver.swift
//  TestProject
//
//  Created by MAC on 6/4/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

class ProblemSolver {
  var input = ["4",
               "12    5",
               "3    6",
               "17    13",
               "8    6"] {
    didSet {
      currentLine = 0
    }
  }
  
  var currentLine = 0
  
  func solveAllProblems() {
    solveFirstProblem()
    input = ["0    China",
             "1    Cuba",
             "2    -1",
             "3    Cuba",
             "4    -1",
             "5    -1",
             "6    Cuba",
             "7    Germany",
             "8    Germany",
             "9    China"]
    solveSecondProblem()
    input = ["3",
             "abc",
             "abd",
             "ab"]
    solveThirdProblem()
  }
  
  func readLine() -> String? {
    if currentLine < input.endIndex {
      let inputLine = input[currentLine]
      currentLine += 1
      return inputLine
    } else {
      return nil
    }
  }
  /*
   General Notes: This coding challenge is a coding challenge from a REAL interview coding challenge. That challenge uses similar techniques that are used in HackerRank challenges. It has been replicated here as best as we can.
   
   Note that you can directly access the input. However, you should use the readLine() function instead. This will read each line of the input, if there is one left. If there is no next line, it will return nil.
   
   All output should be printed onto the console, using the print function.
   
   Any implementation that accesses the inputs directly will be counted incorrect, even if the solution is correct.
   */
  
  /*
   First Problem:
   The first line of the input will tell you how many lines of input there are following the first line.
   
   Each subsequent line of input will consist of a pair of numbers, separated by space.
   
   Your goal is to find the least common multiple(LCM), and what you have to multiply each of the numbers in the pair to get that multiple.
   
   Input:
   4
   12    5
   3    6
   17    13
   8    6
   
   Output:
   12  5  60  5  12
   3  6  6  2  1
   17  13  221  13  17
   8  6  24  3  4
   */
  func solveFirstProblem() {
    
    var answer: [String] = []
    
    readLine()
    
    for i in 1...4 {
      let myInput = readLine()
      let array = changeFromStringToNumber(string: myInput ?? "")
      let largerNumber = whichIsGreater(first: array[0], second: array[1])
      let myLCM = findTheLCM(numbers: array, largestNum: largerNumber)
      answer.append(formatAnswer(newArray: array, LCM: myLCM))
    }
    
    print(answer[0])
    print(answer[1])
    print(answer[2])
    print(answer[3])
  }
  
  func formatAnswer(newArray: [Int], LCM: Int) -> String {
    
    let myString = "\(newArray[0]) \(newArray[1]) \(LCM) \(LCM/newArray[0]) \(LCM/newArray[1])"
    
    return myString
  }
  
  func findTheLCM(numbers: [Int], largestNum: Int) -> Int {
    
    var lowestCommonMultiple = 1
    var newArray = numbers
    var multiple = 1
    
    for i in 1...largestNum {
      if (newArray[1] % i) == 0 && (newArray[0] % i) == 0 {
        newArray[0] = newArray[0] / i
        newArray[1] = newArray[1] / i
        multiple *= i
      }
    }
    
    lowestCommonMultiple = newArray[0] * newArray[1] * multiple
    
    return lowestCommonMultiple
  }
  
  func whichIsGreater (first: Int, second: Int) -> Int {
    var greater = first
    
    if first < second {
      greater = second
    }
    
    return greater
  }
  
  func changeFromStringToNumber(string: String) -> [Int] {
    
    var array: [Int] = []
    
    var firstString = ""
    var secondString = ""
    var firstValue = 0
    var secondValue = 0
    var firstSpace = 0
    var lastSpace = 0
    
    for i in 0...string.count - 1 {
      
      if firstSpace == 0 {
        firstString.append(Array(string)[i])
      }
      
      if lastSpace != 0 {
        secondString.append(Array(string)[i])
      }
      
      if (i + 1) < string.count {
        if Array(string)[i] != " " && Array(string)[i + 1] == " " {
          firstSpace = i + 1
        }
      }
      
      if (i + 1) < string.count {
        if Array(string)[i] == " " && Array(string)[i + 1] != " " {
          lastSpace = i
        }
      }
    }
    
    firstValue = Int(firstString) ?? 0
    secondValue = Int(secondString) ?? 0
    array.append(firstValue)
    array.append(secondValue)
    
    return array
  }
  
  /*
   Second Problem
   
   The input will consist of a number of lines that will have pairs of numbers and values. The values will either be the name of a country, or -1
   
   Your goal is to count the number of times each country appears in the list.
   
   Input:
   0    China
   1    Cuba
   2    -1
   3    Cuba
   4    -1
   5    -1
   6    Cuba
   7    Germany
   8    Germany
   9    China
   
   Output:
   China,2
   Cuba,3
   Germany,2
   */
  func solveSecondProblem() {
    
    var arrayWithFrequencies: [String] = []
    var arrayNames:[String] = []
    
    for i in 0...9 {
      let myInput = readLine()
      let myName = getNameOfCountry(input: myInput ?? "")
      arrayNames.append(myName)
    }
    let uniqueNames = getUniqueNames(array: arrayNames)
    let uniqueFrequencies = getFrequencyOfUniqueNmaes(uniqueArray: uniqueNames, regularArray: arrayNames)
    arrayWithFrequencies = formatSecondAnser(arrayOfNames: uniqueNames, frequencyOfNames: uniqueFrequencies)
    print(arrayWithFrequencies[0])
    print(arrayWithFrequencies[1])
    print(arrayWithFrequencies[2])
    
  }
  
  func formatSecondAnser(arrayOfNames: [String], frequencyOfNames: [Int]) -> [String] {
    
    var myString: [String] = []
    
    for i in 0...arrayOfNames.count - 1 {
      myString.append("\(arrayOfNames[i]), \(frequencyOfNames[i])")
    }
    
    return myString
  }
  
  func getFrequencyOfUniqueNmaes ( uniqueArray: [String], regularArray: [String]) -> [Int] {
    
    var array: [Int] = []
    var frequency = 0
    
    for uniqueElements in uniqueArray {
      for regularElements in regularArray {
        if regularElements == uniqueElements {
          frequency += 1
        }
      }
      array.append(frequency)
      frequency = 0
    }
    
    return array
  }
  
  func getUniqueNames (array: [String]) -> [String] {
    
    var answer:[String] = []
    
    for elements in array {
      if !answer.contains(elements) && elements != "" {
        answer.append(elements)
      }
    }
    
    return answer
  }
  
  func getNameOfCountry( input: String) -> String {
    
    var name = ""
    var spaceBeforeFirstLetter = 0
    
    for i in 1...input.count - 1 {
      
      if spaceBeforeFirstLetter != 0 {
        name.append(Array(input)[i])
      }
      
      if (i + 1) < input.count {
        if Array(input)[i] == " " && Array(input)[i+1] != " " && Array(input)[i+1] != "-" && Array(input)[i+1] != "1" {
          spaceBeforeFirstLetter = i
        }
      }
      
    }
    
    return name
  }
  
  /*
   Third Problem:
   
   The first line of input will be how many lines of inputs you are to consider. The subsequent lines of inputs consist of a single string per line.
   
   Your goal is to find the number of common characters from the beginning. For example, abc and abcd would print out 3, since they both start with abc, which is 3 characters. acd and abc would print out 1. Even though it has 2 characters in common, there is only one common character starting from the beginning, a.
   
   Input:
   abc
   abd
   ab
   
   Output:
   2
   */
  func solveThirdProblem() {
    
    readLine()
    let myFirstInput = readLine()
    let mySecondInput = readLine()
    let myThirdInput = readLine()
    let answer = findNumberOfSimilarCharactersInARow(firstInput: myFirstInput ?? "",
                                                     secondInput: mySecondInput ?? "",
                                                     thirdInput: myThirdInput ?? "")
    print(answer)
    
  }
}

func findNumberOfSimilarCharactersInARow(firstInput: String, secondInput: String, thirdInput: String) -> Int {
  
  var comparingInput = ""
  var number = 0
  var myCount = firstInput.count
  
  if secondInput.count < firstInput.count {
    myCount = secondInput.count
  }
  
  for i in 0...myCount - 1 {
    if Array(firstInput)[i] == Array(secondInput)[i] {
      comparingInput.append(Array(firstInput)[i])
    }
  }
  
  myCount = comparingInput.count
  
  if thirdInput.count < comparingInput.count {
    myCount = thirdInput.count
  }
  
  for i in 0...myCount - 1 {
    if Array(comparingInput)[i] == Array(thirdInput)[i] {
      number += 1
    }
  }
  
  return number
}
