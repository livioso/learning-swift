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

protocol AbsoluteValue {
    func abs() -> Double
}

// extend Double with an abs method
extension Double: AbsoluteValue {
    func abs() -> Double{
        var absValue = self
        
        if(absValue < 0) {
            absValue = -absValue
        }
        
        return absValue
    }
}

(+7.1).abs()
(-7.1).abs()

let protocolValue: AbsoluteValue = -11.0
protocolValue.abs()

// ...are you serious? This works?! WTF?! :)
typealias 💩 = String
var 💣:💩 = "😃🔫"
println(💣)

// in oder to use == we need to say that it must be Equatable
// return type is T? that's about the same as Maybe in Haskell (?)
func findFirst <T where T: Equatable> (inContainer: T[], whatToFind: T) -> T? {
    
    for i in 0..inContainer.count {
        if whatToFind == inContainer[i] {
            return inContainer[i]
        }
    }
    
    return nil
}

var resultSome = findFirst([0,2,3,5,7], 3)  // -> Some 3
var resultNil = findFirst([0,2,3,4,5], 10) // -> nil

if resultSome {
    // Can't unwrap Optional.None with resultNil!
    // But unwrap if there is a value to unwrap
    var integerValue: Integer = resultSome!
}

// further improvement of the cacluation function above
func getElematryCalcImproved2
    (type: ElematryCalculationType) -> ((Int, Int) -> Int?) {
        
        switch type {
        case ElematryCalculationType.addition:
            return {(Int lhs, Int rhs) -> Int in return lhs + rhs}
        case ElematryCalculationType.subtraction:
            return {(Int lhs, Int rhs) -> Int in lhs - rhs}
        case ElematryCalculationType.multiplication:
            return {(Int lhs, Int rhs) -> Int in return lhs * rhs}
        case ElematryCalculationType.division:
            return {(Int lhs, Int rhs) -> Int? in
                if rhs == 0 {
                    return nil // division through 0 is not allowed
                } else {
                    return (lhs / rhs)
                }
            }
        }
}

getElematryCalcImproved2(ElematryCalculationType.division)(2, 0)

func vector (pointOne: (x: Int, y: Int), pointTwo: (x: Int, y: Int)) -> (Int, Int) {
    return (-pointOne.x + pointTwo.x, -pointOne.y + pointTwo.y)
}

vector((2, 0), (3, 0)) // (1, 0)

let age = 10
assert(age >= 0, "Age can't be below 0") // otherwise "assertion failed"

func plus (lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}

println(plus.self) // (Function)
println(plus.dynamicType) // (MetaType)

// Collections. Array
var shoppinglist = ["Milk", "Eggs"]
shoppinglist.append("Juice")
shoppinglist += "Cake"
shoppinglist.insert("Cheese", atIndex: 0)
shoppinglist.removeAtIndex(0)
shoppinglist.removeLast()
println(shoppinglist[0..2]) // same as println(shoppinglist[0...1]

// iterate over it
for (index, value) in enumerate(shoppinglist) {
    println("\(index) - \(value)")
}

// Collections. Dictionaries
var shoppingDict: Dictionary<String, Int> = [
    "Apple": 2,
    "Banana": 3,
    "Milk": 1
]

// got the milk
shoppingDict["Milk"] // Some 1
shoppingDict["Milk"] = nil
shoppingDict["Milk"] // nil
shoppingDict["Whatever"] // nil
shoppingDict.count // =2

var xyz = 1
switch xyz {
case _: // wildcard
    println("whatever")
}

func hitEvalutation (withHitPosition position: (Double, Double)) -> String {
    
    let directHit = (x: 0.0, y: 0.0)
    
    switch position {
    case (directHit.x...directHit.x + 0.1, directHit.y...directHit.y + 0.1):
        return "direct hit"
    case let (x, y) where x <= directHit.x + 0.2 && y <= directHit.y + 0.2:
        return "bounce"
    case (_, _):
        return "miss"
    }
}

// using an external name for the parameter
hitEvalutation(withHitPosition: (2.0, 2.2)) // miss
hitEvalutation(withHitPosition: (0.0, 0.02)) // direct hit
hitEvalutation(withHitPosition: (0.12, 0.0)) // bounce

// # forces user to specify the name of the parameter in 
// the actual call: this improves readability
func contains (#char: Character, #inString: String) -> Bool {
    
    for each in inString {
        if each == char {
            return true
        }
    }
    
    return false
}

contains(char: "a", inString: "abc")
// still this doesn't work: contains(inString: "abc", char: "a")

// call by reference. so called inout parameter
func roundDownToTens (inout #number: Int) {
    number -= number % 10
}

var numberToBeRounded = 15
roundDownToTens(number: &numberToBeRounded)

func noparamnoreturntype () -> () { }

var names = ["Livio","Sepp", "Kevin"]
sort(names, >)
sort(names, <)

func mathFunctionBinder(functor: (Int, Int) -> Int, lhs: Int, rhs: Int) -> Int{
    return functor(lhs, rhs)
}

mathFunctionBinder(*, 3, 3)
mathFunctionBinder(+, 3, 3)
mathFunctionBinder(-, 3, 3)

// kinda like a disjoint data type
enum Barcode {
    case UPCA(Int, Int, Int)
    case QR(String)
}

struct SomeStruct {
}

class SomeClass {
}

var a = SomeClass()
var b = SomeClass()

if a !== b {
    println("not yet identical")
}

a = b
if a === b {
    println("now identical")
}

struct Marks {
    var marks: Double[] = []
    
    // computed property 
    // when ever the value is 
    // requested the average is cacluated
    var average: Double {
    get {
        var sum: Double = 0.0
        for each in marks {
            sum += each
        }
        return sum / Double(marks.count)
    }
    }
}




