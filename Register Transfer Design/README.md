# Project 9 - Register Transfer Design

## Overview

Register Transfer Level(RTL) 설계 개념을 학습하기 위한 프로젝트입니다.

디지털 시스템에서 데이터가 레지스터 간에 어떻게 이동하는지 이해하고, 클록(Clock)에 동기화된 데이터 저장 방식을 학습하였습니다.

---

## Objective

- RTL(Register Transfer Level) 개념 이해
- 클록 기반 데이터 저장 학습
- 동기식 회로 설계 방법 습득

---

## Key Concepts

### Register

레지스터는 클록 신호에 맞추어 데이터를 저장하는 순차논리회로입니다.

```text
D ----> Register ----> Q
            ↑
          Clock
```

### Register Transfer

```text
Register A → Register B
```

형태의 데이터 이동을 구현합니다.

---

## Learning Points

- Sequential Logic 설계
- Clock Edge Trigger 이해
- RTL Coding Style
- Non-blocking Assignment(`<=`) 활용

---

## Skills Acquired

- RTL Design
- Register Design
- Synchronous Logic Design
- Testbench Verification
