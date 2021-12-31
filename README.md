# alphagorithm
알고리즘 문제 풀어보자ㅇㅅㅇ
- 참고 블로그 : https://covenant.tistory.com/224

## Syntactic sugar 문법적 설탕

### 입력
- 입력은 `readLine()` 함수를 이용한다. `readLine()`은 `String?` 타입을 리턴한다.

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
- 참고: https://hyerios.tistory.com/71