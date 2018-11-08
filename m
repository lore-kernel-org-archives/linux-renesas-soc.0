Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:38917 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbeKHUCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 15:02:31 -0500
Received: by mail-vk1-f193.google.com with SMTP id q80so294471vka.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Nov 2018 02:27:43 -0800 (PST)
MIME-Version: 1.0
References: <1540071349-27483-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdV=ZinKOWZco9t4rGncYY5BqghXxGE6w9qCNW55UVSa+A@mail.gmail.com>
 <20181107123002.t6xg4m4vbq7cuapb@verge.net.au> <20181108102201.kuheale47tqygoe4@verge.net.au>
In-Reply-To: <20181108102201.kuheale47tqygoe4@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 11:27:31 +0100
Message-ID: <CAMuHMdW=f77EafYXSzD3BiuMLirm+gjMnQZ7WzE0kX-TjXwkdg@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add I2C-DVFS device node
To: Simon Horman <horms@verge.net.au>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Nov 8, 2018 at 11:22 AM Simon Horman <horms@verge.net.au> wrote:
> On Wed, Nov 07, 2018 at 01:30:10PM +0100, Simon Horman wrote:
> > On Mon, Nov 05, 2018 at 09:52:48AM +0100, Geert Uytterhoeven wrote:
> > > On Sat, Oct 20, 2018 at 11:35 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > >
> > > > This patch adds I2C-DVFS device node for the R8A77990 SoC.
> > > >
> > > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi

> > > >         };
> > > >
> > > >         cpus {
> > > > @@ -337,6 +338,22 @@
> > > >                         reg = <0 0xe6060000 0 0x508>;
> > > >                 };
> > > >
> > > > +               i2c_dvfs: i2c@e60b0000 {
> > > > +                       #address-cells = <1>;
> > > > +                       #size-cells = <0>;
> > > > +                       compatible = "renesas,iic-r8a77990",
> > >
> > > "renesas,iic-r8a77990" is not yet documented.
> >
> > Thanks, as per my comment below I wonder if as well as documenting
> > "renesas,iic-r8a77990" we also to teach the driver about it.
> >
> > >
> > > > +                                    "renesas,rcar-gen3-iic",
> > > > +                                    "renesas,rmobile-iic";
> > >
> > > Also, IIC on R-Car E3 does not have the automatic transmission registers.
> > > Does this affect claiming compatibility with the family-specific or generic
> > > compatible values?
> >
> > My cursory reading of the driver indicates that only register that is
> > used by it but documented as not existing on E3 is ICSTART (offset 0x70).
> >
> > It seems to me that we should confirm with Renesas that the register does
> > indeed not exist - as this patch comes from the BSP which implies it is
> > being used there. And if it does not exist we should try teaching the
> > driver not to use ICSTART via the "renesas,iic-r8a77990" compat string.
> > What do you think?
>
> Further examination by Wolfram Sang has shown that the code in question is
> only used on the r8a7740. I don't think there is any compatibility issue
> for r8a77990 when using the current driver.

"When using the current driver".
Do we want to claim compatibility with "renesas,rcar-gen3-iic" and/or
"renesas,rmobile-iic"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
