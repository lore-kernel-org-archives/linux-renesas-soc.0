Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:45049 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756226AbdLOKB3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 05:01:29 -0500
Received: by mail-qt0-f195.google.com with SMTP id m59so11342369qte.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 02:01:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB0895D343C77D0DB2E9F14680C00B0@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <1513248976-26700-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513248976-26700-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWUaQMgT4J0N+hrByAD12K-oO0+iNyDeVczS3nxr5ia9A@mail.gmail.com> <TY1PR06MB0895D343C77D0DB2E9F14680C00B0@TY1PR06MB0895.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Dec 2017 11:01:28 +0100
Message-ID: <CAMuHMdW81B=oaf2asCtg8BT6tO97PVXmRN4Skbnm35PB0CLHVw@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: shmobile: defconfig: Enable PWM
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Fri, Dec 15, 2017 at 10:48 AM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
>> Subject: Re: [PATCH 1/6] ARM: shmobile: defconfig: Enable PWM
>> On Thu, Dec 14, 2017 at 11:56 AM, Fabrizio Castro
>> <fabrizio.castro@bp.renesas.com> wrote:
>> > RZ/G1 and R-Car platforms have PWM timers. This patch enables PWM support
>> > by default.
>> >
>> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
>>
>> Thanks for your patch!
>
> Thank you for your feedback.
>
>>
>> If I'm not mistaken, there are no current users of this PWM block in the
>> current R-Car Gen2 and RZ/G1 DTS files?
>
> PWM support will be needed very soon as we are going to use pwm3 on the iwg20d platform to control the RGB display backlight.

Good to know, thanks!

> The work to add display support is in progress, I hope it will be ready by next week, would you rather I sent this patch with the series to add display support?

That's up to Simon.  But I guess it doesn't matter much, as defconfig updates
are queued in a separate branch anyway.

You may want to send a similar patch for multi_v7_defconfig.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
