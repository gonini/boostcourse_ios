# 옵셔널

### 옵셔널이란 

- 값이 있을 수도, 없을 수도 있음을 표현
- nil이 할당 될 수 있는지 없는지 표현 

```swift
// someOptionalParm에 nil이 할당 될 수 있다.
func someFunction(someOptionalParam: Int?) { 
	// .... 
} 

/// someOptionalParm에 nil이 할당 될 수 없다.
func someFunction(someOptionalParam: Int) { 
	// .... 
} 

someFunction(someOptionalParam: nil)
// someFunction(someParam: nil)
//someFunction의 someOptionalParam는 옵셔널이 아니기 때문에 nil을 가질 수 없다.
```



###옵셔널을 쓰는 이유 

- 명시적 표현 
  1. nil의 가능성을 코드만으로 표현가능
  2. 문서/주석 작성 시간 절약
- 안전한 사용
  1. 전달받은 값이 옵셔널이 아니라면 nil 체크를 하지 않고 사용 가능
  2. 예외 상황을 최소화 하는 안전한 코딩
  3. 효율적 코딩 

###옵셔널 문법과 선언

- 옵셔널 문법 = enum + general
- 옵셔널 선언

```swift
 enum Optional<Wrapped>: ExpressibleByNiliteral {
         case none
         case some(Wrapped)
}

let optionalValue: Optional<Int> = nil
let optionalValue: Int? =nil
```



- 옵셔널 표현
  1. 느낌표(!)를 이용한 암시적 추출 옵셔널 

```swift
// Implicitly Unwrapped Optional
var implicitlyUnwrappedOptionalValue: Int! = 100

switch implicitlyUnwrappedOptionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용 가능
implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1

// nil 할당 가능
implicitlyUnwrappedOptionalValue = nil

// 잘못된 접근으로 인한 런타임 오류 발생 --> 위에서 nil값을 할당해줬는데 연산을 진행하려하기 때문에
//implicitlyUnwrappedOptionalValue = implicitlyUnwrappedOptionalValue + 1
```

​	2.  물음표(?)를 이용한 옵셔널 

```swift
 // Optional
var optionalValue: Int? = 100

switch optionalValue {
case .none:
    print("This Optional variable is nil")
case .some(let value):
    print("Value is \(value)")
}

// 기존 변수처럼 사용불가 - 옵셔널과 일반 값은 다른 타입이므로 연산불가
//optionalValue = optionalValue + 1

// nil 할당 가능
optionalValue = nil
```



### 옵셔널 추출이란

- 옵셔널에 들어있는 값을 사용하기 위해 꺼내오는 것 



###옵셔널 방식

- 옵셔널 바인딩 (optional Binding) 

1. nil체크+안전한추출
2. 옵셔널 안에 값이 들어있는지 확인하고 값이 있으면 값을 꺼내온다.
3. if-let 방식 사용 

```swift
func printName(_ name: String) {
    print(name)
}

var myName: String? = nil

// printName(myName)
// 전달되는 값의 타입이 다르기 때문에(String? != String) 컴파일 오류발생

if let name: String = myName {
    printName(name)
} else {
    print("myName == nil")
}

var yourName: String! = nil

if let name: String = yourName {
    printName(name)
} else {
    print("yourName == nil")
}

// name 상수는 if-let 구문 내에서만 사용 가능
// 상수 사용범위를 벗어났기 때문에 컴파일 오류 발생 
// printName(name)

//,를 사용해 한 번에 여러 옵셔널을 바인딩 할 수 있다.
// 모든 옵셔널에 값이 있을 때만 동작
myName = "yagom"
yourName = nil

if let name = myName, let friend = yourName {
  print("\(name) and \(friend)")
}

// yourName이 nil이기 때문에 실행되지 않는다.
yourName = "hana"
if let name = myName, let friend = yourName {
    print("\(name) and \(friend)")
}
// yagom and hana
```

- 강체추출(Force Unwrapping) : 옵셔널에 값이 들어있는지 아닌지 확인하지 않고 강제로 값을 꺼내는 방식, 만약 값이 없을경우(nil) 런타임 오류가 발생하기 때문에 추천되지 않는다.

```swift
var myName: String? = yagom
var youName: String! = nil

printName(myName!) // yagom --> myName에 있는 값을 강제로 추출한다.
myName = nil

//print(myName!)
// 강제추출시 값이 없으므로 런타임 오류 발생
yourName = nil

// printName(yourName)
// nil 값이 전달되기 때문에 런타임 오류발생 yourName은 !를 붙이지 않았지만 같은 의미
```


