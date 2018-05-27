# 상속

### 스위프트의 상속

- 상속은 클래스, 프로토콜 등에서 가능
- 열거형, 구조체는 상속 불가능
- 스위프트의 클래스는 다중상속을 지원하지 않는다.

```swift
class 이름: 상속받을 클래스 이름 {
    /* 구현부 */
}
```



### 사용

- **final** 키워드를 사용하면 재정의(**override**)를 방지할 수 있다.
- **static** 키워드를 사용해 타입 메서드를 만들면 재정의가 불가능하다.
- **class** 키워드를 사용해 타입 메서드를 만들면 재정의가 가능하다.
- **class** 앞에 **final**을 붙이면 **static** 키워드를 사용한것과 동일하게 동작한다.
- **override** 키워드를 사용해 부모 클래스의 메서드를 재정의 할 수 있다.

```swift
// 기반 클래스 Person
class Person {
    var name: String = ""
    
    func selfIntroduce() {
        print("저는 \(name)입니다")
    }
    
    // final 키워드를 사용하여 재정의를 방지할 수 있습니다
    final func sayHello() {
        print("hello")
    }
    
    // 타입 메서드
    // 재정의 불가 타입 메서드 - static
    static func typeMethod() {
        print("type method - static")
    }
    
    // 재정의 가능 타입 메서드 - class
    class func classMethod() {
        print("type method - class")
    }
    
    // 재정의 가능한 class 메서드라도 
    // final 키워드를 사용하면 재정의 할 수 없습니다
    // 메서드 앞의 `static`과 `final class`는 똑같은 역할을 합니다
    final class func finalCalssMethod() {
        print("type method - final class")
    }
}

// Person을 상속받는 Student
class Student: Person {
    var major: String = ""
    
    override func selfIntroduce() {
        print("저는 \(name)이고, 전공은 \(major)입니다")
    }
    
    override class func classMethod() {
        print("overriden type method - class")
    }
    
    // static을 사용한 타입 메서드는 재정의 불가능
//    override static func typeMethod() {    }
    
    // final 키워드를 사용한 메서드, 프로퍼티는 재정의 불가능
//    override func sayHello() {    }
//    override class func finalClassMethod() {    }

}
```



# 인스턴스의 생성과 소멸

인스턴스를 생성하는 **이니셜라이저**(init)와 클래스의 인스턴스가 소멸될 때 호출되는 **디이니셜라이저**(deinit)



### 프로퍼티 초기값

- 스위프트의 모든 인스턴스는 초기화와 동시에 **모든 프로퍼티**에 유효한 값이 할당되어 있어야 한다.
- 프로퍼티에 미리 기본값을 할당해두면 인스턴스가 생성됨과 동시에 초기값을 지니게 된다. 

```swift
class PersonA {
    // 모든 저장 프로퍼티에 기본값 할당
    var name: String = "unknown"
    var age: Int = 0
    var nickName: String = "nick"
}

// 인스턴스 생성
let jason: PersonA = PersonA()

// 기본값이 인스턴스가 지녀야 할 값과 다르다면
// 생성된 인스턴스의 프로퍼티에 각각 값을 할당해줘야한다.
jason.name = "jason"
jason.age = 30
jason.nickName = "j"
```



### 이니셜라이저(initializer)

- 프로퍼티 초기값을 지정하기 어려운 경우에는 이니셜라이저 **init**을 통해 인스턴스가 가져야 할 초기값을 전달할 수 있다.

```swift
class PersonB {
    var name: String
    var age: Int
    var nickName: String
    
    // 이니셜라이저
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }
}

let hana: PersonB = PersonB(name: "hana", age: 20, nickName: "하나")
```

***프로퍼티의 초기값이 꼭 필요 없을 때***

- **옵셔널**을 사용
- **class** 내부의 **init**을 사용할때는 **convenience** 키워드 사용

```swift
class PersonC {
    var name: String
    var age: Int
    var nickName: String?
    
    init(name: String, age: Int, nickName: String) {
        self.name = name
        self.age = age
        self.nickName = nickName
    }

// 위와 동일한 기능 수행
// convenience init(name: String, age: Int, nickName: String) {
//       init(name: name, age: age)
//       self.nickName = nickName
//  }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let jenny: PersonC = PersonC(name: "jenny", age: 10)
let mike: PersonC = PersonC(name: "mike", age: 15, nickName: "m")
```

- 암시적 추출 옵셔널(!)은 인스턴스 사용에 꼭 필요하지만 초기값을 할당하지 않고자 할 때 사용

```swift
class Puppy {
    var name: String
    var owner: PersonC!
    
    init(name: String) {		//name만 초기화해주고 owner를 나중에 초기화 해주겠다.
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

let happy: Puppy = Puppy(name: "happy")
//happy.goOut() // 주인이 없는 상태라 오류 발생
happy.owner = jenny
happy.goOut()
// happy가 주인 jenny와 산책을 합니다
```



### 실패가능한 이니셜라이저

- 이니셜라이저 매개변수로 전달되는 초기값이 잘못된 경우 인스턴스 생성에 실패할 수 있다.
- 인스턴스 생성에 실패하면 **nil**을 반환
- 실패가능한 이니셜라이저의 반환타입은 옵셔널 타입이다.
- **init?**을 사용합니다.

```swift
class PersonD {
    var name: String
    var age: Int
    var nickName: String?
    
    init?(name: String, age: Int) {		//반환되는 값이 nil일 수 있기 때문에 ?(옵셔널)을 사용한다.
        if (0...120).contains(age) == false {
            return nil
        }
        
        if name.characters.count == 0 {
            return nil
        }
        
        self.name = name
        self.age = age
    }
}

//let john: PersonD = PersonD(name: "john", age: 23)
//PersonD가 nil이 반환될 수 있는데 옵셔널이 아닌 타입으로 받니?하고 오류
let john: PersonD? = PersonD(name: "john", age: 23)
let joker: PersonD? = PersonD(name: "joker", age: 123)	//nil
let batman: PersonD? = PersonD(name: "", age: 10)		//nil

print(joker) // nil
print(batman) // nil
```



### 디이니셜라이저(deinitializer)

- **deinit**은 클래스의 인스턴스가 메모리에서 해제되는 시점에 호출된다.
- 인스턴스가 해제되는 시점에 해야할 일을 구현할 수 있다.
- **deinit**은 매개변수를 지닐 수 없다.
- 자동으로 호출되기 때문에 우리가 직접 호출할 수는 없다.
- 디이니셜라이저는 **클래스 타입에만** 구현할 수 있다.
- 인스턴스가 메모리에서 해제되는 시점은 **ARC(Automatic Reference Counting)** 의 규칙에 따라 결정된다.
  - ARC : Objective-C에서 제공하는 자동 메모리 관리기능

```swift
class PersonE {
    var name: String
    var pet: Puppy?
    var child: PersonC
    
    init(name: String, child: PersonC) {
        self.name = name
        self.child = child
    }
    
    // 인스턴스가 메모리에서 해제되는 시점에 자동 호출
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)를 인도합니다")
            self.pet?.owner = child
        }
    }
}

var donald: PersonE? = PersonE(name: "donald", child: jenny)
donald?.pet = happy
donald = nil // donald 인스턴스가 더이상 필요없으므로 메모리에서 해제됩니다
// donald가 jenny에게 happy를 인도합니다
```