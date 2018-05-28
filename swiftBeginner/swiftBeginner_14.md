# 고차 함수

- **고차 함수(Higher-order function)**는 '다른 함수를 전달인자로 받거나 함수실행의 결과를 함수로 반환하는 함수'를 의미한다.
- 스위프트의 함수(클로저)는 일급시민(일급객체)이기 때문에 함수의 전달인자로 전달할 수 있고, 함수의 결과값으로 반환할 수 있다.



### map 함수

컨테이너 내부의 **기존 데이터를 변형(transform)해 새로운 컨테이너를 생성**

```swift
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

// for문을 사용하는 경우
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]

// map 메소드를 사용하는 경우

// numbers의 각 요소를 2배해 반환
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// numbers의 각 요소를 문자열로 변환해 반환
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers) // [0, 2, 4, 6, 8]
print(strings) // ["0", "1", "2", "3", "4"]
```



### filter 함수

컨테이너 내부의 **값을 걸러서 새로운 컨테이너로 추출**

```swift
var filtered: [Int] = [Int]()

// for문을 사용하는 경우
for number in numbers {
    if number % 2 == 0 {
        filtered.append(number)
    }
}

print(filtered) // [0, 2, 4]

// filter 메소드를 사용하는 경우
// numbers의 요소 중 짝수를 걸러내어 반환
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers) // [0, 2, 4]
```



### reduce 함수

컨테이너 내부의 **콘텐츠를 하나로 통합**

```swift
let someNumbers: [Int] = [2, 8, 15]
var result: Int = 0

// for문을 사용하는 경우
for number in someNumbers {
    result += number
}

print(result) // 25

// reduce 메소드를 사용하는 경우
// 초깃값이 0이고 someNumbers 내부의 모든 값을 더함
let sum: Int = someNumbers.reduce(0, { (first: Int, second: Int) -> Int in
    //print("\(first) + \(second)")
    //0+2, 2+8, 10+15
    return first + second
})

print(sum)  // 25

// 초깃값이 3이고 someNumbers 내부의 모든 값을 더함
let sumFromThree = someNumbers.reduce(3) { $0 + $1 }

print(sumFromThree) // 28
```

