# AVFoundation

다양한 Apple 플랫폼에서 사운드 및 영상 미디어의 처리, 제어, 가져오기 및 내보내기 등 광범위한 기능을 제공하는 프레임워크



**주요 기능**

- 미디어 재생 및 편집
- 디바이스 카메라와 마이크를 이용한 영상 녹화 및 사운드 녹음
- 시스템 사운드 제어
- 문자의 음성화



### AVAudioPlayer Class

파일 또는 메모리에 있는 사운드 데이터를 재생하는 기능을 제공



**AVAudioPlayer 주요기능**

- 파일 또는 메모리에 있는 사운드 재생 (네트워크에 있는 사운드 파일은 재생이 불가능하다)
- 파일 재생 시간 길이의 제한없이 사운드를 재생할 수 있다.
- 여러 사운드 파일 동시 재생
- 사운드의 재생 속도 제어 및 스테레오 위치 지정
- 앞으로 감기, 뒤로 감기 등 기능을 지원해 사운드 파일의 특정 지점을 찾을 수 있다.
- 현재 재생 정보 데이터 얻기
- 사운드 반복 재생



**AVAudioPlayer 주요 프로퍼티**

- var isPlaying: Bool : 사운드가 현재 재생중인지 아닌지 여부
  - A.Pause() 함수가 호출되면 A.isPlaying은 false를 반환
  - A.Play() 함수를 다시 호출하면 A.isPlaying는 true를 반환
- var rate: Float : 사운드 재생 속도
- var numberOfLoops: Int : 사운드 재생 반복 횟수
  - 기본값 : 0 —> 사운드 1회 재생
  - 양수값으로 설정 시 설정값 + 1회 재생
  - 음수값으로 설정 시 stop 메서드가 호출될 때까지 무한 재생
- var duration: TimeInterval : 사운드의 총 재생 시간(초)
- protocol AVAudioPlayerDelegate : 사운드 재생 완료, 재생 중단 및 디코딩 오류에 응답할 수 있는 프로토콜



**AVAudioPlayer 주요 메서드**

```Swift
func play()								//사운드 재생
func play(atTime: TimeInterval)			//특정 시점에서 사운드 재생
func pause()							//사운드 일시 정지
func stop()								//사운드 재생 정지
```





### Timer

일정한 시간 간격이 지나면 지정된 메시지를 특정 객체로 전달하는 기능을 제공



**Timer 특징**

- 타이머는 실행 루프(run loops)에서 작동한다.
  - Run Loop : 이벤트 처리를 위한 loop
- 타이머를 생성할 때 반복 여부를 지정한다.
  - 비 반복 타이머 : 한 번 실행된 후 자동으로 무효화
  - 반복 타이머 : 동일한 run loop에서 특정 시간 간격으로 실행된다. 반복되는 타이머 기능을 정지하려면 invalidate() 메서드를 호출해 해제시켜야한다.



**Timer 주요 프로퍼티**

- var isValid: Bool : 타이머가 현재 유효한지 아닌지 여부
- var fireDate: Date : 다음에 타이머가 실행될 시간
- var timeInterval: TimeInterval : 타이머의 실행 시간 간격(초)



**Timer 생성 메서드**

타이머 생성과 동시에 자동으로 run loop에 default mode로 등록하는 클래스 메서드

```swift
class func scheduledTimer(withTimeInterval: TimeInterval, repeats: Bool, block: (Timer) -> Void)

class func scheduledTimer(timeInterval: TimeInterval, target: Any, selector: Selector, userInfo: Any?, repeats: Bool)

class func scheduledTimer(timeInterval: TimeInterval, invocation: NSInvocation, repeats: Bool)
```



타이머 생성 후 수동으로 타이머 객체를 add(_:forMode:) 메서드를 이용해 run loop에 추가해줘야 하는 메서드

```swift
func init(timeInterval: TimeInterval, invocation: NSInvocation, repeats: Bool)

func init(timeInterval: TimeInterval, target: Any, selector: Selector, userInfo: Any?, repeats: Bool)

func init(fireAt: Date, interval: TimeInterval, target: Any, selector: Selector, userInfo: Any?, repeats: Bool)
```



fire() 메서드 : Timer 생성 메서드를 호출한 뒤 fire() 메서드를 호출하면 해당 코드들이 즉시 실행된다. fire()을 호출하지 않으면 Interval 뒤에 실행하게됨