# Task 3 - Analyze the Firmware - (Emulation)

**Points: 200**

Leveraging that datasheet enabled you to provide the correct pins and values to properly communicate with the device over UART. Because of this we were able to communicate with the device console and initiate a filesystem dump.

To begin analysis, we loaded the firmware in an analysis tool. The kernel looks to be encrypted, but we found a second-stage bootloader that loads it. The decryption must be happening in this bootloader. There also appears to be a second UART, but we don't see any data coming from it.

Can you find the secret key it uses to decrypt the kernel?

Tips:

- You can emulate the loader using the provided QEMU docker container. One download provides the source to build your own. The other is a pre-built docker image. See the README.md from the source download for steps on running it.
- Device tree files can be compiled and decompiled with `dtc`.

## IMPORTANT

If you want to interact with this Task, you will first need to put the qemu image back together. I had to split it into multiple parts to upload it to GitHub. You can do this by running the following command:

```bash
cd 'Included Files'
cat part_* > cbc_qemu_aarch64-image.tar.gz
gunzip cbc_qemu_aarch64-image.tar.gz
```
