Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35318 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751604AbdHNPUU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 11:20:20 -0400
MIME-Version: 1.0
In-Reply-To: <TY1PR06MB070269842CD923E4DE4FE6EDB78C0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1502709581-26546-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVDqgbwKzxFoxajLLFHZC80NT5vrDLnpb9sFj+DL-1zDw@mail.gmail.com> <TY1PR06MB070269842CD923E4DE4FE6EDB78C0@TY1PR06MB0702.apcprd06.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 17:20:19 +0200
Message-ID: <CAMuHMdWHMLi-yiVmzQCYRHSnJpuokBREo6QFF2z-zaviZVxFNA@mail.gmail.com>
Subject: Re: [PATCH ] mmc: renesas_sdhi: Add r8a7743/5 support
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Mon, Aug 14, 2017 at 5:15 PM, Chris Paterson
<Chris.Paterson2@renesas.com> wrote:
>> From: geert.uytterhoeven@gmail.com [mailto:geert.uytterhoeven@gmail.com]
>> On Behalf Of Geert Uytterhoeven
>> Sent: 14 August 2017 15:22
>>
>> On Mon, Aug 14, 2017 at 1:19 PM, Biju Das <biju.das@bp.renesas.com> wrote:
>> > Add support for r8a7743/5 SoC.Renesas RZ/G1[ME] (R8A7743/5) SDHI is
>> > identical to the R-Car Gen2 family.
>> >
>> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
>> > ---
>> > This patch is compiled and tested against mmc/next.
>> >
>> >  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
>> > b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
>> > index 718cb8a..f709f7f 100644
>> > --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
>> > +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
>> > @@ -95,6 +95,8 @@
>> >         { .compatible = "renesas,sdhi-r7s72100", .data = &of_rz_compatible, },
>> >         { .compatible = "renesas,sdhi-r8a7778", .data =
>> &of_rcar_gen1_compatible, },
>> >         { .compatible = "renesas,sdhi-r8a7779", .data =
>> > &of_rcar_gen1_compatible, },
>> > +       { .compatible = "renesas,sdhi-r8a7743", .data =
>> &of_rcar_gen2_compatible, },
>> > +       { .compatible = "renesas,sdhi-r8a7745", .data =
>> > + &of_rcar_gen2_compatible, },
>> >         { .compatible = "renesas,sdhi-r8a7790", .data =
>> &of_rcar_gen2_compatible, },
>> >         { .compatible = "renesas,sdhi-r8a7791", .data =
>> &of_rcar_gen2_compatible, },
>> >         { .compatible = "renesas,sdhi-r8a7792", .data =
>> > &of_rcar_gen2_compatible, },
>>
>> I guess we want generic R-Car Gen2/3 compatible values here, too?
>
> Yes, but I assume that should be a separate patch submitted instead of this one?

Indeed. That would avoid having to add the SoC-specific compatible values
to the driver for all RZ/G1 variants.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
