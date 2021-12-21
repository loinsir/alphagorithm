# alphagorithm
알고리즘 문제 풀어보자ㅇㅅㅇ

## Syntactic sugar 문법적 설탕

### stride

- 예시
    ```swift
    for i in stride(from: 5 , to: 0, by: -1) {
        print(i)
    }
    // 5,4,3,2,1
    ```

- Python의 range객체 같은 역할로 이해.
- 파라미터 from: 시작점, to: 종점, by: 보폭
- 주의할 점은 to에 지정한 범위는 포함되지 않고 그 이전 보폭까지 고려된다. 이도 파이썬의 range객체와 같다.