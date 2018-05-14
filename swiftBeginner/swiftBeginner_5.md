# 구조체

### 구조체란

- 스위프트 대부분의 타입은 구조체로 이루어져 있다.
- 구조체는 **값(value) 타입** q
- 타입이름은 대문자 카멜케이스를 사용하여 정의한다.



### 구조체 문법

- **구조체 정의 :** "struct" 키워드 사용

```swift
struct 이름 {
	/* 구현부 */
}
```

- **구조체 프로퍼티 및 메서드 구현**

```swift
struct Sample {
    // 가변 프로퍼티(값 변경 가능)
    var mutableProperty: Int = 100 
    
    // 불변 프로퍼티(값 변경 불가능)
    let immutableProperty: Int = 100 
    
    // 타입 프로퍼티(static 키워드 사용 : 타입 자체가 사용하는 프로퍼티)
    static var typeProperty: Int = 100
    
    // 인스턴스 메서드(인스턴스가 사용하는 메서드)
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드(static 키워드 사용 : 타입 자체가 사용하는 메서드)
    static func typeMethod() {
        print("type method")
    }
}
```

- **구조체 사용**

```swift
// 가변 인스턴스 생성
var mutable: Sample = Sample()

mutable.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없다.
// 컴파일 오류 발생
// mutable.immutableProperty = 200

// 불변 인스턴스
let immutable: Sample = Sample()

// 불변 인스턴스는 아무리 가변 프로퍼티라도
// 인스턴스 생성 후에 수정할 수 없다.
// 컴파일 오류 발생
// immutable.mutableProperty = 200
// immutable.immutableProperty = 200


// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를
// 사용할 수 없다.
// 컴파일 오류 발생
// mutable.typeProperty = 400
// mutable.typeMethod()
```

- **구조체 예제**

```swift
struct Student {
	// 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용할 수 있다.
    var `class`: String = "Swift"
    
    // 타입 메서드
    static func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    // self는 인스턴스 자신을 지칭하며, 몇몇 경우를 제외하고 선택사항이다.
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다

// 가변 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다

// 불변 인스턴스 생성
let jina: Student = Student()

// 불변 인스턴스이므로 프로퍼티 값 변경 불가
// 컴파일 오류 발생
// jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 unknown입니다
```





# 클래스

### 클래스란?

- 클래스는 **참조(reference) 타입** (구조체와의 차이점)
- 타입이름은 대문자 카멜케이스를 사용하여 정의
- Swift의 클래스는 다중 상속이 되지 않는다.

 

### 클래스 문법

- **정의 :** **class** 키워드 사용

```swift
class 이름 {
	/* 구현부 */
}
```

- **프로퍼티 및 메서드 구현**

```swift
class Sample {
    // 가변 프로퍼티
    var mutableProperty: Int = 100 

    // 불변 프로퍼티
    let immutableProperty: Int = 100 
    
    // 타입 프로퍼티
    static var typeProperty: Int = 100 
    
    // 인스턴스 메서드
    func instanceMethod() {
        print("instance method")
    }
    
    // 타입 메서드
    // 상속시 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 상속시 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
}

```

- **클래스 사용**

```swift
// 인스턴스 생성 - 참조정보 수정 가능
var mutableReference: Sample = Sample()

mutableReference.mutableProperty = 200

// 불변 프로퍼티는 인스턴스 생성 후 수정할 수 없다
// 컴파일 오류 발생
// mutableReference.immutableProperty = 200


// 인스턴스 생성 - 참조정보 수정 불가
let immutableReference: Sample = Sample()

// 클래스의 인스턴스는 참조 타입이므로 let으로 선언되었더라도 인스턴스 프로퍼티의 값 변경이 가능
immutableReference.mutableProperty = 200

// 다만 참조정보를 변경할 수는 없다
// 컴파일 오류 발생
// immutableReference = mutableReference

// 참조 타입이라도 불변 인스턴스는 인스턴스 생성 후 수정할 수 없다.
// 컴파일 오류 발생
// immutableReference.immutableProperty = 200

// 타입 프로퍼티 및 메서드
Sample.typeProperty = 300
Sample.typeMethod() // type method

// 인스턴스에서는 타입 프로퍼티나 타입 메서드를 사용할 수 없다
// 컴파일 오류 발생
// mutableReference.typeProperty = 400
// mutableReference.typeMethod()
```

