# alphagorithm
알고리즘 문제 풀어보자ㅇㅅㅇ

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