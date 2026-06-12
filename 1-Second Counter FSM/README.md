# Project 21 - 1-Second Counter FSM

## Overview

FPGA의 고속 시스템 클록을 이용하여 1초 주기의 Counter와 FSM을 구현한 프로젝트입니다.

---

## Objective

- Clock Divider 구현
- FSM 기반 제어 학습
- 시간 기반 시스템 설계

---

## System Architecture

```text
100MHz Clock
      │
      ▼
Clock Divider
      │
      ▼
 1Hz Clock
      │
      ▼
 Counter FSM
```

---

## Key Concepts

### Clock Divider

고속 클록을 저속 클록으로 분주

### FSM Control

상태 기반 동작 구현

---

## Learning Points

- Timing Design
- Clock Management
- FSM Design

---

## Skills Acquired

- Clock Divider Design
- FSM Implementation
- FPGA Timing Analysis