- **클래스 예제**

```swift
class Student {
	// 가변 프로퍼티
    var name: String = "unknown"

    // 키워드도 `로 묶어주면 이름으로 사용할 수 있다
    var `class`: String = "Swift"
    
    // 타입 메서드
    class func selfIntroduce() {
        print("학생타입입니다")
    }
    
    // 인스턴스 메서드
    func selfIntroduce() {
        print("저는 \(self.class)반 \(name)입니다")
    }
}

// 타입 메서드 사용
Student.selfIntroduce() // 학생타입입니다

// 인스턴스 생성
var yagom: Student = Student()
yagom.name = "yagom"
yagom.class = "스위프트"
yagom.selfIntroduce()   // 저는 스위프트반 yagom입니다

// 인스턴스 생성
let jina: Student = Student()
jina.name = "jina"
jina.selfIntroduce() // 저는 Swift반 jina입니다
```





# 열거형

- 유사한 종류의 여러 값을 한 곳에 모아서 정의한 것. 예) 요일, 월, 계절 등
- enum 자체가 하나의 데이터 타입으로, 대문자 카멜케이스를 사용하여 이름을 정의한다.
- 각 case는 소문자 카멜케이스로 정의
- 각 case는 그 자체가 고유의 값이다. (각 case에 자동으로 정수값이 할당되지 않음)
- 각 case는 한 줄에 개별로도, 한 줄에 여러개도 정의할 수 있다.

```swift
enum 이름 {
	case 이름1
	case 이름2
	case 이름3, 이름4, 이름5
	// ...
}

// 예제
enum BoostCamp {
        case iosCamp
        case androidCamp
        case webCamp
}
```



### 열거형 사용

- 타입이 명확할 경우, 열거형의 이름을 생략 할 수 있다.
- switch 구문에서 사용하면 좋다.

```swift
enum Weekday {
    case mon
    case tue
    case wed
    case thu, fri, sat, sun
}

// 열거형 타입과 케이스를 모두 사용해도 된다.
var day: Weekday = Weekday.mon

// 타입이 명확하면 .케이스 처럼 표현해도 된다.
day = .tue

print(day) // tue

// switch의 비교값에 열거형 타입이 위치할 때 모든 열거형 케이스를 포함한다면
// default를 작성할 필요가 없다
// 하지만 하나라도 빠져있다면 default는 작성해줘야함
switch day {
case .mon, .tue, .wed, .thu:
    print("평일입니다")
case Weekday.fri:
    print("불금 파티!!")
case .sat, .sun:
    print("신나는 주말!!")
}
```



### rawValue (원시값)

- C 언어의 enum 처럼 정수값을 가질 수 있다.
- rawValue는 case별로 각각 다른 값을 가져야한다.
- 자동으로 1이 증가된 값이 할당된다.
- rawValue를 반드시 지닐 필요가 없다면 굳이 만들지 않아도 된다.

```swift
enum Fruit: Int {
    case apple = 0
    case grape = 1
    case peach
    // peach에 원시값을 생략해줘도 자동으로 2가 들어감
    
    // mango와 apple의 원시값이 같아지기 때문에 
    // mango 케이스의 원시값을 0으로 정의할 수 없다
	// case mango = 0
}

print("Fruit.peach.rawValue == \(Fruit.peach.rawValue)")
// Fruit.peach.rawValue == 2
```



### 원시값을 통한 초기화

- rawValue를 통해 초기화 할 수 있다.
- rawValue가 case에 해당하지 않을 수 있어서, rawValue를 통해 초기화 한 인스턴스는 옵셔널 타입이다.

```swift
// rawValue를 통해 초기화한 열거형 값은 옵셔널 타입이므로 Fruit 타입이 아니다
// let apple: Fruit = Fruit(rawValue: 0)
let apple: Fruit? = Fruit(rawValue: 0)
// 0인 값이 없을 경우 nil을 반환할 수도 있기 때문

