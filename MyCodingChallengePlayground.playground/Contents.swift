import UIKit

var array: [[Int]] = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]

func rotateArray(array: [[Int]]) -> [[Int]] {

    var rotateArray = array
    
    for i in 0...array.count-1 {
        for j in 0...array[i].count - 1 {
            
            if i == 0 && (j == 0 || (j != 0 && j != array[i].count - 1)){
                rotateArray[i][j] = array[i][j+1]
            } else if i == array.count - 1 && (j == array[i].count - 1 || (j != 0 && j != array[i].count - 1)){
                rotateArray[i][j] = array[i][j-1]
            } else if (i == 0 || (i != 0 && i != array.count - 1)) && j == array[i].count - 1 {
                rotateArray[i][j] = array[i+1][j]
            } else if (i == array.count - 1 || (i != 0 && i != array.count - 1)) && j == 0 {
                rotateArray[i][j] = array[i-1][j]
            }
        }
    }
    print(array[0])
    print(array[1])
    print(array[2])
    print(array[3])
    
    print(rotateArray[0])
    print(rotateArray[1])
    print(rotateArray[2])
    print(rotateArray[3])
    return rotateArray
}

rotateArray(array: array)
