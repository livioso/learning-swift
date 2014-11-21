// Playground - noun: a place where people can play

import Cocoa

var cf: Double = 962000;

var sum: Double = 0;

for i in 0..<8 {
    var year: Double = i;
    sum += (cf * pow(1.07, year));
}

println(sum);
