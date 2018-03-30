//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

for i in 0..<4{
    print(i)
}

for j in 0...4 {
    print(j)
}

func greet(person : String,day : String) -> String{
    return "Hello \(person),today is \(day)"
}
greet(person: "王泽信", day: "星期六")

//返回元祖
func calculateStatics(scores : [Int]) -> (min : Int,max : Int,sum : Int){
    var min = scores[0];
    var max = scores[0];
    var sum = 0;
    for score in scores {
        if score > max {
            max = score;
        }else if score < min{
            min = score;
        }
        sum += score;
    }
    return (min,max,sum);
}

let statics = calculateStatics(scores: [5,12,3,25,6]);
print(statics.sum);
print(statics.2)


//函数可以带有可变个数的参数，这些参数在函数内表现为数组的形式
func sumOf(numbers : Int...) -> Int{
    var sum = 0;
    for number in numbers {
        sum += number;
    }
    return sum;
}
sumOf()
sumOf(numbers: 10,20,30)

//函数做函数参数
func hasAnyMatches(list : [Int],condition : (Int) -> Bool) -> Bool{
    for item in list {
        if condition(item) {
            return true;
        }
    }
    return false;
}

func lessThanTen(num : Int) -> Bool{
    return num < 10;
}

var numbers = [12,21,15,7];
hasAnyMatches(list: numbers, condition: lessThanTen);

//创建闭包函数
numbers.map({
    (number : Int) -> Int in
    let result = number*3;
    return result;
});

let mappedNumbers = numbers.map({number in number*3})
print(mappedNumbers)

//let sortedNumbers = numbers.sorted(by:{(num1 ,num2) in
//    return num1 > num2
//})
//let sortedNumbers = numbers.sorted()//默认升序
let sortedNumbers = numbers.sorted(){$0 > $1};//降序
print(sortedNumbers)

//创建类和对象
class NamedShape{
    var numberOfSides : Int = 0;
    var name : String;
    
    init(name : String){
        self.name = name;
    }
    func SimpleDescription() -> String{
        return "A shape with \(numberOfSides) sides"
    }
}

class Circle : NamedShape{
    var radius : Double;
    init(radius : Double,name : String) {
        self.radius = radius;
        super.init(name: name);
    }
    var perimeter : Double{
        get{
            return M_PI*radius*2;
        }
        set{
            radius = perimeter/M_PI/2;
        }
    }
    func area() -> Double{
        return M_PI*radius*radius;
    }
    override func SimpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

let testCircle = Circle.init(radius: 10, name: "圆形");
testCircle.area();
testCircle.SimpleDescription();
testCircle.perimeter = 100;
print(testCircle.radius);

