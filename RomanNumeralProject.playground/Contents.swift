import UIKit

func changeNumberToRomanNumeral(number: Int) -> String {

  var output = ""
  var tempOutput = ""
  let arrayOfRome = ["I", "V", "X", "L", "C", "D", "M"]
  var quotient = number
  var remainder = 0
  var romanIndex = 0

  while quotient != 0 {
    (quotient, remainder) = quotient.quotientAndRemainder(dividingBy: 10)
    if remainder == 10-1 {
      tempOutput += arrayOfRome[romanIndex+0]
      tempOutput += arrayOfRome[romanIndex+2]
    } else {
      if remainder >= 5 {
        remainder -= 5
        tempOutput += arrayOfRome[romanIndex+1]
      }
      if remainder == 5-1 {
        tempOutput += arrayOfRome[romanIndex+0]
        tempOutput += arrayOfRome[romanIndex+1]
      } else if remainder < 5 - 1 && remainder != 0{
        for _ in 0...remainder-1{
          tempOutput += arrayOfRome[romanIndex+0]
        }
      }
    }
    output = tempOutput + output
    tempOutput = ""
    romanIndex+=2
  }

  return output
}
let myString = changeNumberToRomanNumeral(number: 2019)
print(myString)

func changeRomanToNumber(roman: String) -> Int {
  var output = 0
  var temp = roman
  let arrayOfRome = ["I", "V", "X", "L", "C", "D", "M"]
  let arrayOfNumerals = [1, 5, 10, 50, 100, 500, 1000]
  var remove = 0

  if temp.count == 1 {
    for i in 0..<arrayOfRome.count {
      if String(Array(temp)[0]) == arrayOfRome[i] {
        output += arrayOfNumerals[i]
      }
    }
  } else if temp.count > 1 {
    var theCount = 3
    if String(Array(temp)[0]) == arrayOfRome[6] {
      output += arrayOfNumerals[6]
      remove+=1
      if temp.count < 3 {
        theCount = temp.count
      }
      var continueLoop = true
      for i in 1..<theCount{
        if String(Array(temp)[i]) == arrayOfRome[6] && continueLoop{
          output += arrayOfNumerals[6]
          remove+=1
        } else {
          continueLoop = false
        }
      }
      for i in 0..<remove{
        if let tempIndex = temp.firstIndex(of: Array(temp)[0]) {
          temp.remove(at: tempIndex)
        }
      }
      remove = 0
    }
    if temp.count == 1 {
      for i in 0..<arrayOfRome.count {
        if String(Array(temp)[0]) == arrayOfRome[i] {
          output += arrayOfNumerals[i]
          remove+=1
        }
      }
      if let tempIndex = temp.firstIndex(of: Array(temp)[0]) {
        temp.remove(at: tempIndex)
      }
    } else if temp.count > 1 {
      var myIndex = 0
      while temp.count != 0 {
        if temp.count == 1 {
          for i in 0..<arrayOfRome.count {
            if String(Array(temp)[0]) == arrayOfRome[i] {
              output += arrayOfNumerals[i]
            }
          }
          if let tempIndex = temp.firstIndex(of: Array(temp)[0]) {
            temp.remove(at: tempIndex)
          }
        } else if String(Array(temp)[0]) == arrayOfRome[5-myIndex] {
          theCount = 4
          if temp.count < 4 {
            theCount = temp.count
          }
          output += arrayOfNumerals[5-myIndex]
          remove+=1
          var continueLoop = true
          for i in 1..<theCount{
            if String(Array(temp)[i]) == arrayOfRome[4-myIndex] && continueLoop{
              output += arrayOfNumerals[4-myIndex]
              remove+=1
            } else {
              continueLoop = false
            }
          }
          for i in 0..<remove {
            if let tempIndex = temp.firstIndex(of: Array(temp)[0]) {
              temp.remove(at: tempIndex)
            }
          }
          remove = 0
        } else if String(Array(temp)[0]) == arrayOfRome[4-myIndex] {
          theCount = 3
          if temp.count < 3 {
            theCount = temp.count
          }
          if String(Array(temp)[1]) == arrayOfRome[5-myIndex] {
            output += arrayOfNumerals[5-myIndex] - arrayOfNumerals[4-myIndex]
            if let tempIndex = temp.firstIndex(of: Array(temp)[1]) {
              temp.remove(at: tempIndex)
            }
            if let tempIndex = temp.firstIndex(of: Array(temp)[0]) {
              temp.remove(at: tempIndex)
            }
          } else if String(Array(temp)[1]) == arrayOfRome[6-myIndex] {
            output += arrayOfNumerals[6-myIndex] - arrayOfNumerals[4-myIndex]
            if let tempIndex = temp.firstIndex(of: Array(temp)[1]) {
              temp.remove(at: tempIndex)
            }
            if let tempIndex = temp.firstIndex(of: Array(temp)[0]) {
              temp.remove(at: tempIndex)
            }
          } else {
            remove = 0
            theCount = 3
            if temp.count < 3 {
              theCount = temp.count
            }
            var continueLoop = true
            for i in 0..<theCount {
              if String(Array(temp)[i]) == arrayOfRome[4-myIndex] && continueLoop {
                output += arrayOfNumerals[4-myIndex]
                remove+=1
              } else {
                continueLoop = false
              }
            }
            for i in 0..<remove {
              if let tempIndex = temp.firstIndex(of: Array(temp)[0]) {
                temp.remove(at: tempIndex)
              }
            }
            remove = 0
          }
        }
        myIndex+=2
      }
    }
  }

  return output
}

print(changeRomanToNumber(roman: myString))
