#### 명명법

- Lower Camel Case

- Upper Camel Case

  **Swift는 모든 대소문자를 구분한다.



#### 콘솔로그 남기기

- print 함수 : 단순 문자열을 출력
- dump 함수 : 인스턴스의 프로퍼티까지 출력한다.



#### 문자열 보간법 (String Interpolation)

- 프로그램 실행 중에 문자열 내에 변수 또는 상수의 실질적인 값을 표현하기 위해서 사용한다.

```swift
import Swift

let age: Int = 10

"안녕하세요! 저는 \(age+5)살입니다."
```



#### 상수와 변수 선언

- let : 상수 선언 키워드
- var : 변수 선언 키워드

선언을 한 뒤, 나중에 값을 할당하려는 상수나 변수는 반드시 타입을 명시해야한다.

```swift
let sum: Int
let A: Int = 100
let B: Int = 200

sum = A + B
```



#### Any, AnyObject, nil

- Any : Swift의 모든 타입을 지칭하는 키워드
- AnyObject : Swift의 모든 클래스 타입을 지칭하는 프로토콜
- nil : '없음'을 의미하는 키워드 —> 다른 언어의 NULL, Null, null 등과 유사한 표현



# 컬렉션 타입

- Array - 순서가 있는 리스트 컬렉션
- Dictionary - 키와 값의 쌍으로 이루어진 컬렉션
- Set - 순서가 없고, 멤버가 유일한 컬렉션



###1. Array

```Swift
//array 생성
var doubles: Array<Double> = Double
var strings: [String] = String
var characters: [Character] = []
let immutableArray = [1,2,3]

//추가
array.append(1)
array.append(100)

//존재 여부 (배열이 해당 요소를 가지고 있다면 true, 없으면 false)
array.contains(100)
array.contains(99)

//삭제
array.remove(at:0)
array.removeLast()
array.removeAll()

//요소 개수
array.count

//배열이 비어있는 상태에서 array[0]처럼 접근하게 되면 오류 발생

//여기서는 let으로 선언했기 때문에 값을 변경할 수 없다.
immutableArray.append(4)		//에러
immutableArray.removeAll()		//에러

```



### 2. Dictionary

```swift
let emptyDictionary: [String: String] = [:]
var anyDictionary: Dictionary<String, Any> = String: Any
//String 타입의 key, Any 타입의 값을 가지는 Dictionary 생성

anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

//dictionary는 넣어준 순서대로 저장되는 것이 아니다(정렬X)

anyDictionary["someKey"] = "dictionary"  //값변경

anyDictionary.removeValue(forKey: "anotherKey")
anyDictionary["someKey"] = nil
//두가지 표현은 같은 역할을 한다. 해당 요소를 삭제하는 것
```



### 3. Set

```Swift
var integerSet: Set<Int> = Set<Int>()

integerSet.insert(1)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)
//99는 이미 추가했기때문에 추가해도 계속 한개만 남게됨
integerSet.insert(100)

// contains: 멤버 포함 여부 확인
print(integerSet.contatins(1)) // true
print(integerSet.contains(2)) // false

// remove: 멤버 삭제
integerSet.remove(99)
integerSet.removeFirst()

// count: 멤버 개수
integerSet.count
```



#### 3-1. Set의 활용

```swift
// 멤버의 유일성이 보장되기 때문에 집합 연산에 활용하면 유용합니다.
let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

// 합집합
let union: Set<Int> = setA.union(setB)
print(union) // [2, 4, 5, 6, 7, 3, 1]

// 합집합 오름차순 정렬
let sortedUnion: [Int] = union.sorted()
print(sortedUnion) // [1, 2, 3, 4, 5, 6, 7]

// 교집합
let intersection: Set<Int> = setA.intersection(setB)
print(intersection) // [5, 3, 4]

// 차집합
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting) // [2, 1]
```