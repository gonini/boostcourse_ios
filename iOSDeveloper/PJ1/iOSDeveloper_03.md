## UIButton, UILabel, UISlider

### UIButton

사용자의 터치, 탭 등의 이벤트에 반응해 미리 지정된 코드를 실행하는 컨트롤 요소



**버튼의 상태**

- 버튼의 상태는 다섯가지로 표현할 수 있다.
  - default, highlighted, focused, selected, disabled
  - 버튼의 상태는 조합된 상태일 수 있다. 예) [default + highlighted], [selected + disabled] 등
- 기본 상태 값은 default
- 사용자가 버튼과 상호작용을 하면 상태 값이 변하게 된다.
- 프로그래밍 혹은 인터페이스 빌더를 이용해 버튼의 각 상태에 대한 속성을 별도로 지정할 수 있다.
  - 별도로 속성을 지정하지 않으면 UIButton 클래스에서 제공하는 기본 동작을 사용하게 된다.
  - 예) disabled 버튼은 일반적으로 흐리게 표시되며 사용자가 탭 해도 highlighted 되지 않는다.



**버튼 주요 프로퍼티**

- enum UIButtonType : 버튼 유형
  - 버튼 유형에 따라 버튼의 기본적인 외형과 동작이 달라진다.
  - 처음 버튼 생성 시 init(type:) 메서드를 이용하거나, 인터페이스 빌더의 "Attribute Inspector"에서 버튼 유형을 지정할 수 있다.
  - 한번 생성된 버튼의 유형은 이후에 바꿀 수 없다.
  - 가장 많이 사용하는 유형은 Custom, System이지만 필요에 따라 다른 유형(Detail Disclosure, Info Light, Info Dark, Add Contact)을 사용할 수 있다.
- var titleLabel: UILabel? : 버튼 타이틀 레이블
- var imageView: UIImageView? : 버튼의 이미지 뷰



**버튼의 주요 메서드**

```swift
// 특정 상태의 버튼의 문자열 설정
func setTitle(String?, for: UIControlState)

// 특정 상태의 버튼의 문자열 반환
func title(for: UIControlState) -> String?

// 특정 상태의 버튼 이미지 설정
func setImage(UIImage?, for: UIControlState)

// 특정 상태의 버튼 이미지 반환
func image(for: UIControlState) -> UIImage?

// 특정 상태의 백그라운드 이미지 설정
func setBackgroundImage(UIImage?, for: UIControlState)

// 특정 상태의 백그라운드 이미지 반환
func backgroundImage(for: UIControlState) -> UIImage?

// 특정 상태의 문자열 색상 설정
func setTitleColor(UIColor?, for: UIControlState)

// 특정 상태의 attributed 문자열 설정
func setAttributedTitle(NSAttributedString?, for: UIControlState)
```



### UILabel

한 줄 또는 여러 줄의 텍스트를 보여주는 뷰로, UIButton 등의 컨트롤의 목적을 설명하기 위해 사용하는 경우가 많다.

**레이블 생성 3단계**

1. 레이블을 생성한다.
2. 레이블이 표시할 문자열을 제공한다.
3. 레이블의 모양 및 특성을 설정한다.



**레이블 주요 프로퍼티**

- var text: String? : 레이블이 표시할 문자열
  - 문자열이 모두 동일한 속성(폰트, 색상, 기울임꼴 등)으로 표시된다.
  - text 프로퍼티에 값을 할당하면 attributedText 프로퍼티에도 똑같은 내용의 문자열이 할당된다.
- var attributedText: NSAttributedString? : 레이블이 표시할 속성 문자열
  - NSAttributed 클래스를 사용한 속성 문자열 중 특정 부분의 속성을 변경할 수 있다.
  - attributedText 프로퍼티에 값을 할당하면 text 프로퍼티에도 똑같은 내용의 문자열이 할당된다.
