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

