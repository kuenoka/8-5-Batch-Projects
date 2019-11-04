import UIKit

//var array: [[Int]] = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
//
//func rotateArray(array: [[Int]], numberOfRotations: Int) -> [[Int]] {
//
//    var rotateArray = array
//    var reRotateArray = array
//
//    if numberOfRotations == 1 {
//        for i in 0...array.count-1 {
//            for j in 0...array[i].count - 1 {
//
//                if i == 0 && (j == 0 || (j != 0 && j != array[i].count - 1)){
//                    rotateArray[i][j] = array[i][j+1]
//                } else if i == array.count - 1 && (j == array[i].count - 1 || (j != 0 && j != array[i].count - 1)){
//                    rotateArray[i][j] = array[i][j-1]
//                } else if (i == 0 || (i != 0 && i != array.count - 1)) && j == array[i].count - 1 {
//                    rotateArray[i][j] = array[i+1][j]
//                } else if (i == array.count - 1 || (i != 0 && i != array.count - 1)) && j == 0 {
//                    rotateArray[i][j] = array[i-1][j]
//                }
//            }
//        }
//    } else if numberOfRotations > 1 {
//
//        for k in 0...numberOfRotations - 1 {
//            for i in 0...reRotateArray.count-1 {
//                for j in 0...reRotateArray[i].count - 1 {
//
//                    if i == 0 && (j == 0 || (j != 0 && j != reRotateArray[i].count - 1)){
//                        rotateArray[i][j] = reRotateArray[i][j+1]
//                    } else if i == reRotateArray.count - 1 && (j == reRotateArray[i].count - 1 || (j != 0 && j != reRotateArray[i].count - 1)){
//                        rotateArray[i][j] = reRotateArray[i][j-1]
//                    } else if (i == 0 || (i != 0 && i != reRotateArray.count - 1)) && j == reRotateArray[i].count - 1 {
//                        rotateArray[i][j] = reRotateArray[i+1][j]
//                    } else if (i == reRotateArray.count - 1 || (i != 0 && i != reRotateArray.count - 1)) && j == 0 {
//                        rotateArray[i][j] = reRotateArray[i-1][j]
//                    }
//                }
//            }
//            reRotateArray = rotateArray
//        }
//    }
//    print(array[0])
//    print(array[1])
//    print(array[2])
//    print(array[3])
//
//    print(rotateArray[0])
//    print(rotateArray[1])
//    print(rotateArray[2])
//    print(rotateArray[3])
//    return rotateArray
//}
//
//rotateArray(array: array, numberOfRotations: 12)

var arrayTwo: [[Int]] = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12, 13, 14, 15], [16, 17, 18, 19, 20], [21, 22, 23, 24, 25]]
print(arrayTwo[0])
print(arrayTwo[1])
print(arrayTwo[2])
print(arrayTwo[3])
print(arrayTwo[4])
print("we made it")

func rotateArray ( array: [[Int]]) -> [[Int]] {
  
  var snake:[Int] = []
  let numberOfEdgeElements = (4 * array.count) - 4
  var myN = 0
  var myM = 0
  
  for i in 0...numberOfEdgeElements - 1 {
    
    snake.append(array[myN][myM])
    
    if myN != array.count - 1 && myM == 0 {
      myN += 1
    } else if myN == array.count - 1 && myM != array.count - 1 {
      myM += 1
    } else if myN != 0 && myM == array.count - 1 {
      myN -= 1
    } else if myN == 0 && myM != 0 {
      myM -= 1
    }
    
  }
  
  var newSnake: [Int] = []
  
  for i in 0...snake.count - 1 {
    
    if newSnake.isEmpty {
      newSnake.append(snake[snake.count - 1])
      newSnake.append(snake[i])
    } else if i != snake.count - 1 {
      newSnake.append(snake[i])
    }
    
  }
  
  myN = 0
  myM = 0
  
  var answer = array
  
  for i in 0...numberOfEdgeElements - 1 {
    
    answer[myN][myM] = newSnake[i]
    
    if myN != array.count - 1 && myM == 0 {
      myN += 1
    } else if myN == array.count - 1 && myM != array.count - 1 {
      myM += 1
    } else if myN != 0 && myM == array.count - 1 {
      myN -= 1
    } else if myN == 0 && myM != 0 {
      myM -= 1
    }
    
  }
  
  if ( (array.count - 2) > 1 ) {
    let usedArray = [Int](repeating: 0, count: answer.count - 2)
    var newInput = [[Int]](repeating: usedArray, count: answer.count - 2)
    
    for i in 1...answer.count - 2 {
      for j in 1...answer.count - 2 {
        newInput[i-1][j-1] = answer[i][j]
      }
    }
    let inside = rotateArray(array: newInput)
    
    for i in 1...answer.count - 2 {
      for j in 1...answer.count - 2 {
        answer[i][j] = inside[i-1][j-1]
      }
    }
  }
  
  return answer
}

let solution = rotateArray(array: arrayTwo)
print(solution[0])
print(solution[1])
print(solution[2])
print(solution[3])
print(solution[4])