- var numberOfLines: Int : 문자를 나타내는 최대 라인 수
  - 문자열을 모두 표시하는 데 필요한 만큼 행을 사용하려면 0으로 설정, 기본 값은 1이다.
  - 설정한 문자열이 최대 라인 수를 초과하면 lineBreakMode 프로퍼티의 값에 따라 적절히 잘라서 표현된다.
  - adjustsFontSizesToFitWidth 프로퍼티를 사용하면 폰트 사이즈가 레이블의 넓이에 따라 자동으로 조절된다.
- var baselineAdjustment: UIBaselineAdjustment : 문자열이 Autoshrink 되었을 때 수직 정렬 방식
  - Align Baseline : 문자가 작아졌을 때 기존 문자열의 기준선에 맞춤
  - Align Center : 문자가 작아졌을 때 작아진 문자의 중앙선에 맞춤
  - None : 문자가 작아졌을 떄 기존 문자열의 위쪽 선에 맞춤
- var lineBreakMode: NSLineBreakMode : 레이블의 경계선을 벗어나는 문자열에 대응하는 방식
  - Character wrap : 여러 줄 레이블에 주로 적용되며, 글자 단위로 줄 바꿈을 결정
  - Word wrap : 여러 줄 레이블에 주로 적용되며, 단어 단위로 줄 바꿈을 결정
  - Truncate head : 한 줄 레이블에 주로 적용되며, 앞쪽 텍스트를 자르고 …으로 표시
  - Truncate middle : 한 줄 레이블에 주로 적용되며, 중간 텍스트를 자르고 …표시
  - Truncate tail : 한 줄 레이블에 주로 적용되며, 끝쪽 텍스트를 자르고 ...표시 ( **기본 값** )



### UISlider

연속된 값 중에서 특정 값을 선택하는데 사용되는 컨트롤

**슬라이더 생성 3단계**

1. 슬라이더를 생성하고, 슬라이더가 나타내는 값의 범위를 지정한다.
2. 적절한 색상과 이미지를 이용해 슬라이더의 모양을 구성한다.
3. 하나 이사의 메서드를 슬라이더와 연결한다.



기본적으로는 사용자가 슬라이더의 Thumb를 이동시키면 연속적으로 이벤트를 호출하지만, isContinous 프로퍼티 값을 false로 설정하면 Thumb에서 손을 떼는 동시에 이벤트를 호출한다.



**슬라이더 주요 프로퍼티**

- var minimumValue: Float, var maximumValue: Float : 슬라이더 양끝 값
- var value: Float : 슬라이더 현재 값
- var isContinuous: Bool : 슬라이더의 연속적인 값 변화에 따라 이벤트를 연속적으로 호출할 것인지의 여부
- var minimumValueImage: UIImage?, var maximumValueImage: UIImage? : 슬라이더 양끝단의 이미지
- var thumbTintColor: UIColor? : thumb의 틴트 색상
- var thumbTintColor: UIColor?, var maximumTrackTintColor: UIColor? : thumb를 기준으로 앞쪽과 뒤쪽 트랙의 틴트 색상



**슬라이더 주요 메서드**

```swift
func setValue(Float, animated: Bool)			//  슬라이더의 현재 값 설정

//  특정 상태의 minimumTrackImage 반환
func minimumTrackImage(for: UIControlState) -> UIImage?

// 특정 상태의 minimumTrackImage 설정
func setMinimumTrackImage(UIImage?, for: UIControlState)

// 특정 상태의 maximumTrackImage 반환
func maximumTrackImage(for: UIControlState) -> UIImage?

// 특정 상태의 minimumTrackImage 설정
func setMaximumTrackImage(UIImage?, for: UIControlState)

//  특정 상태의 thumbImage 반환
func thumbImage(for: UIControlState) -> UIImage?

//특정 상태의 thumbImage 설정
func setThumbImage(UIImage?, for: UIControlState)
```

