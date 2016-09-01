Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:36161 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755566AbcIAVBE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 17:01:04 -0400
Received: by mail-it0-f52.google.com with SMTP id i184so3238952itf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Sep 2016 14:01:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57C81DF0.4040308@tataelxsi.co.in>
References: <57C56FAA.7090407@tataelxsi.co.in> <CAMuHMdUj5cxfZknvdNGRjYHSeTMKVRne4QULw=vtzJZUOvP=sA@mail.gmail.com>
 <57C81DF0.4040308@tataelxsi.co.in>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Sep 2016 21:04:32 +0200
Message-ID: <CAMuHMdUc7XsAUD+tzfsRzb_26J-nKJQ2Rq_uUQ+z6Y38KWabmQ@mail.gmail.com>
Subject: Re: R-Car E2 Can interface receive issue
To: Roopesh K P <roopeshkp@tataelxsi.co.in>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 1, 2016 at 2:24 PM, Roopesh K P <roopeshkp@tataelxsi.co.in> wrote:
> Today I tested the CAN with R-CAR M2 (Koelsch board) because r8a7791 is
> listed in CAN driver compatibility list .
>
> ' dmesg | grep -i can ' shows
>
> vcan: Virtual CAN interface driver
> slcan: serial line CAN interface driver
> slcan: 10 dynamic interface channels.
> CAN device driver interface
> rcar_can e6e80000.can: device registered (reg_base=e78f2000, irq=218)
> can: controller area network core (rev 20120528 abi 9)
> can: raw protocol (rev 20120528)
> can: broadcast manager protocol (rev 20120528 t)
> can: netlink gateway (rev 20130117) max_hops=1
>
> I can't see any pfc error/warning message which is happened in the case  of
> R-CAR E2 (ALT board),  but couldn't get the expected result in R-CAR M2
> Koelsch board also.
>
> For testing purpose , I checked the result of Virtual CAN (vcan) , it is
> working fine.
>
> Then my question is ,
>
> Is it not possible to test native (real hardware) CAN interface like can0 in
> Koelsch or ALT board ?

CAN is not enabled in arch/arm/boot/dts/r8a7791-koelsch.dts, as the Koelsch
board doesn't have the needed interfaces?
I believe ALT also lacks these interfaces.

The only boards where it's currently supported are r8a7791/porter and
r8a7792/blanche.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
