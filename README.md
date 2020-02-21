csv-conv
========

This is a sed script that will take a csv file that is roughly adherent to RFC
4180, and convert it to a file with fields delimited by the ASCII field
seperator binary (\x1f). So, for example:
```
echo '"some, ""quoted"" text",a second data field' | ./conv.sed | xxd
```
will give you:
```
00000000: 736f 6d65 2c20 2271 756f 7465 6422 2074  some, "quoted" t
00000010: 6578 741f 6120 7365 636f 6e64 2064 6174  ext.a second dat
00000020: 6120 6669 656c 640a                      a field.
```

It will also auto convert from DOS file formats (\r\n as EOL) to unix.
