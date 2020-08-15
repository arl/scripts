# Convert from slice to array

Unless [#395](https://github.com/golang/go/issues/395) is implemented, this
requires unsafe:

    b = []byte{ ... }
    a := (*[10]byte)(unsafe.Pointer(&b[0]))
