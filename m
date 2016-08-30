Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:36576 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757886AbcH3Msy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 08:48:54 -0400
Received: by mail-it0-f43.google.com with SMTP id e63so160761099ith.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2016 05:48:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57C56FAA.7090407@tataelxsi.co.in>
References: <57C56FAA.7090407@tataelxsi.co.in>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Aug 2016 14:48:52 +0200
Message-ID: <CAMuHMdUj5cxfZknvdNGRjYHSeTMKVRne4QULw=vtzJZUOvP=sA@mail.gmail.com>
Subject: Re: R-Car E2 Can interface receive issue
To: Roopesh K P <roopeshkp@tataelxsi.co.in>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 30, 2016 at 1:36 PM, Roopesh K P <roopeshkp@tataelxsi.co.in> wrote:
> I'm trying to use native (real hardware) interfaces like can0 in R-CAR E2
> based board (RTP0RC7794SEB00011S - ALT board). I am able to configure the
> CAN interfaces (can0 and can1). While testing, CAN driver seems to be able
> to send the CAN packets but not able to receive CAN packets from bus. Please
> help me to fix this issue.
>
> I had made the following changes.
>
> 1) Built the AGL kernel (3.10.31-ltsi) with CAN (SOCKET CAN) support by
> changing the configuration using menuconfig utility.
> 2) Added can0 and can1 pins details at the end of 'pfc' block in
> r8a7794-silk.dts file. Also added can0 and can1 block in the same file.
> 3) Modified the r8a7794.dtsi file and add can0 and can1 interface support.
> Also modified 'mstp9_clks' section to add can0 and can1 clock.
> 4) Added 'R8A7794_CLK_RCAN1' and 'R8A7794_CLK_RCAN0' clocks macros in
> 'includes/dt-bindings/clock/r8a7794-clock.h' file
> 5) Added R-CAR E2 in compatibility list in 'drivers/net/can/rcar_can.c' file

At first sight, all of these look OK.

> After booting 'dmesg | grep -i can' shows
>     pinmux core: sh-pfc does not support function can0
>     sh-pfc e6060000.pfc: invalid function can0 in map table
>     pinmux core: sh-pfc does not support function can1
>     sh-pfc e6060000.pfc: invalid function can1 in map table

The pfc-r8a7794.c driver lacks support for CAN functions.

> 1) I couldn't see r8a7794 in the CAN compatibility list. R-CAR CAN driver is
> able to supports R-CAR E2 CAN interface ?

I assume it can, but no one has added the compatible value to the driver yet.

> 2) Is there any additional modifications are needed in any of the driver
> source like pfc for supporting receive functionality (Rx)?
> 3) Is there any errors in the modifications I have done ?  Showing the
> following warnings/error while booting
>        a) pinmux core: sh-pfc does not support function can0
>        b) sh-pfc e6060000.pfc: invalid function can0 in map table

Indeed, CAN support should be added to the pfc-r8a7794.c driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
