# First Grep

## Overview
- **100 points**
- **General Skills**
- **Author: Alex Fulton/Danny Tunitis**

## Description
Can you find the flag in [**file**]([url](https://github.com/meezlung/picoCTF/blob/main/picoGym/General%20Skills/0.13%20First%20Grep/file))? This would be really tedious to look through manually, something tells me there is a better way.

## Approach
Same approach as we did in **0.11 strings.it**. Use grep in the terminal
```
$ strings file | grep "{"
picoCTF{grep_is_good_to_find_things_5af9d829}
```

Flag:
```
picoCTF{grep_is_good_to_find_things_5af9d829}
```
