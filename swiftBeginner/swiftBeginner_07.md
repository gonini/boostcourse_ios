# 프로퍼티

### 종류

- 인스턴스 저장 프로퍼티
- 타입 저장 프로퍼티
- 인스턴스 연산 프로퍼티
- 타입 연산 프로퍼티
- 지연 저장 프로퍼티



### 정의와 사용

- 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다.
- 다만 열거형 내부에는 연산 프로퍼티만 구현 가능하다.
- 연산 프로퍼티는 `var`로만 선언 가능하다.
- 연산 프로퍼티를 읽기 전용으로는 구현할 수 있지만, 쓰기 전용으로는 구현할 수 없다.
- 읽기전용으로 구현하려면 `get` 블럭만 작성해주면 된다. 읽기전용은 `get` 블럭을 생략 할 수 있다.
- 읽기, 쓰기 모두 가능하게 하려면 `get` 블럭과 `set`블럭을 모두 구현해주면 된다.
- `set` 블럭에서 암시적 매개변수 `newValue`를 사용할 수 있다.

```swift
struct Student {
    
    // 인스턴스 저장 프로퍼티
    var name: String = ""
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    // 인스턴스 연산 프로퍼티 : 특정 연산을 수행하는 프로퍼티
    var westernAge: Int {
        get {						//읽기
            return koreanAge - 1
        }
        
        set(inputValue) {			//쓰기
            koreanAge = inputValue + 1
        }
    }
    
    // 타입 저장 프로퍼티
    static var typeDescription: String = "학생"
    
    // 읽기전용 인스턴스 연산 프로퍼티
    // get{}는 생략할 수 있다
    var selfIntroduction: String {
        get {
            return "저는 \(self.class)반 \(name)입니다"
        }
    }
        
    /*
     // 타입 메서드
     static func selfIntroduce() {
     print("학생타입입니다")
     }
     */
    //아래와 같이 대체 가능하다.
    
    // 읽기전용 타입 연산 프로퍼티
    // 읽기전용에서는 get을 생략할 수 있다
    static var selfIntroduction: String {
        return "학생타입입니다"
    }
}

// 타입 연산 프로퍼티 사용
print(Student.selfIntroduction)
// 학생타입입니다

// 인스턴스 생성
var yagom: Student = Student()
yagom.koreanAge = 10

// 인스턴스 저장 프로퍼티 사용
yagom.name = "yagom"
print(yagom.name)
// yagom

// 인스턴스 연산 프로퍼티 사용
print(yagom.selfIntroduction)
// 저는 Swift반 yagom입니다

print("제 한국나이는 \(yagom.koreanAge)살이고, 미쿡나이는 \(yagom.westernAge)살입니다.")
// 제 한국나이는 10살이고, 미쿡나이는 9살입니다.
```

```swift
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {	//set에 매개변수를 써주지 않아도 암시적으로 newValue를 생성해준다
            dollar = newValue / currencyRate
        }
    }
}
```





# 프로퍼티 감시자

- 프로퍼티 감시자를 사용하면 **프로퍼티의 값이 변경**될 때 원하는 동작을 수행할 수 있다.
- 값이 변경되기 직전에 `willSet`블럭이, 값이 변경된 직후에  `didSet`블럭이 호출된다.
- 둘 중 필요한 하나만 구현해 주어도 무관
- 변경되려는 값이 **기존 값과 똑같더라도** 프로퍼티 감시자는 항상 동작한다.
- `willSet`블럭에서는 암시적 매개변수 **newValue**를, `didSet` 블럭에서는 **oldValue**를 사용할 수 있다.
- 프로퍼티 감시자는 연산 프로퍼티에는 사용할 수 없다.
- 프로퍼티 감시자는 함수, 메서드, 클로저, 타입 등의 지역/전역 변수에 모두 사용 가능

 

### 정의 및 사용

```swift
struct Money {
    // 프로퍼티 감시자 사용
    var currencyRate: Double = 1100 {
        willSet(newRate) {
            print("환율이 \(currencyRate)에서 \(newRate)으로 변경될 예정입니다")
        }
        
        didSet(oldRate) {
            print("환율이 \(oldRate)에서 \(currencyRate)으로 변경되었습니다")
        }
    }

    var dollar: Double = 0 {
        // willSet의 암시적 매개변수 이름 newValue
        willSet {
            print("\(dollar)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        // didSet의 암시적 매개변수 이름 oldValue
        didSet {
            print("\(oldValue)달러에서 \(dollar)달러로 변경되었습니다")
        }
    }

    // 연산 프로퍼티
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {
            dollar = newValue / currencyRate
        }
        
        /* 저장되는 값이 변경될 때 호출되는 것이기 때문에 
           프로퍼티 감시자와 연산 프로퍼티 기능을 동시에 사용할 수 없다
        willSet {}
         */
    }    
}

var moneyInMyPocket: Money = Money()

// 환율이 1100.0에서 1150.0으로 변경될 예정입니다
moneyInMyPocket.currencyRate = 1150
// 환율이 1100.0에서 1150.0으로 변경되었습니다

// 0.0달러에서 10.0달러로 변경될 예정입니다
moneyInMyPocket.dollar = 10
// 0.0달러에서 10.0달러로 변경되었습니다

print(moneyInMyPocket.won)
// 11500.0
```

