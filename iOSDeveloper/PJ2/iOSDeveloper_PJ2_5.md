# Delegation



### 델리게이션 디자인 패턴 (Delegation Design Pattern)

하나의 객체가 다른 객체를 대신해 동작 또는 조정할 수 있는 기능을 제공한다.

즉, 어떤 객체가 해야 하는 일을 부분적으로 확장해서 대신 처리한다.

- 델리게이션 디자인 패턴은 Foundation, UIKit, AppKit 그리고 Cocoa Touch 등 애플의 프레임워크에서 광범위하게 활용하고 있다.

- 주로 프레임워크 객체가 위임을 요청하며, 주로 애플리케이션 프로그래머가 작성하는 커스텀 컨트롤러 객체가 위임을 받아 특정 이벤트에 대한 기능을 구현한다.

- 델리게이션 디자인 패턴은 커스텀 컨트롤러에서 세부 동작을 구현함으로써 동일한 동작에 대해 다양한 대응을 할 수 있게 해준다.

- UITextFieldDelegate (이것은 UITextField의 객체의 문구를 편집하거나 관리하기 위해 아래와 같은 메소드를 정의해두었다.)

  ```swift
  // 대리자에게 특정 텍스트 필드의 문구를 편집해도 되는지 묻는 메서드
  func textFieldShouldBeginEditing(UITextField)
  	
  // 대리자에게 특정 텍스트 필드의 문구가 편집되고 있음을 알리는 메서드
  func textFieldDidBeginEditing(UITextField)
  
  // 특정 텍스트 필드의 문구를 삭제하려고 할 때 대리자를 호출하는 메서드
  func textFieldShouldClear(UITextField)
  
  // 특정 텍스트 필드의 `Return` 키가 눌렸을 때 대리자를 호출하는 메서드
  func textFieldShouldReturn(UITextField)
  ```

  

델리게이트는 특정 상황에 대리자에게 메시지를 전달하고 그에 대한 적절한 응답을 받기 위한 목적으로 사용된다.



### 데이터소스 (DataSource)

- 델리게이트와 매우 비슷한 역할을 한다.
- 델리게이트 : 사용자 인터페이스 제어에 관련된 권한을 위임 / 데이터소스 : 데이터를 제어하는 기능을 위임
- UITableViewDataSource와 UICollectionViewDataSource가 많이 사용된다.



### 프로토콜 (Protocol)

- 코코아터치에서 프로토콜을 사용해 델리게이션과 데이터소스를 구현할 수 있다.
- 객체간 소통을 위한 강력한 통신 규약으로 데이터나 메시지를 전달할 때 사용한다.
- 특별한 상황에 대한 역할을 정의하고 제시하지만, 세부기능은 미리 구현해두지 않는다.
- 구조체, 클래스, 열거형에서 프로토콜을 채택하고 특정 기능을 수행하기 위한 요구사항을 구현할 수 있다.