# Singleton

특정 클래스의 인스턴스가 오직 하나임을 보장하는 객체

애플리케이션이 요청한 횟수와는 관계없이 이미 생성된 같은 인스턴스를 반환 즉, 애플리케이션 내에서 특정 클래스의 인스턴스가 딱 하나만 있기 때문에 다른 인스턴스들이 공유해서 사용할 수 있다.



### Cocoa 프레임워크에서의 싱글턴 디자인 패턴

- FileManager : 애플리케이션 파일 시스템을 관리하는 클래스
- URLSession : URL 세션을 관리하는 클래스
- NotificationCenter : 등록된 알림의 정보를 사용할 수 있게 해주는 클래스
- UserDefaults : Key-Value 형태로 간단한 데이터를 저장, 관리할 수 있는 인터페이스를 제공하는 DB 클래스
- UIApplication : iOS에서 실행되는 중앙제어 애플리케이션 객체



멀티 스레드 환경에서 동시에 싱글턴 객체를 참조할 경우 원치 않은 결과를 가져올 수 있음



# StackView

#### UIStackView

스택뷰는 여러 뷰들의 수평 또는 수직 방향의 선형적인 레이아웃의 인터페이스를 사용할 수 있도록 해준다. 스택뷰와 오토레이아웃을 활용해 디바이스의 방향과 화면크기에 따라 동적으로 적응할 수 있는 사용자 인터페이스를 만들 수 있다. 스택뷰의 레이아웃은 스택뷰의 'axis', 'distribution', 'alignment', 'spacing'과 같은 프로퍼티를 통해 조정한다.



### 스택뷰 생성

스토리보드에서 스택뷰에 뷰를 추가하는 것은 코드상으로 'func addArrangedSubview(UIView)' 메소드를 호출하는 것과 같다.



#### UIStackView 클래스의 주요 프로퍼티

- var arrangedSubviews: [UIView]: 스택뷰에서 정렬된 뷰들의 목록. 스택뷰에 포함된 뷰들이 이 프로퍼티에 저장하고 관리한다.
- var axis: UILayoutConstraintAxis: 레이아웃의 방향을 결정 ( 수직 :  vertical, 수평 : horizontal)
- var distribution: UIStackViewDistribution: 스택뷰에 포함된 뷰가 스택뷰 내에서 어떻게 배치될지 결정 ( 여러개의 스택뷰로 이루워졌을 경우인듯...? )
- var spacing: CGFloat: 스택뷰에 정렬된 뷰들 사이 간격 결정. 기본 : 0.0



### UIStackView 클래스의 주요 메소드

- func addArrageSubview(UIView): arrangedSubviews 배열 마지막 요소에 뷰를 추가
- func insertArrangedSubview(UIView, at: Int): arrangedSubviews 배열의 특정 인덱스에 뷰를 추가
- func removeArrangedSubview(UIView): 스택뷰의 arrangedSubviews 배열로부터 뷰를 제거