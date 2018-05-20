# assert / guard

애플리케이션이 동작 도중에 생성하는 다양한 연산 결과값을 동적으로 확인하고 빠르고 안전하게 처리할 수 있다.

### Assertion

- **assert(_:_:file:line:)** 함수를 사용
- **assert** 함수는 **디버깅 모드에서만** 동작한다.
- 배포하는 애플리케이션에서는 제외된다.
- 예상했던 **조건의 검증을 위하여** 사용한다.

```swift
var someInt: Int = 0

// 검증 조건과 실패시 "someInt != 0"을 출력해준다
// 검증 조건에 부합하기 때문에 그냥 지나간다
assert(someInt == 0, "someInt != 0")

someInt = 1
//assert(someInt == 0) // 동작 중지, 검증 실패
//assert(someInt == 0, "someInt != 0") // 동작 중지, 검증 실패

func functionWithAssert(age: Int?) {
    assert(age != nil, "age == nil")
    
    assert((age! >= 0) && (age! <= 130), "나이값 입력이 잘못되었습니다")
    print("당신의 나이는 \(age!)세입니다")
}

functionWithAssert(age: 50)
//functionWithAssert(age: -1) // 동작 중지, 검증 실패
//functionWithAssert(age: nil) // 동작 중지, 검증 실패
```

- **assert(_:_:file:line:)**와 같은 역할을 하지만 실제 배포 환경에서도 동작하는 **precondition(_:_:file:line:)** 함수도 있다. 



### guard (빠른종료 - Early Exit)

- **guard**를 사용하여 잘못된 값의 전달 시 특정 실행구문을 빠르게 종료한다.
- 디버깅 모드 뿐 아니라 어떤 조건에서도 동작한다.
- **guard**의 **else** 블럭 내부에는 특정 **코드블럭을 종료하는 지시어**(return, break 등)가 꼭 존재해야한다.
- 타입 캐스팅, 옵셔널과도 자주 사용된다.
- 그 외에도 단순 조건 판단 후 빠르게 종료할 때도 사용된다.

```swift
func functionWithGuard(age: Int?) {
    
    guard let unwrappedAge = age,
        unwrappedAge < 130,
        unwrappedAge >= 0 else {		//guard문에는 반드시 else가 있어야됨
        print("나이값 입력이 잘못되었습니다")
        return
    }
    
    print("당신의 나이는 \(unwrappedAge)세입니다")
    //if let과 다르게 guard문은 unwrapping한 후에도 customer 상수를 밑에서 사용할 수 있다.
}

var count = 1

while true {
    guard count < 3 else {
        break
    }
    print(count)
    count += 1
}
// 1
// 2

func someFunction(info: [String: Any]) {
    guard let name = info["name"] as? String else {
        return
    }
    
    guard let age = info["age"] as? Int, age >= 0 else {
        return
    }
    
    print("\(name): \(age)")
}

someFunction(info: ["name": "jenny", "age": "10"])
someFunction(info: ["name": "mike"])
someFunction(info: ["name": "yagom", "age": 10]) // yagom: 10
```

