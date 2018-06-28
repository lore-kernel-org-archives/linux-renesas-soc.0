Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45786 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752081AbeF1AlE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jun 2018 20:41:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id g3-v6so3030090ljk.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Jun 2018 17:41:03 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Thu, 28 Jun 2018 02:41:01 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: fix a null pointer dereference of drive
 strength information
Message-ID: <20180628004101.GS5237@bigcity.dyn.berto.se>
References: <20180627055959.21001-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVj3K=8XfAgVB5-HKC_nPRAtRcLuCnBkjErHiw3-b8U5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVj3K=8XfAgVB5-HKC_nPRAtRcLuCnBkjErHiw3-b8U5w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 2018-06-27 10:27:54 +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Jun 27, 2018 at 8:01 AM Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Not all SoCs describes the drive strength registers. When reading the
> > sysfs pinconf-pins file on such a SoC this results in a null pointer
> > dereference. Protect against this dereference and allow reading of the
> > pinconf-pins by adding a check if the drive strength registers are
> > described or not.
> >
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > This was found on the Eagle board and is based on the latest
> > renesas/devel branch.
> 
> I think the real issue is pfc-r8a77990.c setting SH_PFC_PIN_CFG_DRIVE_STRENGTH
> without providing sh_pfc.drive_regs[].
> Without that flag set, sh_pfc_pinconf_validate(..., PIN_CONFIG_DRIVE_STRENGTH)
> would cause an earlier failure.

Ahh I see, thanks for the pointer. I will explore this option as it 
seems like a nicer solution, thanks!

> 
> > --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> > +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
> > @@ -483,6 +483,9 @@ static u32 sh_pfc_pinconf_find_drive_strength_reg(struct sh_pfc *pfc,
> >         const struct pinmux_drive_reg *reg;
> >         unsigned int i;
> >
> > +       if (!pfc->info->drive_regs)
> > +               return 0;
> > +
> >         for (reg = pfc->info->drive_regs; reg->reg; ++reg) {
> >                 for (i = 0; i < ARRAY_SIZE(reg->fields); ++i) {
> >                         field = &reg->fields[i];
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas S�derlund
