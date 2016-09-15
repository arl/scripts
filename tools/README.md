# Bash useful tools

This file aims to list some *bash* tools useful for a specific task


## CSV

### csvtool

description: tool for performing manipulations on CSV files from shell scripts
example:

```bash
csvtool readable myfile.csv
```

## CPU Power management

Enable or disable the CPU frequency scaling (`powersave` or `performance`):

```bash
for i in /sys/devices/system/cpu/cpu[0-7]
do
    echo performance > $i/cpufreq/scaling_governor
done
```

