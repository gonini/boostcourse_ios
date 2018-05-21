# UIKit 프레임워크

iOS 애플리케이션의 사용자 인터페이스를 구현하고 이벤트를 관리하는 프레임워크

- 제스쳐 처리, 애니메이션, 그림 그리기, 이미지 처리, 텍스트 처리 등 사용자 이벤트 처리를 위한 클래스를 포함한다.
- 테이블뷰, 슬라이더, 버튼, 텍스트 필드, 얼럿 창 등 애플리케이션 화면을 구성하는 요소를 포함한다.
- iOS와 tvOS 플랫폼에서 사용



### UIKit 기능별 요소

**사용자 인터페이스**

- View and Control : 화면 콘텐츠 표시
- View Controller : 사용자 인터페이스 관리
- Animation and Haptics : 애니메이션과 햅틱을 통한 피드백 제공
- Window and Screen : 뷰 계층을 위한 윈도우 제공



**사용자 액션**

- Touch, Press, Gesture : 제스쳐 인식기를 통한 이벤트 처리 로직
- Drag and Drop
- Peek and Pop : 3D 터치에 대응한 미리보기 기능
- Keyboard and Menu : 키보드 입력 처리 및 사용자 정의 메뉴 표시



# Foundation 프레임워크

원시 데이터 타입(String, Int, Double), 컬렉션 타입(Array, Dictionary, Set) 및 운영체제 서비스를 사용해 애플리케이션의 기본적인 기능을 관리하는 프레임워크



### Foundation 기능별 요소

**기본**

- Number, Data, String : 원시 데이터 타입 사용
- Collection : Array, Dictionary, Set 등과 같은 컬렉션 타입 사용
- Data and Time : 날짜와 시간을 계산하거나 비교하는 작업
- Unit and Measurement : 물리적 차원을 숫자로 표현 및 관련 단위 간 변환 기능
- Data Formatting : 숫자, 날짜, 측정값 등을 문자열로 변환 또는 그 반대 작업
- Filter and Sorting : 컬렉션 요소를 검사하거나 정렬



**애플리케이션 지원**

- Resources : 애플리케이션의 에셋과 번들 데이터에 접근
- Notification : 정보를 퍼뜨리거나 받아들이는 기능
- App Extension : 확장 애플리케이션과의 상호작용
- Error and Exception : API와의 상호작용에서 발생할 수 있는 에러에 대처할 수 있는 기능



**파일 및 데이터 관리**

- File System : 파일 또는 폴더를 생성하고 읽고 쓰는 기능 관리
- Archives and Serialization : 속성 목록, JSON, 바이너리 파일들을 객체로 변환 또는 그 반대 작업을 관리
- iCloud : 사용자의 iCloud 계정을 이용해 데이터를 동기화하는 작업



**네트워킹**

- URL Loading System : 표준 인터넷 프로토콜을 통해서 URL과 상호작용하고 서버와 통신하는 작업
- Bonjour : 로컬 네트워크를 위한 작업