//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "dd.MM.yyyy"
let result = formatter.string(from: date)
print(result)



