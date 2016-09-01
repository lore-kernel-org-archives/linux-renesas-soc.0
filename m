Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-hk2apc01on0118.outbound.protection.outlook.com ([104.47.124.118]:11364
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753027AbcIAMYg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 08:24:36 -0400
Message-ID: <57C81DF0.4040308@tataelxsi.co.in>
Date: Thu, 1 Sep 2016 17:54:16 +0530
From: Roopesh K P <roopeshkp@tataelxsi.co.in>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: R-Car E2 Can interface receive issue
References: <57C56FAA.7090407@tataelxsi.co.in> <CAMuHMdUj5cxfZknvdNGRjYHSeTMKVRne4QULw=vtzJZUOvP=sA@mail.gmail.com>
In-Reply-To: <CAMuHMdUj5cxfZknvdNGRjYHSeTMKVRne4QULw=vtzJZUOvP=sA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Geert Uytterhoeven,

Thank you very much for your support.

Today I tested the CAN with R-CAR M2 (Koelsch board) because r8a7791 is 
listed in CAN driver compatibility list .

' dmesg | grep -i can ' shows

vcan: Virtual CAN interface driver
slcan: serial line CAN interface driver
slcan: 10 dynamic interface channels.
CAN device driver interface
rcar_can e6e80000.can: device registered (reg_base=e78f2000, irq=218)
can: controller area network core (rev 20120528 abi 9)
can: raw protocol (rev 20120528)
can: broadcast manager protocol (rev 20120528 t)
can: netlink gateway (rev 20130117) max_hops=1

I can't see any pfc error/warning message which is happened in the case  
of R-CAR E2 (ALT board),  but couldn't get the expected result in R-CAR 
M2 Koelsch board also.

For testing purpose , I checked the result of Virtual CAN (vcan) , it is 
working fine.

Then my question is ,

Is it not possible to test native (real hardware) CAN interface like 
can0 in Koelsch or ALT board ?

Regards
RKP

On 8/30/2016 6:18 PM, Geert Uytterhoeven wrote:
> On Tue, Aug 30, 2016 at 1:36 PM, Roopesh K P <roopeshkp@tataelxsi.co.in> wrote:
>> I'm trying to use native (real hardware) interfaces like can0 in R-CAR E2
>> based board (RTP0RC7794SEB00011S - ALT board). I am able to configure the
>> CAN interfaces (can0 and can1). While testing, CAN driver seems to be able
>> to send the CAN packets but not able to receive CAN packets from bus. Please
>> help me to fix this issue.
>>
>> I had made the following changes.
>>
>> 1) Built the AGL kernel (3.10.31-ltsi) with CAN (SOCKET CAN) support by
>> changing the configuration using menuconfig utility.
>> 2) Added can0 and can1 pins details at the end of 'pfc' block in
>> r8a7794-silk.dts file. Also added can0 and can1 block in the same file.
>> 3) Modified the r8a7794.dtsi file and add can0 and can1 interface support.
>> Also modified 'mstp9_clks' section to add can0 and can1 clock.
>> 4) Added 'R8A7794_CLK_RCAN1' and 'R8A7794_CLK_RCAN0' clocks macros in
>> 'includes/dt-bindings/clock/r8a7794-clock.h' file
>> 5) Added R-CAR E2 in compatibility list in 'drivers/net/can/rcar_can.c' file
> At first sight, all of these look OK.
>
>> After booting 'dmesg | grep -i can' shows
>>      pinmux core: sh-pfc does not support function can0
>>      sh-pfc e6060000.pfc: invalid function can0 in map table
>>      pinmux core: sh-pfc does not support function can1
>>      sh-pfc e6060000.pfc: invalid function can1 in map table
> The pfc-r8a7794.c driver lacks support for CAN functions.
>
>> 1) I couldn't see r8a7794 in the CAN compatibility list. R-CAR CAN driver is
>> able to supports R-CAR E2 CAN interface ?
> I assume it can, but no one has added the compatible value to the driver yet.
>
>> 2) Is there any additional modifications are needed in any of the driver
>> source like pfc for supporting receive functionality (Rx)?
>> 3) Is there any errors in the modifications I have done ?  Showing the
>> following warnings/error while booting
>>         a) pinmux core: sh-pfc does not support function can0
>>         b) sh-pfc e6060000.pfc: invalid function can0 in map table
> Indeed, CAN support should be added to the pfc-r8a7794.c driver.
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
> .
>
