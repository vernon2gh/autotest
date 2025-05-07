## autotest

### Brief introduction

This is a simple auto test framework for test diffrent linux kernel version,
based on Ubuntu, allows you to freely set what you want to test.

### Usage

On the first run of this project, run `config.sh` auto-configure the environment

When you want to start testing, you need to configure two files.

* `kernelversion` : the different kernel versions that need to be tested,
                  obtained by `uname -r`
* `test.sh`       : what you want to test

After the above two files are configured, you can directly `reboot`, no action
is required later

When the test is completed, the `FINISHED` file will be generated in the current
directory.
