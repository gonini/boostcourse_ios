# 오류 처리

- 스위프트에서 오류(Error)는 **Error**라는 프로토콜을 준수하는 타입의 값을 통해 표현된다.
- **Error** 프로토콜은 사실상 요구사항이 없는 빈 프로토콜일 뿐이지만, 오류를 표현하기 위해 사용한다.
- 스위프트의 **열거형**은 오류의 종류를 나타내기에 아주 적합하다.



### 오류 표현

```swift
enum 오류종류이름: Error {
    case 종류1
    case 종류2
    case 종류3
    //...
}
```

 

### 특정한 함수에서 발생한 오류 던지기

- 오류가 발생할 여지가 있는 메서드는 throws를 사용해서 표시해준다.

```Swift
class VendingMachine {
    let itemPrice: Int = 100
    var itemCount: Int = 5
    var deposited: Int = 0
    
    // 자판기가 돈을 받는 메서드
    // throws를 사용해서 함수에서 오류가 발생할 여지가 있다라고 표시해준다.
    func receiveMoney(_ money: Int) throws {
        
        // 자판기에 넣은 돈이 0보다 작으면 오류를 던진다.
        //guard 문을 이용해서 빠른 종료를 유도
        guard money > 0 else {
            throw VendingMachineError.invalidInput
        }
        
        // 오류가 없으면 정상처리
        self.deposited += money
        print("\(money)원 받음")
    }
    
    // 물건을 파는 메서드
    // throws를 사용해서 함수에서 오류가 발생할 여지가 있다라고 표시해준다.
    func vend(numberOfItems numberOfItemsToVend: Int) throws -> String {
        
        // 원하는 아이템의 수량이 0개보다 적으면 오류를 던진다.
        guard numberOfItemsToVend > 0 else {
            //throw로 함수를 그냥 종료하면서 오류를 던짐
            throw VendingMachineError.invalidInput
        }
        
        // 구매하려는 수량보다 미리 넣어둔 돈이 적으면 오류를 던진다.
        guard numberOfItemsToVend * itemPrice <= deposited else {
            let moneyNeeded: Int
            moneyNeeded = numberOfItemsToVend * itemPrice - deposited
            
            throw VendingMachineError.insufficientFunds(moneyNeeded: moneyNeeded)
        }
        
        // 구매하려는 수량보다 요구하는 수량이 많으면 오류를 던진다.
        guard itemCount >= numberOfItemsToVend else {
            throw VendingMachineError.outOfStock
        }
        
        // 오류가 없으면 정상처리
        let totalPrice = numberOfItemsToVend * itemPrice
        
        self.deposited -= totalPrice
        self.itemCount -= numberOfItemsToVend
        
        return "\(numberOfItemsToVend)개 제공함"
    }
}

// 자판기 인스턴스
let machine: VendingMachine = VendingMachine()

// 판매 결과를 전달받을 변수
var result: String?
```



### 오류 처리

- 오류를 던질 수도 있지만 던져진 오류를 판단해 어떤 동작을 하게 할 것인지 결정하는 코드도 작성해야 한다. 
- 오류 발생의 여지가 있는 `throws` 함수(메서드)는 `try`를 사용해 호출해야한다.

**do - catch**

- 오류발생의 여지가 있는 `throws` 함수(메서드)는 `do-catch` 구문을 활용하여 오류발생에 대비한다.

```swift
do {
    try machine.receiveMoney(0)
} catch VendingMachineError.invalidInput {
    print("입력이 잘못되었습니다")
} catch VendingMachineError.insufficientFunds(let moneyNeeded) {
    print("\(moneyNeeded)원이 부족합니다")
} catch VendingMachineError.outOfStock {
    print("수량이 부족합니다")
} // 입력이 잘못되었습니다

//catch 블럭을 하나만 사용해 switch 구문을 사용해서 오류를 나눠주는 방법도 있다.

//케이스별로 나눌 필요가 없을 경우에는 아래와 같이 간략화할 수 있다.
//또는 오류처리를 할 필요가 없으면 do 문만 사용해도 된다.
do {
    result = try machine.vend(numberOfItems: 4)
} catch {
    print(error)
} // insufficientFunds(100)﻿
```



**try? / try!**

1. try?

   별도 오류처리 결과를 받지 않고 오류가 발생했으면 결과값을 nil로 받을 수 있다.

   ```Swift
   result = try? machine.vend(numberOfItems: 2)
   result // Optional("2개 제공함")
   
   result = try? machine.vend(numberOfItems: 2)
   result // nil
   ```

   

2. try!

   오류가 발생하지 않는다고 확신을 가질 때 try!를 사용하면 정상동작 후 바로 결과값을 받는다. 하지만 오류 발생시 런타임 오류가 발생