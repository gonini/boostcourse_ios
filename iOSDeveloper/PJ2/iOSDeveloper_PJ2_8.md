### DateFormatter

날짜와 텍스트 표현 간의 변환을 할 수 있게 해준다. DateFormatter를 활용해 날짜와 시간을 다양한 방식으로 출력하거나 출력된 날짜 및 시간에 대한 문자열을 읽어올 수 있다.

DateFormatter의 인스턴스는 Date 객체의 문자열 표현을 생성하고, 날짜 및 시간의 텍스트 표현을 Date 객체로 변환한다.



#### 사용자 날짜 및 시간 표현

사용자에게 날짜를 표시할 때 특정 요구 사항에 따라 date formatter의 dateStyle과 timeStyle 프로퍼티를 설정한다. dateStyle과 timeStyle 프로퍼티의 값을 기반으로 DateFormatter는 지정된 로케일에 적합한 지정된 날짜의 표현을 제공한다. 미리 정의된 스타일을 통해 얻을 수 없는 형식을 지정해야 한다면 setLocalizedDateFormatFromTemplate(_:)을 사용해 날짜 형식을 지정할 수 있다.



#### DateFormatter의 주요 프로퍼티와 메소드

- func date(from: String) : 주어진 문자열을 Date 객체(날짜와 시간)로 변환하여 반환
- func string(from: Date) : 주어진 Date 객체를 문자열로 변환하여 반환
- func setLocalizedDateFormatFromTemplate(String) : 지정된 로케일을 사용해 날짜 형식을 설정
- var dateStyle: DateFormatter.Style : DateFormatter의 날짜 형식
- var timeStyle: DateFormatter.Style : DateFormatter의 시간 형식
- var dateFormat: String! : 고정 형식 날짜 표현을 사용할 때의 날짜 형식
- var locale: Locale! : DateFormatter의 로케일
- var timeZone: TimeZone! : DateFormatter의 시간대

```swift
//Date 객체 --> 문자열 형식
import UIKit

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .none

let date = Date(timeIntervalSinceReferenceDate: 118800)

// US English Locale (en_US)
dateFormatter.locale = Locale(identifier: "en_US")
print(dateFormatter.string(from: date)) // Tuesday, January 2, 2001

// KOR Korean Locale (ko_KR)
dateFormatter.locale = Locale(identifier: "ko_KR")
print(dateFormatter.string(from: date)) // 2001년 1월 2일 화요일

//문자열 형식 --> Date 객체
let dateFormatter = DateFormatter()

let dateString = "1970-01-01 08:03:30 +0000"
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
print(dateFormatter.date(from: dateString)!) // 1970-01-01 08:03:30 +0000
```

