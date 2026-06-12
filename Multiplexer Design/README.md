# Project 1 - Multiplexer Design

## Overview

Verilog HDL을 이용하여 4:1 Multiplexer를 설계하고 다양한 모델링 방법을 학습한 프로젝트입니다.

## Objective

* Multiplexer 동작 원리 이해
* Verilog HDL 기본 문법 학습
* Gate-Level, Dataflow, Behavioral Modeling 비교

## Files

| File            | Description                            |
| --------------- | -------------------------------        |
| MUX.v           | Behavioral 방식으로 구현한 Multiplexer |
| MUX_dataflow.v  | Dataflow Modeling 방식 구현            |
| MUX_gatelevel.v | Gate-Level Modeling 방식 구현          |
| tb_MUX.v        | Testbench                              |

## Learning Points

### Gate-Level Modeling

기본 논리게이트(and, or, not)를 이용하여 회로를 직접 구현

### Dataflow Modeling

assign 문을 이용한 RTL 설계

### Behavioral Modeling

always 블록을 이용한 동작 중심 설계

## Simulation Result

* Select 신호에 따라 입력이 정상적으로 출력됨
* 세 가지 모델링 방식이 동일한 기능 수행

## Skills Acquired

* Verilog Module 설계
* 조합논리회로 구현
* Testbench 작성
* Vivado 시뮬레이션
