# Description
simple eBPF program that drops ICMP packets. It is written in C and uses the eBPF library and XDP to load the program into the kernel then outputs stats in the userspace program based on cilium-ebpf.

### Some details:

XDP allows for early packet interception at the network interface driver level.

The XDP eBPF program, implemented in C, hooks into the Linux kernel’s networking stack at an early stage to intercept packets and decide their fate.

The accompanying Golang application interacts with the XDP eBPF program, providing a user-friendly interface to monitor the packet drop behavior and visualize performance statistics.

######Read more details at the [admida0ui blog](https://admida0ui.tech/2023/08/11/ebpf/?fbclid=IwAR01AaWknOqWn-L8z-ji1PT05zQLs7g76hxEWUxM1-MTrIWcTnXnkPNup90).

### Prerequists:
Clang and LLVM:
```
sudo apt update
sudo apt install clang llvm
```

bpftool:
```
git clone --recurse-submodules https://github.com/libbpf/bpftool.git
cd src
make
sudo make install
```
Golang:
```
sudo apt install golang
```

### How to run:

Compile the XDP program using the following command:

```bash
clang -S \
    -g \
    -target bpf \
    -I../../libbpf/src\
    -Wall \
    -Werror \
    -O2 -emit-llvm -c -o dicmp_kern.ll dicmp_kern.c
```

Which will generate the LLVM IR file dicmp_kern.ll, then use the llc tool to compile the LLVM IR file to BPF bytecode, as follows:
```
llc -march=bpf -filetype=obj -O2 -o dicmp_kern.o dicmp_kern.ll
```

Run the userspace program:
```
go mod init dicmp
go mod tidy
CGO_ENABLED=0 go build . 
sudo ./dicmp

```