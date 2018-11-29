Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39807 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbeK2Lr1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 06:47:27 -0500
Received: by mail-lj1-f195.google.com with SMTP id t9-v6so147896ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Nov 2018 16:43:56 -0800 (PST)
Date: Thu, 29 Nov 2018 01:43:54 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
Message-ID: <20181129004354.GC2162@bigcity.dyn.berto.se>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
 <CAMuHMdWcqX5Ai3PnMK5F+1gDXrR84FzYV496zR96QHH7xmsWVA@mail.gmail.com>
 <20181105150743.GB20989@bigcity.dyn.berto.se>
 <CAMuHMdWv0a7JG2_Mfk-TNkUNtK+=kXTb4S89f6gEQ9MCKxMbKg@mail.gmail.com>
 <20181128180233.GA25696@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181128180233.GA25696@bigcity.dyn.berto.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 2018-11-28 19:02:33 +0100, Niklas S�derlund wrote:
> Hi Geert,
> 
> Thanks for your feedback.
> 
> On 2018-11-05 16:45:39 +0100, Geert Uytterhoeven wrote:
> > Hi Niklas,
> > 
> > On Mon, Nov 5, 2018 at 4:07 PM Niklas S�derlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > > On 2018-11-05 11:43:24 +0100, Geert Uytterhoeven wrote:
> > > > On Thu, Nov 1, 2018 at 12:26 AM Niklas S�derlund
> > > > <niklas.soderlund@ragnatech.se> wrote:
> > > > > From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > > > >
> > > > > On H3 (ES1.0,ES2.0) and M3-W (ES1.0,ES1.1) the clock setting for HS400
> > > >
> > > > H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1)
> > >
> > > Thanks.
> > >
> > > >
> > > > > needs a quirk to function properly. The reason for the quirk is that
> > > > > there are two settings which produces same divider vale for the SDn
> > > > > clock. On the effected boards the one currently selected results in HS00
> > > >
> > > > HS200 or HS400?
> > >
> > > Wops, HS400 :-)
> > >
> > > >
> > > > > not working.
> > > > >
> > > > > This change uses the same method as the Gen2 CPG driver and simply
> > > > > ignores the first clock setting as this is the offending one when
> > > > > selecting the settings. Which of the two possible settings is used have
> > > > > no effect for SDR104.
> > > > >
> > > > > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > > > > ---
> > > > >  drivers/clk/renesas/rcar-gen3-cpg.c | 28 ++++++++++++++++++++++------
> > > > >  1 file changed, 22 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> > > > > index ff56ac6134111c38..8cc524a29c855dd2 100644
> > > > > --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> > > > > +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> > 
> > > > > @@ -377,6 +382,7 @@ static struct clk * __init cpg_sd_clk_register(const struct cpg_core_clk *core,
> > > > >         clock->hw.init = &init;
> > > > >         clock->div_table = cpg_sd_div_table;
> > > > >         clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
> > > > > +       clock->skip_first = skip_first;
> > > >
> > > > What about
> > > >
> > > >     if (cpg_quirks & SD_SKIP_FIRST) {
> > > >             clock->div_table++;
> > > >             clock->div_num--;
> > > >     }
> > > >
> > > > instead?
> > >
> > > This was my first approach as well, unfortunately it won't work :-(
> > >
> > > If the bootloader leaves the clock settings in a state which matches the
> > > first row in the table the clock fails to register as the check in
> > > cpg_sd_clk_register() makes sure it have a row for the state the
> > > hardware is in. If it can't find that state the clock fails to register.
> > > Whit this quirk the limitation of the effected boards only have an
> > > effect when setting the clock.
> > 
> > IC...
> > 
> > > I thought this solution solved this quiet neatly with the robustness
> > > principle, 'Be conservative in what you do, be liberal in what you
> > > accept from others' :-)
> > 
> > Will it ever use the settings as inherited from boot loader or reset state?
> > If it does, I assume it will fail badly, due to an inconsistency between the
> > SD and SDH clock rates?
> > And what if the kernel is ever booted when the SDnSRCFC or SDnFC field
> > has an invalid value? Then the driver will fail, too?
> > 
> > Hence, isn't it safer to initialize the registers to a known safe value?
> 
> I agree with you that we should not trust the value fro the bootloader 
> and the sdhi driver do not trust this and resets it. The problem is 
> rcar-gen3-cpg. From cpg_sd_clk_register()
> 
>          sd_fc = readl(clock->csn.reg) & CPG_SD_FC_MASK;
>          for (i = 0; i < clock->div_num; i++)
>                  if (sd_fc == (clock->div_table[i].val & CPG_SD_FC_MASK))
>                          break;
> 
>          if (WARN_ON(i >= clock->div_num)) {
>                  kfree(clock);
>                  return ERR_PTR(-EINVAL);
>          }
> 
>          clock->cur_div_idx = i;
> 
> If the bootloader sets the register to a value not known by the clock 
> driver or if we us the moth you prefer to modify clock->div_table and 
> clock->div_num the clock driver would need to set a safe default. I 
> think this would be fine as the SDHI driver could handle this (I need to 
> test it tho). My proposal is therefor that I add a patch to this series 
> where the clock driver try to set a known divider when it registers the 
> clock.
> 
> My suggestion would be that the divider to be set to 4 as this appears 
> to be what current boot loaders do. Would this work for you?

I have now created a patch which do almost this [1]. But instead of 
setting the divider to 4 just use the first row of clock->div_table and 
make sure the clock is stopped. Any user of the clock needs to set the 
rate it expects before enabling the clock. I tested this on H3 ES1 and 
ES2 and M3-N and it works just fine.

1. [PATCH] clk: renesas: rcar-gen3: set state when registering SD clocks

-- 
Regards,
Niklas S�derlund
