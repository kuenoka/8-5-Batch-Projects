import UIKit

//class MyCoolClass: NSObject {
//    var name: String
//    var age: Int
//
//    init(name: String = "default string", age: Int = 0) {
//        self.name = name
//        self.age = age
//    }
//
//    func sayHello() {
//        print("Hello! My name is \(name) and I am \(age) years old.")
//    }
//
//    func introduce(to otherGuy: MyCoolClass){
//        print("Hello \(otherGuy.name)! My name is \(name)")
//    }
////    func sayHello(to otherGuy: MyCoolClass){
////        print("Hello \(otherGuy.name)! My name is \(name)")
////    }
//}
//
//class TheOtherClass: MyCoolClass {
//
//}
//
//let coolio = MyCoolClass(name: "Coolio", age: 75)
//coolio.sayHello()
//
//let me = MyCoolClass(name: "Me", age: 43)
//me.sayHello()
////me.sayHello(to: coolio)
//me.introduce(to: coolio)
//
//let other = TheOtherClass()
////other,sayHello()
//coolio.introduce(to: other)
//
//let otherCoolio = coolio
//otherCoolio.age = 5
//coolio.sayHello()
//otherCoolio.sayHello()
//
//struct MyCoolStruct{
//    var name: String
//    var age: Int
//
//    func sayHello() {
//        print("Hello! My name is \(name) and I am \(age) years old.")
//    }
//}
//
//var coolStruct = MyCoolStruct(name: "CoolStuff", age: .max)
//coolStruct.sayHello()
//
//let otherCoolStruct = coolStruct
//coolStruct.age = 60
//otherCoolStruct.sayHello()
//coolStruct.sayHello()
//
//enum TheEnum {
//    case first
//    case second
//}
//
//let theEnum = TheEnum.first
//
//switch theEnum {
//case.first:
//    break
//case.second:
//    print("this is second case")
//}
//
//let theString = "hello"
//
//switch theString {
//case"":
//    print("emptycase")
//case "hello":
//    print("hello case")
//case "hi":
//    print("hi case")
//
//default:
//    print(" No idea what you are talking about")
//}
//
////Optionals: Optionals are values thyat could be nil, or have no value
////Optionals are defined by a question mark after the type
//var optionalString: String? //= "hello"
//print(optionalString)
//
//func print(theString: String){
//    print(theString)
//}
////Ways to handle optionals
////1.Force unwrap
////Crashes the app if it is nil
////DONT Use this Ever
////print (theString: optionalString!)
//
////@. Nil Coalescing
////Give it a Default value if it is nil
//print(theString: optionalString ?? "no value")
//
////3. Conditional Binding
//if let unwrappedString = optionalString {
//    print(theString: unwrappedString)
//}
//
//for i in 0..<100{
//    guard i % 2 == 0 else { break}
//    print(i)
//
//    //if (i % 2 == 0){
//    //    print (i)
//    //}
//}
//
////Other variation is called guard let
//func print(optionalString: String?){
//    guard let unwrappedString = optionalString else{
//        print("it has no value!")
//        return
//    }
//    print(theString: unwrappedString)
//}
//
////4. Optional Chaining
//print(optionalString?.first?.asciiValue?.byteSwapped)
//
////5. Implicitly unwrapped optionals
//var someString: String!
//
//protocol Builder {
//    var wentToBuildingSchool: Bool { get}
//    func build()
//}
//
//protocol SuperBuilder: Builder {
//    func architect()
//}
//
//class Person {
//    var name: String
//    var age: Int
//
//    init(name: String){
//        age = 0
//        self.name = name
//    }
//}
//
//class Builderperson: Person, Builder {
//    var wentToBuildingSchool: Bool{
//        return true
//    }
//
//    func build (){
//        print("I am good at building things")
//    }
//}
//
//class GeniusBuilderPerson: Person { }
//extension GeniusBuilderPerson: Builder{
//    func build() {
//        print("I can build")
//    }
//
//    var wentToBuildingSchool: Bool {
//        return false
//    }
//}
//class BuilderPerson: Person { }
//extension BuilderPerson: Builder {
//    var wentToBuildingSchool: Bool {
//        return true
//    }
//    func build (){
//        print("I am good at building things")
//    }
//}
//
//extension String {
//    func getFirstCharacter() -> Character? {
//        return self.first
//    }
//}
//
//// Closures: Blocks of code that can be passed around like a variable
//let myClosure: (Int, Int) -> Bool = { firstInput, secondInput in
//let myClosure: (Int, Int) -> Bool = { firstInput,  _ in
//    return firstInput % 3 == 1
//    return firstInput > secondInput
////}
//
//let myClosure: (Int, Int) -> Bool
//    myClosure = { $0 < $1 }
//
//let myArray : [Int] = [ 1, 2,3,4]
////print(myArray.filter({$0 % 2==0}))
//print (myArray[0])
//
//func filterEvens(array: [Int], filterClosure: (Int) -> Bool) -> [Int] {
//    var arrayTest: [Int] = []
//
//    for element in array {
//        if filterClosure(element){
//            arrayTest.append(element)
//        }
//        print(element)
//        print(arrayTest)
//    }
//
//    return arrayTest
//}
//
//let closure: (Int) -> Bool = {$0 < 50}
//print(filterEvens(array: [1, 2, 5, 10, 20, 33, 67, 90, 101], filterClosure: closure)
//
//func printElements(array: [Int], doClosure: (Int) -> Void) {
//    for element in array {
//        doClosure(element)
//    }
//    for index in 0..<array.count {
//
//    }
//    for(index, element) in array.enumerated() {
//
//    }
//}
//
//let printClosure: (Int) -> Void = { print($0 / 2)}
//printElements(array: [5,10, 15, 20, 25, 30], doClosure: printClosure)
//
//func intToDouble <T> (array: [Int], mapClosure: (Int) -> T) -> [T] {
//    var anotherArray: [T] = []
//    for element in array {
//        anotherArray.append(mapClosure(element))
//    }
//    return anotherArray
//}
//
//print(intToDouble(array: [1, 2, 3], mapClosure: {String($0)}))
//
//
//func sort(array: [Int], sortClosure: (Int, Int) -> Bool) -> [Int] {
//    //TODO: Students fill out this function
//    var result: [Int] = array
//    var temp = 0
//
//    for i in 0..<result.count-1{
//        for j in i+1..<result.count{
//            if sortClosure(result[j],result[i]){
//                temp = result[i]
//                result[i] = result[j]
//                result[j] = temp
//            }
//        }
//    }
//    return result
//}
//let array = [4,2,6,1,5,3]
//print(sort(array: array) {$0 > $1})

//guard array.!isempty else { return ___}

//var switchOutput = "None"
//var sliderOutput = "None"
//var textFieldOutput = "None"
//var stepperOutput = "None"
//var segmentControlOutput = "None"
//
//var array = ["Switch" + ":" + switchOutput,
//                 "Slider" + ":" + sliderOutput,
//                 "TextField" + ":" + textFieldOutput,
//                 "Stepper" + ":" + stepperOutput,
//                 "SegmentControl" + ":" + segmentControlOutput]
//
//print (array)

var students = ["Mike": 3.0, "jacob": "Yo"] as [String : Any]
print(students)


struct Mytopple {
var name: String
var grade: Any
}

var array: [Mytopple] = []
for (name,gpa) in students {
    let mytopple = Mytopple(name: name, grade: gpa)
    //print(name,gpa)
    mytopple.name
    array.append(mytopple)
}
print(type(of: students))
