Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:47040 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751476AbeAEMYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jan 2018 07:24:54 -0500
Received: by mail-lf0-f68.google.com with SMTP id a12so4964387lfe.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2018 04:24:53 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Fri, 5 Jan 2018 13:24:50 +0100
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: update register size for thermal
Message-ID: <20180105122450.GG22490@bigcity.dyn.berto.se>
References: <20180104213108.24080-1-niklas.soderlund+renesas@ragnatech.se>
 <20180104213108.24080-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdU97udtf4+vo_SaGyYaEk1eV4QEmeqWiGF4iVp045w=6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU97udtf4+vo_SaGyYaEk1eV4QEmeqWiGF4iVp045w=6A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thanks for your comments.

On 2018-01-05 09:47:11 +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 4, 2018 at 10:31 PM, Niklas S�derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > To be able to read fused calibration values from hardware the size of
> > the register resource of TSC1 needs to be incremented to cover one more
> > register which holds the information if the calibration values have been
> > fused or not.
> >
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > @@ -2385,7 +2385,7 @@
> >
> >                 tsc: thermal@e6198000 {
> >                         compatible = "renesas,r8a7795-thermal";
> > -                       reg = <0 0xe6198000 0 0x68>,
> > +                       reg = <0 0xe6198000 0 0x6c>,
> 
> Perhaps we should just make it 0x100?
> I'd be very surprised if that would be smaller than the granularity of the
> address decoder circuitry.

I have no problem with making it 0x100, looking at r8a7795.dtsi it seems 
we are mixing what we do today. For example the i2c nodes are defined 
with a precise size less then 0x100 while the USB-DMAC nodes uses a size 
of 0x100 while the size in the documentation is less then 0x100. Maybe 
we should define how we should handle cases like this and update the 
existing DT files?

Do you think I should make all thermal registers 0x100 and not just TSC1 
and resend?

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
