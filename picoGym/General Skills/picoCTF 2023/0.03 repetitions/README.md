# repetitions

## Overview
- **100 points**
- **General Skills**
- **Author: Theoneste Byagutangaza**

## Description
Can you make sense of this file? Download the **file** (enc_flag) here.

## Approach
This challenge is my personal fave. I used openssl to decode the **'enc_flag'** file into an output file called **'dec_flag.txt'**. The first output didn't make sense, but since as the challenge's title says, I repeatedly ran openssl in the terminal until it made sense.
```
$ echo "VmpGU1EyRXlUWGxTYmxKVVYwZFNWbGxyV21GV1JteDBUbFpPYWxKdFVsaFpWVlUxWVZaS1ZWWnVhRmRXZWtab1dWWmtSMk5yTlZWWApiVVpUVm10d1VWZFdVa2RpYlZaWFZtNVdVZ3BpU0VKeldWUkNkMlZXVlhoWGJYQk9VbFJXU0ZkcVRuTldaM0JZVWpGS2VWWkdaSGRXCk1sWnpWV3hhVm1KRk5XOVVWVkpEVGxaYVdFMVhSbHBWV0VKVVZGWm9RMlZzV2tWUmJFNVNDbUpXV25wWmExSmhWMGRHZEdWRlZsaGkKYlRrelZERldUMkpzUWxWTlJYTkxDZz09Cg==" | base64 -d > dec_flag.txt
$ cat dec_flag.txt
VjFSQ2EyTXlSblJUV0dSVllrWmFWRmx0TlZOalJtUlhZVVU1YVZKVVZuaFdWekZoWVZkR2NrNVVX
bUZTVmtwUVdWUkdibVZXVm5WUgpiSEJzWVRCd2VWVXhXbXBOUlRWSFdqTnNWZ3BYUjFKeVZGZHdW
MlZzVWxaVmJFNW9UVVJDTlZaWE1XRlpVWEJUVFZoQ2VsWkVRbE5SCmJWWnpZa1JhV0dGdGVFVlhi
bTkzVDFWT2JsQlVNRXNLCg==
$ openssl enc -d -base64 -in dec_flag.txt -out dec_flag1.txt
$ cat dec_flag1.txt
V1RCa2MyRnRTWGRVYkZaVFltNVNjRmRXYUU5aVJUVnhWVzFhYVdGck5UWmFSVkpQWVRGbmVWVnVR
bHBsYTBweVUxWmpNRTVHWjNsVgpXR1JyVFdwV2VsUlZVbE5oTURCNVZXMWFZUXBTTVhCelZEQlNR
bVZzYkRaWGFteEVXbm93T1VOblBUMEsK
$ cat dec_flag2.txt
WTBkc2FtSXdUbFZTYm5ScFdWaE9iRTVxVW1aaWFrNTZaRVJPYTFneVVuQlpla0pyU1ZjME5GZ3lV
WGRrTWpWelRVUlNhMDB5VW1aYQpSMXBzVDBSQmVsbDZXamxEWnowOUNnPT0K
$ openssl enc -d -base64 -in dec_flag2.txt -out dec_flag3.txt
$ cat dec_flag3.txt
Y0dsamIwTlVSbnRpWVhObE5qUmZiak56ZEROa1gyUnBZekJrSVc0NFgyUXdkMjVzTURSa00yUmZa
R1psT0RBell6WjlDZz09Cg==
$ openssl enc -d -base64 -in dec_flag3.txt -out dec_flag4.txt
$ cat dec_flag4.txt
cGljb0NURntiYXNlNjRfbjNzdDNkX2RpYzBkIW44X2Qwd25sMDRkM2RfZGZlODAzYzZ9Cg==
$ openssl enc -d -base64 -in dec_flag4.txt -out dec_flag5.txt
$ cat dec_flag5.txt
picoCTF{base64_n3st3d_dic0d!n8_d0wnl04d3d_dfe803c6}
```

We arrived at the answer, but that was slightly physically tiring. Imagine if you needed to decode it 100 times. So, I also devised a new approach - make a bash script with incrementation to filenames (repetitions.sh). In this way, I don't have to decode and concatenate every single new file I make, rather it is automatically done by the script. 
```
#!/bin/bash

counter=0
number_of_tries=5

while [ $counter -lt $number_of_tries ]; do
    input_file="dec_flag$counter.txt"
    output_file="dec_flag$((counter+1)).txt"

    openssl enc -d -base64 -in "$input_file" -out "$output_file"
    echo "Contents of $output_file:"
    cat "$output_file"

    ((counter++))
done
```
Output:
```
$ chmod +x  repetitions.sh
$ ./repetitions.sh
Contents of dec_flag1.txt:
V1RCa2MyRnRTWGRVYkZaVFltNVNjRmRXYUU5aVJUVnhWVzFhYVdGck5UWmFSVkpQWVRGbmVWVnVR
bHBsYTBweVUxWmpNRTVHWjNsVgpXR1JyVFdwV2VsUlZVbE5oTURCNVZXMWFZUXBTTVhCelZEQlNR
bVZzYkRaWGFteEVXbm93T1VOblBUMEsK
Contents of dec_flag2.txt:
WTBkc2FtSXdUbFZTYm5ScFdWaE9iRTVxVW1aaWFrNTZaRVJPYTFneVVuQlpla0pyU1ZjME5GZ3lV
WGRrTWpWelRVUlNhMDB5VW1aYQpSMXBzVDBSQmVsbDZXamxEWnowOUNnPT0K
Contents of dec_flag3.txt:
Y0dsamIwTlVSbnRpWVhObE5qUmZiak56ZEROa1gyUnBZekJrSVc0NFgyUXdkMjVzTURSa00yUmZa
R1psT0RBell6WjlDZz09Cg==
Contents of dec_flag4.txt:
cGljb0NURntiYXNlNjRfbjNzdDNkX2RpYzBkIW44X2Qwd25sMDRkM2RfZGZlODAzYzZ9Cg==
Contents of dec_flag5.txt:
picoCTF{base64_n3st3d_dic0d!n8_d0wnl04d3d_dfe803c6}
```


Flag:
```
picoCTF{base64_n3st3d_dic0d!n8_d0wnl04d3d_dfe803c6}
```
