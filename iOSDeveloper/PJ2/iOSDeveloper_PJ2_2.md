# 네비게이션 인터페이스

iOS에서 네비게이션 인터페이스는 주로 계층적 구조의 화면전환을 위해 사용되는 드릴 다운 인터페이스(drill-down interface)이다.



## 네비게이션 컨트롤러

컨테이너 뷰 컨트롤러(container view controller)로써 네비게이션 스택(navigation stack)을 사용해 다른 뷰를 관리한다. 여기서 네비게이션 스택에 담겨 콘텐츠를 보여주게 되는 뷰 컨트롤러들을 컨텐트 뷰 컨트롤러(content view controller)라 한다.

네비게이션 컨트롤러는 두 개의 뷰를 화면에 표시하는데, 네비게이션 스택뷰에 포함된 최상위 컨텐트 뷰 컨트롤러의 콘텐츠를 나타내는 뷰와 네비게이션 컨트롤러가 직접 관리하는 뷰(네비게이션바 or 툴바)가 있다.

추가로 네비게이션 인터페이스의 변화에 따른 특정 액션을 동작하도록 하기 위해 네비게이션 델리게이트 객체를 사용할 수 있다.



### 네비게이션 스택이란?

네비게이션 컨트롤러에 의해 관리되는 네비게이션 스택은 뷰 컨트롤러를 담을 수 있는 배열과 같다. 네비게이션 스택에 가장 하위에 있는(가장 먼저 스택에 추가된) 뷰 컨트롤러는 네비게이션 컨트롤러의 root view controller가 된다. root view controller는 navigation stack에서 pop되지 않는다. Navigation stack의 가장 상위에 있는(가장 마지막에 스택에 추가된) 뷰 컨트롤러는 최상위 뷰 컨트롤러로 화면에 보이게 된다.



### 네비게이션 스택에서의 화면이동

UINavigationController 클래스의 메서드 또는 세그(segue)를 사용해 네비게이션 스택의 뷰 컨트롤러를 추가/삭제할 수 있다. 또한 애플리케이션 실행 중 사용자가 네비게이션 인터페이스의 뒤로가기(back) 버튼을 사용하거나 화면의 왼쪽 가장자리를 스와이프(swipe)해 스택에 있는 최상위 뷰 컨트롤러를 삭제하고 그 아래에 가려져있던 뷰 컨트롤러의 콘텐트를 보여줄 수 있다.

(* 세그(segue) : 스토리보드에서 한 화면에서 다른 화면으로의 전환, 세그도 내부적으로 UINavigationController 클래스의 메서드를 사용)



### UINavigationController 클래스

- 네비게이션 컨트롤러의 생성

```swift
// 내비게이션 컨트롤러의 인스턴스를 생성하는 메서드
// 매개변수로 내비게이션 스택의 가장 아래에 있는 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 넘겨준다.
init(rootViewController: UIViewController)
```



- 네비게이션 스택의 뷰 컨트롤러에 대한 접근

```swift
var topViewController: UIViewController?

// 현재 내비게이션 인터페이스에서 보이는 뷰와 관련된 뷰 컨트롤러에 접근하기 위한 프로퍼티
var visibleViewController: UIViewController?

// 내비게이션 스택에 특정 뷰 컨트롤러에 접근하기 위한 프로퍼티(루트 뷰 컨트롤러의 인덱스는 0)
var viewController: [UIViewController]
```



- 네비게이션 스택의 푸시와 팝에 관한 메서드

```swift
// 내비게이션 스택에 뷰 컨트롤러를 푸시
// 푸시 된 뷰 컨트롤러는 최상위 뷰 컨트롤러로 화면에 표시된다.
func pushViewController(UIViewController, animated: Bool)

// 내비게이션 스택에 있는 최상위 뷰 컨트롤러를 팝
// 최상위 뷰 컨트롤러 아래에 있던 뷰 컨트롤러의 콘텐츠가 화면에 표시된다.
func popViewController(animated: Bool) -> UIViewController?

// 내비게이션 스택에서 루트 뷰 컨트롤러를 제외한 모든 뷰 컨트롤러를 팝
// 삭제된 모든 뷰 컨트롤러의 배열이 반환된다.
func popToRootViewController(animated: Bool) -> [UIViewController]?

// 특정 뷰 컨트롤러가 내비게이션 스택에 최상위 뷰 컨트롤러가 되기 전까지 상위에 있는 뷰 컨트롤러들을 팝
func popToViewController(_ viewController: UIViewController, 
		animated: Bool) -> [UIViewController]?
```

