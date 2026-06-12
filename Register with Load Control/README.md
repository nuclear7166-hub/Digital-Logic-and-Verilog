# Project 14 - Register with Load Control

## Overview

Load Enable 신호를 이용하여 데이터를 선택적으로 저장할 수 있는 Register를 설계한 프로젝트입니다.

---

## Objective

- Enable 신호 기반 제어 학습
- 조건부 데이터 저장 구현
- 제어 논리 설계

---

## Key Concepts

### Load Signal

```text
LOAD = 1
→ 데이터 저장

LOAD = 0
→ 현재 데이터 유지
```

### Register Control

```text
Clock
  │
  ▼
Load Enable
  │
  ▼
Register
```

---

## Learning Points

- Enable Logic
- Conditional Storage
- Register Control

---

## Skills Acquired

- Controlled Register Design
- Sequential Logic Design
- FPGA Verification
