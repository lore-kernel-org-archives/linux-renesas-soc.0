Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38957 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932195AbdDRHbc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 03:31:32 -0400
Date: Tue, 18 Apr 2017 16:31:28 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH/RFT] ARM: dts: silk: Enable UHS-I SDR-50
Message-ID: <20170418073127.GC16340@verge.net.au>
References: <1492493267-20807-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdV_L_Fpm0=WQkHgVn123G4X+cUSxECqw4yi3TYvdSSGCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV_L_Fpm0=WQkHgVn123G4X+cUSxECqw4yi3TYvdSSGCA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 18, 2017 at 09:22:24AM +0200, Geert Uytterhoeven wrote:
> On Tue, Apr 18, 2017 at 7:27 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Add the "1v8" pinctrl state and sd-uhs-sdr50 property to SDHI1.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > * Compile tested only; no access to silk board
> > ---
> >  arch/arm/boot/dts/r8a7794-silk.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r8a7794-silk.dts b/arch/arm/boot/dts/r8a7794-silk.dts
> > index 4cb5278d104d..b0ef8ea75c29 100644
> > --- a/arch/arm/boot/dts/r8a7794-silk.dts
> > +++ b/arch/arm/boot/dts/r8a7794-silk.dts
> > @@ -226,6 +226,13 @@
> >         du1_pins: du1 {
> >                 groups = "du1_rgb666", "du1_sync", "du1_disp", "du1_clk0_out";
> >                 function = "du1";
> > +               power-source = <3300>;
> > +       };
> > +
> > +       sdhi1_pins_uhs: sd1_uhs {
> > +               groups = "sdhi1_data4", "sdhi1_ctrl";
> > +               function = "sdhi1";
> > +               power-source = <1800>;
> 
> Shouldn't this be inserted right after the existing sdhi1_pins?
> Yes, the list is only partially sorted.

Oh wow, I messed that up completely.
Let me post a v2.
