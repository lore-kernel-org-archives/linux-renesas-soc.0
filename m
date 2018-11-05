Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:41164 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbeKFBGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 20:06:10 -0500
Received: by mail-ua1-f68.google.com with SMTP id o17so3333451uad.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Nov 2018 07:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <20181031232518.2490-3-niklas.soderlund@ragnatech.se> <CAMuHMdWcqX5Ai3PnMK5F+1gDXrR84FzYV496zR96QHH7xmsWVA@mail.gmail.com>
 <20181105150743.GB20989@bigcity.dyn.berto.se>
In-Reply-To: <20181105150743.GB20989@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 16:45:39 +0100
Message-ID: <CAMuHMdWv0a7JG2_Mfk-TNkUNtK+=kXTb4S89f6gEQ9MCKxMbKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Mon, Nov 5, 2018 at 4:07 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-11-05 11:43:24 +0100, Geert Uytterhoeven wrote:
> > On Thu, Nov 1, 2018 at 12:26 AM Niklas Söderlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > > From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > >
> > > On H3 (ES1.0,ES2.0) and M3-W (ES1.0,ES1.1) the clock setting for HS400
> >
> > H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1)
>
> Thanks.
>
> >
> > > needs a quirk to function properly. The reason for the quirk is that
> > > there are two settings which produces same divider vale for the SDn
> > > clock. On the effected boards the one currently selected results in HS00
> >
> > HS200 or HS400?
>
> Wops, HS400 :-)
>
> >
> > > not working.
> > >
> > > This change uses the same method as the Gen2 CPG driver and simply
> > > ignores the first clock setting as this is the offending one when
> > > selecting the settings. Which of the two possible settings is used have
> > > no effect for SDR104.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/clk/renesas/rcar-gen3-cpg.c | 28 ++++++++++++++++++++++------
> > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> > > index ff56ac6134111c38..8cc524a29c855dd2 100644
> > > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c

> > > @@ -377,6 +382,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
> > >         clock->hw.init = &init;
> > >         clock->div_table = cpg_sd_div_table;
> > >         clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
> > > +       clock->skip_first = skip_first;
> >
> > What about
> >
> >     if (cpg_quirks & SD_SKIP_FIRST) {
> >             clock->div_table++;
> >             clock->div_num--;
> >     }
> >
> > instead?
>
> This was my first approach as well, unfortunately it won't work :-(
>
> If the bootloader leaves the clock settings in a state which matches the
> first row in the table the clock fails to register as the check in
> cpg_sd_clk_register() makes sure it have a row for the state the
> hardware is in. If it can't find that state the clock fails to register.
> Whit this quirk the limitation of the effected boards only have an
> effect when setting the clock.

IC...

> I thought this solution solved this quiet neatly with the robustness
> principle, 'Be conservative in what you do, be liberal in what you
> accept from others' :-)

Will it ever use the settings as inherited from boot loader or reset state?
If it does, I assume it will fail badly, due to an inconsistency between the
SD and SDH clock rates?
And what if the kernel is ever booted when the SDnSRCFC or SDnFC field
has an invalid value? Then the driver will fail, too?

Hence, isn't it safer to initialize the registers to a known safe value?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
