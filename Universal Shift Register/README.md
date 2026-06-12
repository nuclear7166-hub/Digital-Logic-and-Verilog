# Project 15 - Universal Shift Register

## Overview

Universal Shift Register를 설계하여 하나의 회로에서 다양한 데이터 이동 기능을 수행할 수 있도록 구현한 프로젝트입니다.

---

## Objective

- 다기능 Register 구조 이해
- Shift Register 응용 학습
- 제어 신호 기반 데이터 이동 구현

---

## Key Concepts

### Supported Operations

| Mode | Function |
|--------|--------|
| 00 | Hold |
| 01 | Shift Right |
| 10 | Shift Left |
| 11 | Parallel Load |

### Universal Register

```text
           +----------------+
Data ----->|                |
Mode ----->| Universal Shift|
Clock ---->|   Register     |
           +----------------+
```

---

## Learning Points

### Hold Mode

현재 상태 유지

### Shift Mode

직렬 데이터 이동

### Parallel Load

다중 비트 동시 저장

---

## Skills Acquired

- Universal Register Design
- Data Transfer Logic
- Sequential Circuit Design
- FPGA RTL Coding
