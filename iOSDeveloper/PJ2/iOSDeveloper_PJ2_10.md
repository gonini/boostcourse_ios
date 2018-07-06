# Project 2. Sign-Up

lazy : 반드시 var와 함께 사용할 수 있으며, lazy를 사용하면 해당 변수가 사용되기 전까지는 연산이 되지 않기 때문에 그 전에 불필요하게 메모리를 차지하는 것을 막을 수 있다.

Date() : 오늘 날짜



**UIImagePickerController**

.allowsEditing : 선택한 이미지를 편집할 수 있게 하는지에 대한 여부, true일 경우 편집 가능



**UIViewController**

dismiss(animated:completion:) : 모달로 표시된 뷰 컨트롤러를 닫는다.

present(_ viewControllerToPresent:animated:completion:) : viewControllerToPresent를 모달로  표시



**UIButton**

.isEnabled : 버튼의 활성화 여부



**UITextField**

.isSecureTextEntry : textField에 입력되는 text를 숨길지에 대한 여부

.keyboardType = .phonePad : 0~9, *, #을 입력할 수 있는 키패드

​			      .numberPad : 0~9를 입력할 수 있는 키패드



**UIImageView**

.isUserInteractionEnabled : imageView를 사용자 인터페이스로 사용할지에 대한 여부로 true로 설정시 tap할 수 있다
