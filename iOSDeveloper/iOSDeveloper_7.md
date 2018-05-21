# NSLayoutConstraint

오토레이아웃 방정식

1. **view1.attr1 = view2.attr2 * multiplier + constant**
2. **Item.attribute = toItem.attribute * multiplier + constant**

| 매개변수   | 설명                                                        |                                                              |
| ---------- | ----------------------------------------------------------- | ------------------------------------------------------------ |
| item       | 제약조건을 받는 뷰                                          |                                                              |
| relatedBy  | 제약조건을 받는 뷰 간의 관계                                | `NSLayoutRelation` 열거형 값을 가진다.<br />(.lessThanOrEqual, .equal, .greaterThanOrEqual) |
| attribute  | 뷰(왼쪽)의 제약조건의 속성                                  | `NSLayoutAttribute` 열거형 값을 가진다.<br />(.left, .right, .top, .bottom, .leading, .trailing, .width, .height, .centerX, centerY, .lastBaseline, .notAnAttribute 등등) |
| toItem     | 뷰(왼쪽)의 제약조건을 받을 뷰(오른쪽)                       |                                                              |
| attribute  | 뷰(오른쪽)의 제약 조건의 속성                               |                                                              |
| multiplier | 뷰(왼쪽)의 속성값을 얻기 위해 뷰(오른쪽)의 속성값을 곱한다. | 이값을 이용해 비율로 크기로 설정할 수 있고, 위치지정에도 활용할 수 있다. |
| constant   | 상수 값                                                     | multiplier 값이 아닌 상수 값이 필요한 경우에 사용            |

```swift
NSLayoutConstraint().priority = UILayoutPriority(rawValue : 20)
```

위와 같이 우선도는 1부터 1000까지의 정수로 표현할 수 있다.



### Visual Formmat Language

| 기호 및 문자열 | 설명                         |
| -------------- | ---------------------------- |
| \|             | superView                    |
| -              | 표준 간격 (default : 8point) |
| ==             | 같은 너비                    |
| -10-           | 사이 간격이 10point          |
| <=50,>=50      |                              |
| @750           | 우선도 지정                  |
| H              | 수평 방향                    |
| V              | 수직 방향                    |

```swift
H:|-50-[button1(>=70,<=100)][button2(100@20)]-20-|
```

