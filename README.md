# alphagorithm
알고리즘 문제 풀어보자ㅇㅅㅇ
- 참고 블로그 : https://covenant.tistory.com/224

## Syntactic sugar 문법적 설탕

### import Foundation
웬만하면 `import Foundation` 해야 한다. 다양한 자료구조의 유용한 메서드가 Foundation 프레임워크에 정의되어 있고, 웬만한 코테에서는 Foundation 프레임워크는 허용한다.

### 입력
- 입력은 `readLine()` 함수를 이용한다. `readLine()`은 `String?` 타입을 리턴한다. 그러므로 `readLine()!`을 사용하자.
- 문자열을 `Int` 타입으로 바꾸는 `Int()` 생성자는 `Int?` 타입을 리턴한다.

### 문자열 순회
- `String` 타입을 for 문으로 순회할 수 있다. 이 때, 순회하는 타입은 `Character` 타입이다.
- 예시 
    ```swift
    for i in "abcde" {
        print(i)
        // i 의 타입은 Character형
    }
    // a b c d e 차례로 한 줄 씩 출력
    ```

### 배열
- array의 마지막 인덱스 요소는 `array[-1]`이 아닌, `array.last!` 로 참조해야 한다.

- [Int] 형 배열의 모든 요소를 더한 값을 구하려면 `reduce` 메서드를 사용하자.

- 배열 초기화 시 유용한 생성자:
    - `Array(repeating: 각 요소들, count: 배열의 크기)`
    - 위와 같이 선언 시 반복할 데이터와 횟수를 지정하여 배열을 생성 가능하다.

- `popLast()` vs `removeLast()`
    - 배열이 비어있을 때 `popLast` 는 nil 리턴
    - `removeLast`는 크래시 발생시킨다.

### 출력
- 출력은 문자열 보간을 유용하게 사용하자. 
- 예시 `print("\(dp[order][0]) \(dp[order][1])")`

### 강제 언래핑
- 일반적으로는 지양하지만, 스위프트를 사용한 알고리즘 풀이 시, 강제 언래핑을 적극적으로 사용하여 코드양을 줄이자.
- 예시
    ```swift
    let N = Int(readLine()!)!
    ```

### 공백 쪼개기
- 공백 단위로 문자열을 쪼개는 방법은 `.split(separator:)` 이나 `.components(separatedBy:)` 메서드를 사용하는 법이 있다.
    - `split`은 스위프트 표준 라이브러리에 포함되어 바로 사용할 수 있다.
    - `components`은 `Foundation`을 임포트 시켜야 한다.
    - `split`은 `[Substring]`타입을 리턴한다.
    - `components`은 `[String]` 타입을 리턴한다.
> 참고: https://velog.io/@minni/Swift-split-VS-components

### indices
- 컬렉션 자료구조에서 사용할 수 있는 프로퍼티
- indices 프로퍼티는 컬렉션 자신에 대한 강한 참조를 리턴
- [Self.Index]의 배열을 반환한다.
- 예시
    ```swift
    var c = MyFancyCollection([10, 20, 30, 40, 50])
    var i = c.startIndex
    while i != c.endIndex {
        c[i] /= 5
        i = c.index(after: i)
    }
// c == MyFancyCollection([2, 4, 6, 8, 10])
    ```

> https://developer.apple.com/documentation/swift/collection/1641719-indices


### stride

- 예시
    ```swift
    for i in stride(from: 5 , to: 0, by: -1) {
        print(i)
    }
    // 5 4 3 2 1 차례로 출력

    for i in stride(from: 5 , through: 0, by: -1) {
        print(i)
    }
    // 5 4 3 2 1 0 차례로 출력
    ```
- Python의 range객체 같은 역할로 이해하자.
- 파라미터 from: 시작점, to: 종점, by: 보폭
- 주의할 점은 to에 지정한 범위는 포함되지 않고 그 이전 보폭까지 고려된다. 이도 파이썬의 range객체와 같다.
- 이에 반해 through는 지정한 범위를 포함한다.

### 공백 포함된 문자열을 Int 배열로 변환할 때는 String 형변환을 거치자
- 배열 내부 각 요소의 타입을 map(_:)과 Int의 이니셜라이저를 통해 Int 타입으로 변환할 때 String.SubSequence -> Int 보다 String.SubSequence -> String -> Int의 수행속도가 더 빠르다
```swift
let numbers: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }
```
- 참고: 백준 10818 문제, https://velog.io/@ryan-son/Swift-10818-%EC%B5%9C%EC%86%8C-%EC%B5%9C%EB%8C%80-%EB%B0%B1%EC%A4%80-B3

### joined
- 배열에 들어있는 여러 원소들을 하나로 묶고 싶은 경우 사용
- Swift 표준 라이브러리에 포함
```swift
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let list = cast.joined(separator: ", ")
print(list)
// "Vivien, Marlon, Kim, Karl" 출력
```

- 또한 joined(separator:) 메소드는 또한 배열의 시퀀스들을 하나의 배열로 연결한 값을 반환할 수도 있다.
```swift
let nestedNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let joined = nestedNumbers.joined(separator: [-1, -2])
print(Array(joined))
// "[1, 2, 3, -1, -2, 4, 5, 6, -1, -2, 7, 8, 9]" 출력
```
- 참고: https://medium.com/@sunghyun_k/swift-joined-4fcc49098bd0

### sort, sorted
- sort는 제자리 정렬, sorted는 정렬된 요소를 새로이 반환함
- 각 요소가 Comparable 프로토콜을 따라야 함
- 디폴트는 오름차순, 내림차순은 sort(by: >), sorted(by: >)로 작성할 것
```swift
var arr = [3, 35, 5, 32, 1]
arr.sort() // [1, 3, 5, 32, 35]

let sortedArr = arr.sorted() // [1, 3, 5, 32, 35]
```
- 파이썬 과는 달리 둘다 배열의 메서드라는 점을 유의
- 참고: https://hyerios.tistory.com/71

### 문자열 뽀개기
- 문자열 길이: `.count`
- 문자열 내 substring을 구하기 위해서는 subscript에 Int값 대신 `Index` 객체를 통해 구해야 한다.
- `Index` 객체 생성하는 법: `문자열.index(startIndex or endIndex, offsetBy: 몇번째 오프셋 인지 지정)`
    - 예시
    ```swift
    let strTest = "안녕하십니까"
    let strRange = strTest.index(strTest.startIndex, offsetBy: 2) ... strTest.index(strTest.endIndex, offsetBy: -2)
    print(strTest[strRange]) // 하십니까

    let strRange2 = strTest.index(strTest.startIndex, offsetBy: 2) ..< strTest.index(strTest.endIndex, offsetBy: -2)
    print(strTest[strRange2]) // 하십니
    ```
- 첫번째 문자의 위치 : `문자열.startIndex`
- 마지막 문자 뒤의 위치 : `문자열.endIndex`
    - 예시
    ```swift
    var subFirst = strTest[strTest.startIndex] // 안
    var subLast = strTest[strTest.index(before: strTest.endIndex)] // ?
    ```
- 문자열 내 substring 삭제: `removeSubrange[substring range]`

- 문자열의 시작부분이 일치하는지: `hasPrefix("~~")`
- 문자열의 끝부분이 일치하는지: `hasSuffix("~~")`

- 문자열 대문자 변환: `uppercased()`
- 문자열 소문자 변환: `lowercased()`