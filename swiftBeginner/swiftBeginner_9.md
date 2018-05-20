# 옵셔널 체이닝과 nil 병합 연산자

### 옵셔널 체이닝

- 옵셔널 체이닝은 옵셔널 요소 내부의 프로버티로 다시 옵셔널이 연속적으로 연결되는 경우에 유용하게 활용할 수 있다.

- 매번 **nil**을 확인하지 않고 최종적으로 원하는 값이 있는지 없는지 확인할 수 있다.

```swift
// 사람 클래스
class Person {
    var name: String
    var job: String?
    var home: Apartment?			//옵셔널 Apartment
    
    init(name: String) {
        self.name = name
    }
}
// 사람이 사는 집 클래스
class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var `guard`: Person?			//옵셔널 Person
    var owner: Person?				//옵셔널 Person
    
    init(dong: String, ho: String) {
        buildingNumber = dong
        roomNumber = ho
    }
}

let yagom: Person? = Person(name: "yagom")		//name 외엔 nil을 가지게됨
let apart: Apartment? = Apartment(dong: "101", ho: "202")
//buildingNumber과 roomNumber 외엔 nil을 가지게됨
let superman: Person? = Person(name: "superman")


// 옵셔널 체이닝이 실행 후 결과값이 nil일 수 있으므로 결과 타입도 옵셔널

// 만약 우리집 경비원의 직업이 궁금하다면..?

// 옵셔널 체이닝을 사용하지 않은 경우
func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let `guard` = home.guard {
                if let guardJob = `guard`.job {
                    print("우리집 경비원의 직업은 \(guardJob)입니다")
                } else {
                    print("우리집 경비원은 직업이 없어요")
                }
            }
        }
    }
}

guardJob(owner: yagom)

// 옵셔널 체이닝을 사용한다면
func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.guard?.job {			//옵셔널 체이닝
        print("우리집 경비원의 직업은 \(guardJob)입니다")
    } else {
        print("우리집 경비원은 직업이 없어요")
    }
}

guardJobWithOptionalChaining(owner: yagom)
// 우리집 경비원은 직업이 없어요


yagom?.home?.guard?.job // nil

yagom?.home = apart

yagom?.home // Optional(Apartment)
yagom?.home?.guard // nil

// 경비원 할당
yagom?.home?.guard = superman

yagom?.home?.guard // Optional(Person)

yagom?.home?.guard?.name // superman
yagom?.home?.guard?.job // nil

yagom?.home?.guard?.job = "경비원"
```



### nil 병합 연산자

- 중위 연산자 **??**
- Optional **??** Value
- 옵셔널 값이 **nil**일 경우, 우측의 값을 반환
- **띄어쓰기에 주의**

```swift
var guardJob: String
    
guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
//앞에 값이 nil이라면 "슈퍼맨"을 guardJob에 넣어달라
print(guardJob) // 경비원

yagom?.home?.guard?.job = nil

guardJob = yagom?.home?.guard?.job ?? "슈퍼맨"
print(guardJob) // 슈퍼맨
```





# 타입 캐스팅

### 스위프트의 타입 캐스팅

- **인스턴스의 타입을 확인**할 때 사용한다.  
- 클래스의 인스턴스를 **부모 혹은 자식 클래스의 타입으로 사용할 수 있는지 확인** 하는 용도
- **is**, **as**를 사용

** 형변환은 'ex. let someDouble = Double(2)'  타입 캐스팅이 아니라 새로운 값을 생성하는 것



### 예제 클래스

```swift
class Person {
    var name: String = ""
    func breath() {
        print("숨을 쉽니다")
    }
}

class Student: Person {
    var school: String = ""
    func goToSchool() {
        print("등교를 합니다")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    func goToMT() {
        print("멤버쉽 트레이닝을 갑니다 신남!")
    }
}

// 인스턴스 생성
var yagom: Person = Person()
var hana: Student = Student()
var jason: UniversityStudent = UniversityStudent()
```



### 타입확인

**is**를 사용하여 타입을 확인

```swift
var result: Bool

//yagom 인스턴스가 ㅇㅇ이냐라고 묻는것
//맞다면 true 아니라면 false
result = yagom is Person // true
result = yagom is Student // false
result = yagom is UniversityStudent // false

//Student는 Person을 상속받았기 때문에 Person의 특성을 모두 가지고 있음
result = hana is Person // true
result = hana is Student // true
result = hana is UniversityStudent // false

result = jason is Person // true
result = jason is Student // true
result = jason is UniversityStudent // true

if yagom is UniversityStudent {
    print("yagom은 대학생입니다")
} else if yagom is Student {
    print("yagom은 학생입니다")
} else if yagom is Person {
    print("yagom은 사람입니다")
} // yagom은 사람입니다

switch jason {
case is Person:
    print("jason은 사람입니다")
case is Student:
    print("jason은 학생입니다")
case is UniversityStudent:
    print("jason은 대학생입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 사람입니다

switch jason {
case is UniversityStudent:
    print("jason은 대학생입니다")
case is Student:
    print("jason은 학생입니다")
case is Person:
    print("jason은 사람입니다")
default:
    print("jason은 사람도, 학생도, 대학생도 아닙니다")
} // jason은 대학생입니다
```



### 업 캐스팅(Up Casting)

- **as**를 사용하여 **부모클래스의 인스턴스**로 사용할 수 있도록 컴파일러에게 타입정보를 전환해준다.
- **Any** 혹은 **AnyObject**로도 타입정보를 변환할 수 있다.
- 암시적으로 처리되므로 꼭 필요한 경우가 아니라면 생략해도 상관없다.

```swift
// UniversityStudent 인스턴스를 생성하여 Person 행세를 할 수 있도록 업 캐스팅
var mike: Person = UniversityStudent() as Person

var jenny: Student = Student()
//var jina: UniversityStudent = Person() as UniversityStudent // 컴파일 오류

// UniversityStudent 인스턴스를 생성하여 Any 행세를 할 수 있도록 업 캐스팅
var jina: Any = Person() as Any //as Any는 생략가능
```



### 다운 캐스팅(Down Casting)

`as?` 또는 `as!`를 사용하여 **자식 클래스의 인스턴스**로 사용할 수 있도록 컴파일러에게 인스턴스의 타입정보를 전환해준다.

**A. 조건부 다운 캐스팅**

- `as?`를 사용
- 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 `nil`을 반환하기 때문에 결과의 타입은 옵셔널 타입이다.

```swift
var optionalCasted: Student?

optionalCasted = mike as? UniversityStudent
optionalCasted = jenny as? UniversityStudent // nil
optionalCasted = jina as? UniversityStudent // nil
optionalCasted = jina as? Student // nil
```



**B. 강제 다운 캐스팅**

- `as!`를 사용합니다.
- 캐스팅하려는 타입에 부합하지 않는 인스턴스라면 **런타임 오류**가 발생
- 캐스팅에 성공하면 옵셔널이 아닌 일반 타입을 반환한다.

```swift
var forcedCasted: Student

optionalCasted = mike as! UniversityStudent
//optionalCasted = jenny as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! UniversityStudent // 런타임 오류
//optionalCasted = jina as! Student // 런타임 오류
```

