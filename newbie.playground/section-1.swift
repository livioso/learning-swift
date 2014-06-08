// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground. Please don't crash."

var strLooped = ""
for each:Character in str {
    strLooped += each
}

var sumZeroToTen = 0;
for i in 0..10 {
    sumZeroToTen += i
}

sumZeroToTen = 0;

// equals to 0..10
for var i = 0; i < 10; i++ {
    sumZeroToTen += i
}

let max = 10
var counter = 0
while(max != counter) {
    counter++
}

func donkey (name:String) {
    println(name + " is a big donkey!")
}
donkey("Sepp Blatter")

func donkeys (names: String...) {
    
    println(String(names.count) + " donkeys in array names")
    
    for name in names {
        println(name + " is a big donkey!")
    }
}
donkeys("Sepp Blatter", "Tom Cruise")

// EXPERIMENT: The Swift Programming Language, p. 13
// > “Write a function that calculates the average of its arguments.”
func average (numbers: Float...) -> Float {
    var average:Float = 0
    for number in numbers {
        average += number
    }
    return average / Float(numbers.count)
}
average(5.5, 6, 4.5)

func add (lhs: Int, rhs: Int) -> Int {
    return rhs + lhs
}
add(1, 0)

enum ElematryCalculationType: Int {
    case addition, subtraction, multiplication, division
}

func getElematryCalc (type: ElematryCalculationType) -> ((Int, Int) -> Int) {
    switch type {
    case ElematryCalculationType.addition:
        return {(Int lhs, Int rhs) -> Int in return lhs + rhs}
    case ElematryCalculationType.subtraction:
        return {(Int lhs, Int rhs) -> Int in return lhs - rhs}
    case ElematryCalculationType.multiplication:
        return {(Int lhs, Int rhs) -> Int in return lhs * rhs}
    case ElematryCalculationType.division:
        return {(Int lhs, Int rhs) -> Int in return lhs / rhs}
    }
}

getElematryCalc(ElematryCalculationType.addition)(1, 2)
getElematryCalc(ElematryCalculationType.subtraction)(5, 2)
getElematryCalc(ElematryCalculationType.multiplication)(5, 3)
getElematryCalc(ElematryCalculationType.division)(15, 5)

var manyNumbers = [1, 2, 3]
// crashes XCode :-/
// manyNumbers.map({number + 2})
// sort([1,3,10,5,2,] {(lhs:Int, rhs:Int) -> Bool in return lhs > rhs})


// similar concept to Maybe in Haskell
enum CalculationResult {
    case Success(Int)
    case Error(String)
}

func getElematryCalcImproved
    (type: ElematryCalculationType) -> ((Int, Int) -> CalculationResult) {
    
    switch type {
    case ElematryCalculationType.addition:
        return {(Int lhs, Int rhs) -> CalculationResult in
            return CalculationResult.Success(lhs + rhs)}
    case ElematryCalculationType.subtraction:
        return {(Int lhs, Int rhs) -> CalculationResult in
            return CalculationResult.Success(lhs - rhs)}
    case ElematryCalculationType.multiplication:
        return {(Int lhs, Int rhs) -> CalculationResult in
            return CalculationResult.Success(lhs * rhs)}
    case ElematryCalculationType.division:
        return {(Int lhs, Int rhs) -> CalculationResult in
            if rhs == 0 {
                // division through 0 is not allowed
                return CalculationResult.Error("Error Division / 0")
            } else {
                return CalculationResult.Success(lhs / rhs)
            }
        }
    }
}

// returns a Int in case of success and a String in case of failure
let result = getElematryCalcImproved(ElematryCalculationType.division)(1, 0)
switch result {
case let .Success(result):
    println(result)
case let .Error(error):
    println(error)
}





