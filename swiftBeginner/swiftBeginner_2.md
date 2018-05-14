# Function basics

### 1. 함수선언의 기본형태

```Swift
func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
}

// example)
// sum이라는 이름을 가지고 
// a와 b라는 Int 타입의 매개변수를 가지며 
// Int 타입의 값을 반환하는 함수
func sum(a: Int, b: Int) -> Int {
    return a + b
}
```



### 2. 함수의 여러 형태

```swift
//반환값이 없는 함수
//Void는 생략가능
func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 ...) -> Void {
    /* 함수 구현부 */
    return
}

//매개변수가 없는 함수
func 함수이름() -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
}

//매개변수도 반환값도 없는 함수
func 함수이름() -> Void {
    /* 함수 구현부 */
    return
}

// 함수 구현이 짧은 경우
// 가독성을 해치지 않는 범위에서
// 한 줄에 표현해도 무관하다.
func hello() -> Void { print("hello") }
//func hello(){ print("hello") }
```



# Advanced Function

### 1. 매개변수 기본 값

- 매개변수에 기본적으로 전달될 값을 미리 지정해 둘 수 있다.
- 기본값을 갖는 매개변수는 매개변수 목록 중 뒤쪽에 위치하는 것이 좋다.

```Swift
func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입 = 매개변수 기본값 ...) -> 반환타입 {
    /* 함수 구현부 */
    return 반환값
}

func greeting(friend: String, me: String = "yagom") {
    print("Hello (friend)! I'm (me)")
}

// 매개변수 기본값을 가지는 매개변수는 호출시 생략할 수 있다.
greeting(friend: "hana") // Hello hana! I'm yagom
greeting(friend: "john", me: "eric") // Hello john! I'm eric
//기본값이 아닌 다른 값을 전달할 수도 있음



```



###2. 전달인자 레이블 (argument lable)

- 함수를 호출할 때 함수 사용자의 입장에서 매개변수의 역할을 좀 더 명확하게 표현하고자 할 때 사용한다.
- 전달인자 레이블은 변경해서 동일한 이름의 함수를 중복으로 생성이 가능하다.

```Swift
func 함수이름(전달인자 레이블 매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입 ...) -> 반환타입 {
    /* 함수 구현부 */
    return
}

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용한다.
func greeting(to friend: String, from me: String) {
    print("Hello (friend)! I'm (me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 한다.
greeting(to: "hana", from: "yagom") // Hello hana! I'm yagom
//즉, greeting 함수 내부에선 friend와 me를 사용하고 외부에서는 to와 from을 사용한다.
```



###3. 가변 매개변수

- 전달 받을 값의 개수를 알기 어려울 때 사용한다.
- 가변 매개변수는 함수당 하나만 가질 수 있다.
- 기본값이 있는 매개변수와 같이 가변 매개변수 역시 매개변수 목록 중 뒤쪽에 위치하는 것이 좋다.

```swift
func 함수이름(매개변수1이름: 매개변수1타입, 전달인자 레이블 매개변수2이름: 매개변수2타입...) -> 반환타입 {
    /* 함수 구현부 */
    return
}

func sayHelloToFriends(me: String, friends: String...) -> String {
    return "Hello (friends)! I'm (me)!"
}

print(sayHelloToFriends(me: "yagom", friends: "hana", "eric", "wing"))
// Hello ["hana", "eric", "wing"]! I'm yagom!

print(sayHelloToFriends(me: "yagom"))
// Hello []! I'm yagom!

//가변 매개변수에 값을 주지 않거나 nil을 할당할 경우에는 에러가 발생한다. 그렇기 때문에 값을 주기 싫을 때는 아예 가변 매개변수를 쓰지 않고 생략하면 된다.

```



### 4. 데이터 타입으로서의 함수

- 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이므로 스위프트의 함수는 일급객체다. 그래서 함수를 변수, 상수 등에 할당이 가능하고 매개변수를 통해 전달할 수도 있다.

- 함수의 타입 표현 : 반환 타입을 생략할 수 없다.

```swift
(매개변수1타입, 매개변수2타입 ...) -> 반환타입

var someFunction: (String, String) -> Void = greeting(to:from:)
someFunction("eric", "yagom") // Hello eric! I'm yagom

someFunction = greeting(friend:me:)
someFunction("eric", "yagom") // Hello eric! I'm yagom

// 타입이 다른 함수는 할당할 수 없다 - 컴파일 오류 발생
// someFunction = sayHelloToFriends(me: friends:)
// 위에서 선언했던 sayHelloToFriends 함수의 friends가 가변 매개변수이기 때문에 에러가 발생

func runAnother(function: (String, String) -> Void) {
    function("jenny", "mike")
}

runAnother(function: greeting(friend:me:))
// Hello jenny! I'm mike
runAnother(function: someFunction)
// Hello jenny! I'm mike

```

