# Gesture Recognizer ( 제스처 인식기 )

여러 제스처 관련 이벤트를 인식할 수 있다. 특정 제스처가 일어날 때마다 각 타깃에 맞는 액션 메시지를 보내 제스처 관련 이벤트를 처리할 수 있다.



### UIGestureRecognizer class

이것은 특정 제스처 인식기에 대한 동작을 정의한다. 또한 델리게이트 객체를 활용해 일부 동작을 더 세밀하게 사용자화 할 수 있다.



### UIGestureRecognizer의 하위 클래스

1. UITapGestureRecognizer : 싱글탭 또는 멀티탭
2. UIPinchGestureRecognizer : 핀치(Pinch) -> 확대, 축소할 때 사용하는 제스처
3. UIRotationGestureRecognizer : 회전
4. UISwipeGestureRecognizer : 스와이프
5. UIPanGestureRecognizer : 드래그(Drag)
6. UIScreenEdgePanGestureRecognizer : 화면 가장자리 드래그
7. UILongPressGestureRecognizer : 롱프레스(long-press) -> 같은 자리를 꾹 누르는 제스처

- 제스처 인식기를 사용하기 위해 target-action 연결을 설정한 후 UIView의 메소드인 addGestureRecognizer(_:) 메소드를 통해 뷰에 연결한다. 제스처가 인식되면 해당 제스처 이벤트에 연결된 타깃에 액션 메시지가 전달된다. 호출되는 액션 메소드는 아래 메소드 구현 형식 중 하나돠 같아야 한다.

```swift
@IBAction func myActionMethod()
@IBAction func myActionMethod(_ sender: UIGestureRecognizer)
```

- 윈도우는 뷰에 터치 이벤트를 전달하기 전에 뷰에 추가된 제스처 인식기에 먼저 터치 이벤트를 전달한다. 제스처 인식기가 터치 이벤트를 인식했을 경우 뷰는 터치 이벤트를 받지 못하고, 만약 제스처 인식기가 터치 이벤트를 인식하지 못했을 경우 터치 이벤트를 뷰가 받게 된다. 일반적인 제스처 인식기의 동작의 흐름은 `cancelsTouchesInView`, `delaysTouchesBegan`, `delaysTouchesEnded` 프로퍼티의 값에 영향을 받는다.



### UIGestureRecognizer의 주요 프로퍼티

- var state: UIGestureRecognizerSate : 현재 제스처 인식기의 상태
- var view: UIView? : 제스처 인식기가 연결된 뷰
- var isEnabled: Bool : 제스처 인식기가 사용가능한 상태인지 여부
- var cancelsTouchInView : 제스처가 인식되었을 떄 터치 이벤트가 뷰로 전달되는 여부에 영향을 미친다.
  - 이 프로퍼티가 ture이고 제스처가 인식했다면, 해당 제스처의 터치는 뷰로 전달되지 않는다. 이전에 전달된 터치들은 touchesCancelled(_:with:) 메소드를 통해 취소된다. 제스처 인식기가 제스처를 인식하지 못하거나 이 프로퍼티 값이 false라면 뷰가 모든 터치를 전달받게 된다.
- var delaysTouchesBegan : began 단계에서 제스처 인식기가 추가된 뷰에 터치의 전달 지연 여부를 결정
- var delaysTouchesEnded : end 단계에서 제스처 인식기가 추가된 뷰에 터치의 전달 지연 여부를 결정

 

### iOS Standard Gesture

1. Tap : 컨트롤을 활성화하거나 항목을 선택
2. Drag : 아이템을 좌우 또는 화면으로 드래그
3. Flick : 빠르게 스크롤하거나 화면 넘김
4. Swipe : 이전 화면으로 돌아가거나 테이블 뷰에서 숨겨진 삭제 버튼을 표시
5. Double tap : 이미지 또는 콘텐츠를 확대하거나 축소
6. Pinch : 이미지를 세밀하게 확대하거나 축소
7. Touch and hold : 편집 가능한 텍스트 또는 선택 가능한 텍스트에서 수행될 경우 커서 지정을 위한 확대보기가 표시. 컬렉션 뷰의 경우 항목을 재배치할 수 있는 모드로 진입한다.
8. Shake : 실행 취소 또는 다시 실행 얼럿을 띄운다.