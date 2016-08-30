Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-sg2apc01on0138.outbound.protection.outlook.com ([104.47.125.138]:64378
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1758289AbcH3MJl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 08:09:41 -0400
Message-ID: <57C56FAA.7090407@tataelxsi.co.in>
Date: Tue, 30 Aug 2016 17:06:10 +0530
From: Roopesh K P <roopeshkp@tataelxsi.co.in>
MIME-Version: 1.0
To: <linux-renesas-soc@vger.kernel.org>
Subject: R-Car E2 Can interface receive issue
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


I'm trying to use native (real hardware) interfaces like can0 in R-CAR 
E2 based board (RTP0RC7794SEB00011S - ALT board). I am able to configure 
the CAN interfaces (can0 and can1). While testing, CAN driver seems to 
be able to send the CAN packets but not able to receive CAN packets from 
bus. Please help me to fix this issue.

I had made the following changes.

1) Built the AGL kernel (3.10.31-ltsi) with CAN (SOCKET CAN) support by 
changing the configuration using menuconfig utility.

     a) CONFIG_CAN=y
     b) CONFIG_CAN_RAW=y
     c) CONFIG_CAN_BCM=y
     d) CONFIG_CAN_GW=y
     e) CONFIG_CAN_VCAN=y
     f) CONFIG_CAN_SLCAN=y
     g) CONFIG_CAN_DEV=y
     h) CONFIG_CAN_CALC_BITTIMING=y
     i) CONFIG_CAN_RCAR=y

2) Added can0 and can1 pins details at the end of 'pfc' block in 
r8a7794-silk.dts file. Also added can0 and can1 block in the same file.

     ### Adding CAN pin details in pfc ###
     &pfc {
         pinctrl-0 = <&du_pins &du0_pins &du1_pins &usb0_pins &usb1_pins 
&sound_pins &sound_clk_pins
                  &vin0_pins &can0_pins &can1_pins>;
         pinctrl-names = "default";

         ...

         can0_pins: can0 {
             renesas,groups = "can0_data_b";
             renesas,function = "can0";
         };

         can1_pins: can1 {
             renesas,groups = "can1_data_b";
             renesas,function = "can1";
         };
     };

     ### Adding can0 and can1 block ###
     &can0 {
         pinctrl-0 = <&can0_pins>;
         pinctrl-names = "default";
         renesas,can-clock-select = <0x0>;
         status = "okay";
     };

     &can1 {
         pinctrl-0 = <&can1_pins>;
         pinctrl-names = "default";
         renesas,can-clock-select = <0x0>;
         status = "okay";
     };

3) Modified the r8a7794.dtsi file and add can0 and can1 interface 
support. Also modified 'mstp9_clks' section to add can0 and can1 clock.

     ### Adding  can0 and can1 interface support ###
     can0: can@e6e80000 {
         compatible = "renesas,can-r8a7794";
         reg = <0 0xe6e80000 0 0x1000>;
         interrupts = <0 186 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&mstp9_clks R8A7794_CLK_RCAN0>;
         clock-names = "clkp1", "clkp2", "can_clk";
         status = "okay";
     };

     can1: can@e6e88000 {
         compatible = "renesas,can-r8a7794";
         reg = <0 0xe6e88000 0 0x1000>;
         interrupts = <0 187 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&mstp9_clks R8A7794_CLK_RCAN1>;
         clock-names = "clkp1", "clkp2", "can_clk";
         status = "okay";
     };

     ### Adding CAN Clock settings in mstp9_clks ###
     mstp9_clks: mstp9_clks@e6150994 {
                 compatible = "renesas,r8a7794-mstp-clocks", 
"renesas,cpg-mstp-clocks";
                 reg = <0 0xe6150994 0 4>, <0 0xe61509a4 0 4>;
                 clocks = <&cp_clk>, <&cp_clk>, <&cp_clk>,
                          <&cp_clk>, <&cp_clk>, <&cp_clk>,
                          <&cp_clk>, <&p_clk>, <&p_clk>,
                          <&cpg_clocks R8A7794_CLK_QSPI>, <&hp_clk>,
                          <&hp_clk>, <&hp_clk>, <&hp_clk>,
                          <&hp_clk>, <&hp_clk>;
                 #clock-cells = <1>;
                 renesas,clock-indices = <
                         R8A7794_CLK_GPIO6 R8A7794_CLK_GPIO5 
R8A7794_CLK_GPIO4
                         R8A7794_CLK_GPIO3 R8A7794_CLK_GPIO2 
R8A7794_CLK_GPIO1
                         R8A7794_CLK_GPIO0 R8A7794_CLK_RCAN1 
R8A7794_CLK_RCAN0
                         R8A7794_CLK_QSPI_MOD R8A7794_CLK_I2C5 
R8A7794_CLK_I2C4
                         R8A7794_CLK_I2C3 R8A7794_CLK_I2C2 R8A7794_CLK_I2C1
                         R8A7794_CLK_I2C0
                 >;
                 clock-output-names =
                         "gpio7", "gpio6", "gpio5", "gpio4", "gpio3", 
"gpio2", "gpio1", "gpio0",
                         "rcan1", "rcan0","qspi_mod", "i2c5", "i2c4", 
"i2c3", "i2c2",
                         "i2c1", "i2c0";
             };

