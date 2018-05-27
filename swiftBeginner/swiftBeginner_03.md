# 조건문

### if-else

- **if-else 구문의 기본 형태** 
- if만 단독으로 사용해도되고, else, else if 와 조합해서 사용 가능하다.
- 다른 언어들과 다르게 if의 조건문 안에는 Bool 타입의 값만 위치해야 한다. 
- 조건을 감싸는 소괄호는 선택사항

```swift
if 조건 {
     /* 실행 구문 */
} else if 조건 {
    /* 실행 구문 */
} else {
    /* 실행 구문 */
}
```

- if-else의 사용

```swift
let someInteger = 100

if someInteger < 100 {
    print("100 미만")
} else if someInteger > 100 {
    print("100 초과")
} else {
    print("100")
} // 100

// someInteger는 Bool 타입이 아닌 Int 타입이기 때문에 오류 발생
//if someInteger { }
```



### switch 구문

- 스위프트의 switch 구문은 다른 언어에 비해 굉장히 중요한 역할을 한다.
- 기본적으로 사용하던 정수타입의 값만 비교하는 것이 아니라 대부분의 스위프트 기본 타입을 지원하고, 다양한 패턴과 응용이 가능하다.
- 각각의 case 내부에는 실행가능한 코드가 반드시 위치해야 한다.
- 매우 한정적인 값(ex. enum의 case 등)이 아닌 한 default 구문은 반드시 작성해야 한다.
- 명시적 break를 하지 않아도 자동으로 case마다 break 된다.
- fallthrough 키워드를 사용하여 break를 무시할 수 있다.
- 쉼표(,)를 사용하여 하나의 case에 여러 패턴을 명시할 수 있다.
- **switch 구문의 기본 형태**

```Swift
switch 비교값 {
case 패턴:
    /* 실행 구문 */
default:
    /* 실행 구문 */
}
```

- **switch 구문의 사용**

```swift
// 범위 연산자를 활용하면 더욱 쉽고 유용
switch someInteger {
case 0:
    print("zero")
case 1..<100:		//1부터 100전 까지
    print("1~99")
case 100:
    print("100")
case 101...Int.max:	//101 이상
    print("over 100")
default:
    print("unknown")
} // 100

// 정수 외의 대부분의 기본 타입을 사용할 수 있다.
switch "yagom" {
case "jake","mina":
    print("jake")
case "yagom":
    print("yagom!!")
    fallthrough		//break무시
default:
    print("unknown")
} // yagom!!
```



# 반복문

### for-in 문

- 기존 언어의 for-each 구문과 비슷하다.
- Dictionary의 경우 이터레이션 아이템으로 튜플이 들어온다.
- **for-in 구문 기본 형태**

```swift
for item in items {
    /* 실행 구문 */
}
```

- **for-in 구문의 사용**

```swift
var integers = [1, 2, 3]
let people = ["yagom": 10, "eric": 15, "mike": 12]

for i in integers {
    print(i)
}

// Dictionary의 item은 key와 value로 구성된 튜플 타입입니다
for (name, age) in people {
    print("\(name): \(age)")
}
```



### while 문

- **while 구문의 기본 형태**

```swift
while 조건 {
    /* 실행 구문 */
}
```

- **while 구문의 사용**

```swift
//if문과 같이 조건문 안에는 Bool 타입의 값만 들어갈 수있다.
while integers.count > 1 {
    integers.removeLast()
}
```



### repeat-while 문

- 기존 언어의 do-while 구문과 형태/동작이 비슷하다.
- Do-while이 사용되지 않는 이유는 do가 swift에서 오류처리 구문으로 사용되기 때문
- **repeat-while 구문의 기본 형태**

```swift
repeat {
    /* 실행 구문 */
} while 조건
```

- **repeat-while 구문의 사용**

```swift
repeat {
    integers.removeLast()
} while integers.count > 0
```



