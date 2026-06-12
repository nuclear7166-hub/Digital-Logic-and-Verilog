# Project 16 - Serial In Serial Out Register

## Overview

SISO(Serial In Serial Out) Register를 설계하여 데이터를 직렬 방식으로 입력받고 직렬 방식으로 출력하는 구조를 학습한 프로젝트입니다.

직렬 통신 시스템에서 데이터 전송의 기본 원리를 이해하기 위해 구현하였습니다.

---

## Objective

- 직렬 데이터 처리 방식 이해
- Shift Register 동작 학습
- Serial Communication 기초 개념 습득

---

## Key Concepts

### SISO Structure

```text
Serial Input
      │
      ▼
+--------------+
| Shift Register |
+--------------+
      │
      ▼
Serial Output
```

### Serial Transfer

클록 신호마다 데이터가 한 비트씩 이동합니다.

---

## Learning Points

- Serial Data Processing
- Shift Operation
- Sequential Logic Design
- Clock Synchronization

---

## Skills Acquired

- SISO Register Design
- Shift Register Implementation
- FPGA RTL Coding
- Testbench Verification