4) Added 'R8A7794_CLK_RCAN1' and 'R8A7794_CLK_RCAN0' clocks macros in 
'includes/dt-bindings/clock/r8a7794-clock.h' file

     /* MSTP9 */
     ...
     #define R8A7794_CLK_RCAN1       15
     #define R8A7794_CLK_RCAN0       16
     ...

5) Added R-CAR E2 in compatibility list in 'drivers/net/can/rcar_can.c' 
file

     static const struct of_device_id rcar_can_of_table[] __maybe_unused = {
         ...
         { .compatible = "renesas,can-r8a7794" },
         { }
     };

6) Cross-compiled the iproute2 and can-utils utilities for testing.

###################################################################################################

After booting 'dmesg | grep -i can' shows
     pinmux core: sh-pfc does not support function can0
     sh-pfc e6060000.pfc: invalid function can0 in map table
     pinmux core: sh-pfc does not support function can1
     sh-pfc e6060000.pfc: invalid function can1 in map table
     vcan: Virtual CAN interface driver
     slcan: serial line CAN interface driver
     slcan: 10 dynamic interface channels.
     CAN device driver interface
     pinmux core: sh-pfc does not support function can0
     sh-pfc e6060000.pfc: invalid function can0 in map table
     rcar_can e6e80000.can: device registered (reg_base=e78d4000, irq=218)
     pinmux core: sh-pfc does not support function can1
     sh-pfc e6060000.pfc: invalid function can1 in map table
     rcar_can e6e88000.can: device registered (reg_base=e78d6000, irq=219)
     can: controller area network core (rev 20120528 abi 9)
     can: raw protocol (rev 20120528)
     can: broadcast manager protocol (rev 20120528 t)
     can: netlink gateway (rev 20130117) max_hops=1

After running the command './ip link set can0 type can bitrate 125000 && 
ifconfig can0 up' , then interface 'can0' can be listed with ifconfig 
command

     ifconfig
     can0      Link encap:UNSPEC  HWaddr 
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
               UP RUNNING NOARP  MTU:16  Metric:1
               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
               collisions:0 txqueuelen:10
               RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
               Interrupt:218

cat /proc/net/can/version shows
     rev 20120528 abi 9

cat /proc/net/can/stats  initially shows

     0 transmitted frames (TXF)
     0 received frames (RXF)
     0 matched frames (RXMF)

     0 % total match ratio (RXMR)
     0 frames/s total tx rate (TXR)
     0 frames/s total rx rate (RXR)

     0 % current match ratio (CRXMR)
     0 frames/s current tx rate (CTXR)
     0 frames/s current rx rate (CRXR)

     0 % max match ratio (MRXMR)
     0 frames/s max tx rate (MTXR)
     0 frames/s max rx rate (MRXR)

     0 current receive list entries (CRCV)
     0 maximum receive list entries (MRCV)

After sending packet with './cansend can0 5A1#11.22', then  'cat 
/proc/net/can/stats' shows

     1 transmitted frames (TXF)
     0 received frames (RXF)
     0 matched frames (RXMF)

     0 % total match ratio (RXMR)
     0 frames/s total tx rate (TXR)
     0 frames/s total rx rate (RXR)

     0 % current match ratio (CRXMR)
     0 frames/s current tx rate (CTXR)
     0 frames/s current rx rate (CRXR)

     0 % max match ratio (MRXMR)
     1 frames/s max tx rate (MTXR)
     0 frames/s max rx rate (MRXR)

     0 current receive list entries (CRCV)
     0 maximum receive list entries (MRCV)

Then I ran ./candump can0 & (in background) and then tried to send 
packet to can0 using ./cansend can0 5A1#11.22 command, but unable to 
receive the packets. 'cat /proc/net/can/stats' shows

     2 transmitted frames (TXF)
     0 received frames (RXF)
     0 matched frames (RXMF)

     0 % total match ratio (RXMR)
     0 frames/s total tx rate (TXR)
     0 frames/s total rx rate (RXR)

     0 % current match ratio (CRXMR)
     0 frames/s current tx rate (CTXR)
     0 frames/s current rx rate (CRXR)

     0 % max match ratio (MRXMR)
     1 frames/s max tx rate (MTXR)
     0 frames/s max rx rate (MRXR)

     1 current receive list entries (CRCV)
     1 maximum receive list entries (MRCV)


I put printk messages in the start of all the functions written in 
'rcar_can.c' for debugging purpose, only the following functions are 
called during the operations.

     a) rcar_can_probe            --> <called @ boot time >
     b) rcar_can_get_berr_counter --> <called several times >
     c) rcar_can_open             --> <called @ifconfig canx up>
     d) rcar_can_start            --> <called @ifconfig canx up>
     e) rcar_can_set_bittiming    --> <called @ifconfig canx up>
     f) rcar_can_start_xmit       --> <called @ cansend >

My questions are

1) I couldn't see r8a7794 in the CAN compatibility list. R-CAR CAN 
driver is able to supports R-CAR E2 CAN interface ?
2) Is there any additional modifications are needed in any of the driver 
source like pfc for supporting receive functionality (Rx)?
3) Is there any errors in the modifications I have done ?  Showing the 
following warnings/error while booting
        a) pinmux core: sh-pfc does not support function can0
        b) sh-pfc e6060000.pfc: invalid function can0 in map table

4) Is there any working patches available for CAN support in R-CAR E2 
based board (Alt/Silk) ?
5) Is there any external hardware devices are required for testing ?
6) Is there any hardware settings (like jumper) need to be done in board ?

Regards,
RKP