// if let 구문을 사용하면 rawValue에 해당하는 케이스를 곧바로 사용할 수 있다
if let orange: Fruit = Fruit(rawValue: 5) {
    print("rawValue 5에 해당하는 케이스는 \(orange)입니다")
} else {
    print("rawValue 5에 해당하는 케이스가 없습니다")
} // rawValue 5에 해당하는 케이스가 없습니다
```



### 메서드

Swift의 열거형에는 메서드도 추가할 수 있다.

```swift
enum Month {
    case dec, jan, feb
    case mar, apr, may
    case jun, jul, aug
    case sep, oct, nov
    
    func printMessage() {
        switch self {
        case .mar, .apr, .may:
            print("따스한 봄~")
        case .jun, .jul, .aug:
            print("여름 더워요~")
        case .sep, .oct, .nov:
            print("가을은 독서의 계절!")
        case .dec, .jan, .feb:
            print("추운 겨울입니다")
        }
    }
}

Month.mar.printMessage()
```





# 클래스 vs 구조체 / 열거형

#### class

- 전통적인 OOP 관점에서의 클래스
- 단일상속
- (인스턴스/타입) 메서드
- (인스턴스/타입) 프로퍼티
- 참조 타입
- Apple 프레임워크의 대부분의 큰 뼈대는 모두 클래스로 구성



#### Struct

- C 언어 등의 구조체보다 다양한 기능
- 상속 불가
- (인스턴스/타입) 메서드
- (인스턴스/타입) 프로퍼티
- 값 타입
- Swift의 대부분의 큰 뼈대는 모두 구조체로 구성



#### Enum

- 다른 언어의 열거형과는 많이 다른 존재

- 상속 불가

- (인스턴스/타입) 메서드

- (인스턴스/타입) 연산 프로퍼티

- 값 타입

- 유사한 종류의 여러 값을 유의미한 이름으로 한 곳에 모아 정의 할 수 있다.

  예) 요일, 상태, 월 등

- 열거형 자체가 하나의 데이터 타입

  열거형의 case 하나하나 전부 하나의 유의미한 값으로 취급



### 구조체를 사용하는 경우

- 연관된 몇몇의 값들을 모아 하나의 데이터타입으로 표현하고 싶을 때
- 다른 객체 또는 함수 등으로 전달될 때 참조가 아닌 **복사**를 하고 싶을 때
- 자신을 상속할 필요가 없거나, 자신이 다른 타입을 상속받을 필요가 없을 때
- Apple 프레임워크에서 프로그래밍을 할 때는 구조체보단 클래스를 많이 사용한다.
- 하지만 스위프트는 구조체, 열거형 사용을 선호한다.
- 뭘 사용하든 상관은 없음



### value

: 데이터를 전달할 때 값을 **복사**

### Reference

: 데이터를 전달할 때 값의 메모리 위치를 전달



```swift
struct ValueType {
    var property = 1
}

class ReferenceType {
    var property = 1
}

// 첫 번째 구조체 인스턴스
let firstStructInstance = ValueType()

// 두 번째 구조체 인스턴스에 첫 번째 인스턴스 값 복사
var secondStructInstance = firstStructInstance

// 두 번째 구조체 인스턴스 프로퍼티 값 수정
secondStructInstance.property = 2

// 두 번째 구조체 인스턴스는 첫 번째 구조체를 똑같이 복사한 
// 별도의 인스턴스이기 때문에 
// 두 번째 구조체 인스턴스의 프로퍼티 값을 변경해도
// 첫 번째 구조체 인스턴스의 프로퍼티 값에는 영향이 없음
print("first struct instance property : \(firstStructInstance.property)")    // 1
print("second struct instance property : \(secondStructInstance.property)")  // 2


// 클래스 인스턴스 생성 후 첫 번째 참조 생성
let firstClassReference = ReferenceType()
// 두 번째 참조 변수에 첫 번째 참조 할당
let secondClassReference = firstClassReference
secondClassReference.property = 2

// 두 번째 클래스 참조는 첫 번째 클래스 인스턴스를 참조하기 때문에
// 두 번째 참조를 통해 인스턴스의 프로퍼티 값을 변경하면
// 첫 번째 클래스 인스턴스의 프로퍼티 값을 변경하게 됨
print("first class reference property : \(firstClassReference.property)")    // 2
print("second class reference property : \(secondClassReference.property)")  // 2
```


