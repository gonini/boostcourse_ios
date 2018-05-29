# iOS의 View 체계

### 뷰의 기본적인 역할

iOS에서 화면에 애플리케이션의 콘텐츠를 나타내기 위해서 Window와 View를 사용한다. Window는 애플리케이션의 뷰를 위한 컨테이너 역할을 하며, View는 UIView 클래스 또는 UIView 클래스의 subclass의 인스턴스로 Window의 한 영역에서 콘텐츠를 보여준다. View는 또 다른 뷰를 관리하고 구성하기 위해 사용되기도 한다.

View는 gesture recongnizer를 사용하거나 직접 터치 이벤트를 처리할 수 있다. 또한 View hierarchy 구조에서 parent view는 child view의 위치와 크기를 관리한다.



### View hierarchy(뷰 계층)

-View hierarchy 구조와 subView 관리 -

View는 자신의 콘텐츠를 보여주는 것과 다른 View를 위한 컨테이너 역할도 한다.

하나의 View가 다른 View를 포함할 때, 두 View 사이에는 parent-child 관계가 생성된다. 여기서 childView는 subView로, parentView는 superView로 불린다. Parent-child 관계는 애플리케이션의 시각적 모습과 동작에 영향을 미친다.



### View hierarchy의 생성과 관리

addSubView(_:) : subView를 parentView에 add

removeFromSuperView() : parentView의 subView를 remove

insertSubview(_:at:) : subView를 parentView 목록의 중간에 insert

bringSubView(toFront:), sendSubview(toBack:) : parentView 내에 이미 존재하는 subView를 정렬

View Controller에 class 연결을 확인할것!



### View의 좌표계

UIKit에서 기본이 되는 좌표계는 좌측 상단 모서리를 원점으로 한다. 아래로 갈수록 x값이 커지고, 오른쪽으로 갈수록 y값이 커진다. 좌표값은 해상도와 상관없이 콘텐츠의 위치를 잡는 부동소수점을 사용해 나타낸다.

#### Frame / Bounds

Frame : View의 크기와 위치를 superView의 좌표계를 기준으로 나타냄

Bounds : View의 크기와 위치를 해당 View 자신의 좌표계를 기준으로 나타냄

```swift
let viewRect = CGRect(x: 100, y: 100, width: 200, height: 200)
let subView = UIView(frame: viewRect)

print("\(subView.frame)")				//(100.0, 100.0, 200.0, 200.0)
print("\(subView.bounds)")				//(0.0, 0.0, 200.0, 200.0)
print("\(subView.frame.origin)")		//(100.0, 100.0)
print("\(subView.bounds.origin)")		//(0.0, 0.0)
```



View의 사각형 정의

1. View를 어디에 그려야할지 위치를 알아야 한다.
2. 위치로부터 어떤 크기로 그려져야할지 알아야 한다.

View의 frame과 bounds는 CGRect라는 구조체를 통해 표현되는데 이것은 사각형의 크기와 위치에 대한 정보를 담고 있는데 CGRect의 origin 프로퍼티는 CGPoint 타입으로 사각형의 시작점을 나타내고 CGRect의 size 프로퍼티는 CGSize 타입으로 사각형의 높이와 너비를 나타낸다. CGPoint는 좌표를 표현할 수 있는 x와 y를 가지며, CGSize는 너비와 높이의 값인 width와 height를 갖는다.

CGPoint의 x, y와 CGSize의 width, height는 모두 부동소수점 타입인 CGFloat으로 표현됨.