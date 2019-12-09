import UIKit

var testArray = [4, 5, 1, 1, 1, 1, 6, 8, 8, 8, 5, 4, 3]

func individualElements (array: [Int])-> [Int] {
  var answer: [Int] = []
  answer.append(array[0])
  for i in 1..<array.count {
    if !answer.contains(array[i]) {
      answer.append(array[i])
    }
  }
  return  answer
}

func getFrequencyOfOne( number: Int, array: [Int] ) -> Int {
  var frequency = 0
  for i in 0..<array.count {
    if number == array[i] {
      frequency += 1
    }
  }
  return frequency
}

func getAllFrequencies( array: [Int], originalArray: [Int] ) -> [Int] {
  var frequencies: [Int] = []
  for i in 0..<array.count {
    let frequency = getFrequencyOfOne(number: array[i], array: originalArray)
    frequencies.append(frequency)
  }
  return frequencies
}

func largestFrequency(array: [Int]) -> Int {
  var theLargestFrequency = 1
  for i in 0..<array.count {
    if array[i] > theLargestFrequency {
      theLargestFrequency = array[i]
    }
  }
  return theLargestFrequency
}

func sortElements(frequencies: [Int]) -> [Int] {
  var sortedFrequency = frequencies
  var temp = 0
  for i in 0..<sortedFrequency.count {
    if i+1 < sortedFrequency.count {
      if sortedFrequency[i] > sortedFrequency[i+1] {
        temp = sortedFrequency[i]
        sortedFrequency[i] = sortedFrequency[i+1]
        sortedFrequency[i+1] = temp
      }
    }
  }
  let check = checkSortFrequency(frequencies: sortedFrequency)
  if check {
    sortedFrequency = sortElements(frequencies: sortedFrequency)
  }
  return sortedFrequency
}

func checkSortFrequency(frequencies: [Int]) -> Bool {
  var check = false
  for i in 0..<frequencies.count {
    if i+1 < frequencies.count {
      if frequencies[i] > frequencies [i+1] {
        check = true
      }
    }
  }
  return check
}

func customSort(array: [Int]) -> [Int] {
  
  var customArray: [Int] = []
  let individualArray = individualElements(array: array)
  let frequecyOfElements = getAllFrequencies(array: individualArray, originalArray: array)
  let individualFrequency = individualElements(array: frequecyOfElements)
  let sortedFrequency = sortElements(frequencies: individualFrequency)
  //let sortIndividualArray = sortElements(frequencies: individualArray)
  let sortedArray = sortElements(frequencies: array)
  
  for i in 0..<sortedFrequency.count {
    for j in 0..<sortedArray.count {
      if getFrequencyOfOne(number: sortedArray[j], array: array) == sortedFrequency[i] {
        customArray.append(sortedArray[j])
      }
    }
  }
  
  return customArray
}
print(customSort(array: testArray))
print(testArray)
testArray.append(contentsOf: [8,4,5])
print(testArray)

