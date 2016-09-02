Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-hk2apc01on0103.outbound.protection.outlook.com ([104.47.124.103]:52789
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752099AbcIBIyj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:54:39 -0400
Message-ID: <57C93E3D.9030901@tataelxsi.co.in>
Date: Fri, 2 Sep 2016 14:24:21 +0530
From: Roopesh K P <roopeshkp@tataelxsi.co.in>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: R-Car E2 Can interface receive issue
References: <57C56FAA.7090407@tataelxsi.co.in> <CAMuHMdUj5cxfZknvdNGRjYHSeTMKVRne4QULw=vtzJZUOvP=sA@mail.gmail.com> <57C81DF0.4040308@tataelxsi.co.in> <CAMuHMdUc7XsAUD+tzfsRzb_26J-nKJQ2Rq_uUQ+z6Y38KWabmQ@mail.gmail.com> <57C92808.1000509@tataelxsi.co.in> <CAMuHMdUUnr+tTi4FD0QvbtTb9xoB8dCJC6uno=9dAwXaJXi4Bw@mail.gmail.com>
In-Reply-To: <CAMuHMdUUnr+tTi4FD0QvbtTb9xoB8dCJC6uno=9dAwXaJXi4Bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear Geert Uytterhoeven,

Thank you very much for your support.

I thought R-CAR M2 SoC have 2 CAN channels and doesn't require a 
hardware port in board to test it with can-utils.  So you means that I 
can only use virtual CAN interface (vcan) in Koelsch or ALT board.

Anyway thanks for the confirmation.


Regards
RKP

On 9/2/2016 1:30 PM, Geert Uytterhoeven wrote:
> Hi RKP,
>
> On Fri, Sep 2, 2016 at 9:19 AM, Roopesh K P <roopeshkp@tataelxsi.co.in> wrote:
>> I assume Koelsch and Porter boards have not much difference in their make
>> (both are using R-CAR M2 as SoC) and I can boot a Koelsch board with uImage
>> and dtb(r8a7791-porter.dtb) made for porter board . I did this for testing
>> CAN interface in my Koelsch board.
> Using the DTB for Porter on Koelsch means you're lying about the hardware that's
> present, and obviously won't work.
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
