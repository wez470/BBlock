package bblock

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go -target "bpfel" router c/bblock.c -- -O2 -g -Wall -Werror
