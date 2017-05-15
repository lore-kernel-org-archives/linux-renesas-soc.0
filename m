Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47905 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933397AbdEOOiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 10:38:01 -0400
Date: Mon, 15 May 2017 16:37:56 +0200
From: jmondi <jacopo@jmondi.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC v2 0/2] SH CEU camera driver
Message-ID: <20170515143756.GB22778@w540>
References: <1493282548-27673-1-git-send-email-jacopo@jmondi.org>
 <SG2PR06MB11655FA3940925B4139935598A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20170427161456.GK11761@w540>
 <SG2PR06MB116586C496F693ADAD6C4C418A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SG2PR06MB116586C496F693ADAD6C4C418A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Apr 27, 2017 at 06:03:27PM +0000, Chris Brandt wrote:
> Hi Jacopo,
>
> On Thursday, April 27, 2017, jmondi wrote:
> > We planned to use the following setup to test the CEU driver with an
> > actual HW platform
> >
> > GR-Peach + GR-Peach Audio Camera Shield + OV7670 evaluation module
> > https://www.digikey.com/product-detail/en/renesas-electronics-
> > america/YGRPEACHAUDIOCAMERASHIELD/YGRPEACHAUDIOCAMERASHIELD-ND/5800301
> > www.elecfreaks.com/estore/ov7670-camera-module.html
>
> Oh ya, I forgot about that thing.
>
>
> > This implies running mainline on Peach or backporting CEU driver to your
> > BSP if we're not able to do so. A desirable collateral benefit in both
> > cases, I guess...
>
> You should probably be able to run mainline on it.
>

I'm now trying to boot v4.11 (non-XIP) on GR-Peach.
I've been able to write u-boot from your BSP directly on the SPI
flash, and I'm now trying to use it to boot a kernel image from
on-chip SRAM.

I've spent quite some time on it without any appreciable result, so I
am now considering trying to make a XIP kernel out of mainline and
boot from QSPI.
I've seen you have applied  lot of patches for XIP support on top of
your v3.14 BSP, can you summarize what I need to apply on v4.11 to
have the same?

Also FYI, I am now trying to boot a uImage with device tree appended,
loaded on the on-chip RAM with J-Link to address 0x20500000, and
compiled with 20008000 [1] as load address (32Kb below on-chip RAM
address start)
This way I -should- be able to load my 3MB kernel image in RAM and
execute it from there.
I always get back a mute console unfortunately, so I'm starting to
wonder if I shouldn't go for a XIP kernel as well...

--------------------------------------------------------
=> bootm 0x20500000
## Booting kernel from Legacy Image at 20500000 ...
   Image Name:   Linux
   Created:      2017-05-15  14:29:05 UTC
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3009736 Bytes = 2.9 MiB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK

Starting kernel ...

--------------------------------------------------------

Thanks
  j

[1] I tried to use 0x20208000 as well, to avoid writing to memory
pages for data retention.

[2] I am using r7s72100-grpeach.dts from your BSP, with the following applied:

 	memory {
 		device_type = "memory";
-		reg = <0x08000000 0x02000000>;	/* 32MB @ 0x0x08000000 */
+		reg = <0x20000000 0x00A00000>;	/* 10Mb @ 0x0x20000000 */
 	};

[3] I have used uImage with appended DTB and uImage with separate dtb as well. No luck.

PS I have removed renesas list not to spam to everyone. If relevant, I will re-send and add them back.

> Go here for u-boot build instructions: http://elinux.org/RZ-A/Boards/GR-PEACH
>
> Remember, that board only has 8MB of SPI flash, so you should download uImage and DTB to RAM using Jlink, the use the SPI flash for a rootfs. I so have USB host working for mainline, but it requires an out-of-tree patch from me (I'm not sure on what upstream path I should take for RZ/A1 USB yet).
>
>
>
> Of course if you change your mind, this board:
>    https://www.digikey.com/product-detail/en/renesas-electronics-america/YLCDRZA1H/YLCDRZA1H-ND/6173788
> has a camera, 1280x800 LCD, 64MB of SDRAM and a Segger JLINK built into the board. But...no serial port. You have to plug in a USB-to-UART PMOD adapter (something like this http://store.digilentinc.com/pmod-usbuart-usb-to-uart-interface/).
> Once I get everything working, I'll be pushing to our github repos and posting instructions on eLinux.org.
> I might test your new driver using this board (will require an out-of-tree fbdev driver)
>
> I'm going to start phasing out the 3.14 BSP for a 4.9 BSP here in a couple months, so I'll probably backport this new driver to 4.9, but that's about it.
>
>
> Chris
>
