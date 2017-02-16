//: Playground - noun: a place where people can play

import UIKit
import ReactiveSwift
import Result
import ReactiveCocoa

var a = MutableProperty(0)
var b = MutableProperty(1)
var c = MutableProperty(2)

let combineProperty = b.combineLatest(with: c).flatMap(FlattenStrategy.latest){
    (param1, param2) in
    return MutableProperty(param1+param2)
}

a <~ combineProperty
print(a.value)  //3

b.value = 3
c.value = 5
print(a.value) //8





let (lettersSignal, lettersObserver) = Signal<String, NoError>.pipe()
let (numbersSignal, numbersObserver) = Signal<String, NoError>.pipe()
let (signal, observer) = Signal<Signal<String, NoError>, NoError>.pipe()

signal.flatten(.latest).observeValues { print($0) }

print("****************")

observer.send(value: lettersSignal) // nothing printed
numbersObserver.send(value: "1")    // nothing printed
lettersObserver.send(value: "a")    // prints "a"
lettersObserver.send(value: "b")    // prints "b"
numbersObserver.send(value: "2")    // nothing printed
observer.send(value: numbersSignal) // nothing printed
lettersObserver.send(value: "c")    // nothing printed
numbersObserver.send(value: "3")    // prints "3"

lettersObserver.send(value: "d")
numbersObserver.send(value: "4")


//按键的连续点击
let button = UIButton(frame: CGRect(x:0,y:0,width:100,height:20))
button.setTitle("click me", for: .normal)
button.setTitleColor(UIColor.black, for: .normal)
button.reactive.pressed


