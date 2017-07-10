Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59813 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752531AbdGJIds (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 04:33:48 -0400
Date: Mon, 10 Jul 2017 10:33:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: ulcb: Enable I2C4
Message-ID: <20170710083342.GF13680@verge.net.au>
References: <1499393396-11594-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdVPNoCZz3fiqXOQ6Rx_jzAa4-rDAE9XD3jZH-mkZJmUhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVPNoCZz3fiqXOQ6Rx_jzAa4-rDAE9XD3jZH-mkZJmUhg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 10:20:02AM +0200, Geert Uytterhoeven wrote:
> On Fri, Jul 7, 2017 at 4:09 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> >
> > This enables I2C4 for ULCB board
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

FWIIW, I only got this one patch of this series.

> 
> > --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> > @@ -189,6 +189,12 @@
> >         };
> >  };
> >
> > +&i2c4 {
> > +       status = "okay";
> > +
> > +       clock-frequency = <400000>;
> 
> Is this a bus limitation, or a limitation for the VC6 that's added in a later
> patch?
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
> 
