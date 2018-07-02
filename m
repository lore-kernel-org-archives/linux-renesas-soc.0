Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:43911 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753279AbeGBJuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 05:50:01 -0400
MIME-Version: 1.0
References: <20180627055959.21001-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdVj3K=8XfAgVB5-HKC_nPRAtRcLuCnBkjErHiw3-b8U5w@mail.gmail.com>
 <20180628004101.GS5237@bigcity.dyn.berto.se> <CAMuHMdUzwPcXJWUQYsHygikZdqWasw-8xN23ZS0t0CG2KSdqiw@mail.gmail.com>
 <20180702074838.GU5237@bigcity.dyn.berto.se>
In-Reply-To: <20180702074838.GU5237@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Jul 2018 11:49:50 +0200
Message-ID: <CAMuHMdXCWRM9qGUEq-XfA03R6jKu71mMZh+rGbv--KModrokxg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: fix a null pointer dereference of drive
 strength information
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Mon, Jul 2, 2018 at 9:48 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-06-28 08:57:40 +0200, Geert Uytterhoeven wrote:
> > On Thu, Jun 28, 2018 at 2:41 AM Niklas Söderlund
> > <niklas.soderlund@ragnatech.se> wrote:
> > > On 2018-06-27 10:27:54 +0200, Geert Uytterhoeven wrote:
> > > > On Wed, Jun 27, 2018 at 8:01 AM Niklas Söderlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > Not all SoCs describes the drive strength registers. When reading the
> > > > > sysfs pinconf-pins file on such a SoC this results in a null pointer
> > > > > dereference. Protect against this dereference and allow reading of the
> > > > > pinconf-pins by adding a check if the drive strength registers are
> > > > > described or not.
> > > > >
> > > > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > This was found on the Eagle board and is based on the latest
> > > > > renesas/devel branch.
> > > >
> > > > I think the real issue is pfc-r8a77990.c setting SH_PFC_PIN_CFG_DRIVE_STRENGTH
> > > > without providing sh_pfc.drive_regs[].
> > > > Without that flag set, sh_pfc_pinconf_validate(..., PIN_CONFIG_DRIVE_STRENGTH)
> > > > would cause an earlier failure.
> > >
> > > Ahh I see, thanks for the pointer. I will explore this option as it
> > > seems like a nicer solution, thanks!
> >
> > To be 100% clear: the proper solution is to add the missing drive_regs[],
> > not to remove the flags ;-)
>
> Normally I would agree with you, but V3M have no drive strength
> registered described in the datasheet so in this instance I do think the
> correct fix is to remove the flags :-)

Thanks, hard evidence is a good way to convince me ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
