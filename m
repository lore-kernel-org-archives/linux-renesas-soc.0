Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:34053 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933128AbcKWJ0M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 04:26:12 -0500
MIME-Version: 1.0
In-Reply-To: <HK2PR0601MB1329B185751A31F45081132EB7B70@HK2PR0601MB1329.apcprd06.prod.outlook.com>
References: <1479822362-4749-1-git-send-email-chris.paterson2@renesas.com>
 <1479822362-4749-2-git-send-email-chris.paterson2@renesas.com>
 <CAMuHMdXsE1qH+2aFrmdFjwXpkB9UPy+ot=vHSBQdNdpWkuJ+AQ@mail.gmail.com>
 <CAMuHMdX9TthO6W0-6LhxY-oWkUoOOCjkNk+UuSmbFejfeZSogw@mail.gmail.com> <HK2PR0601MB1329B185751A31F45081132EB7B70@HK2PR0601MB1329.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2016 10:26:10 +0100
Message-ID: <CAMuHMdU7BuiNGsw9WmBz_5TpPBGB=0HnV+t3hQ+gsdy85-H8hQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a7796: Add CAN peripheral clock
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Wed, Nov 23, 2016 at 9:39 AM, Chris Paterson
<Chris.Paterson2@renesas.com> wrote:
>> On Wed, Nov 23, 2016 at 9:03 AM, Geert Uytterhoeven <geert@linux-
>> m68k.org> wrote:
>> > On Tue, Nov 22, 2016 at 2:46 PM, Chris Paterson
>> > <chris.paterson2@renesas.com> wrote:
>> >> Signed-off-by: Ramesh Shanmugasundaram
>> >> <ramesh.shanmugasundaram@bp.renesas.com>
>> >> Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
>>
>> BTW, as all patches in this series were Signed-off-by Ramesh first, does that
>> mean he's the author, and you should have added his From: line, too?
>
> Technically I authored these patches, but they are direct ports from Ramesh's r8a7795 patches [1][2][3].

OK, I'll replace his SoB by "based on patches for r8a7795 by Ramesh...".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
