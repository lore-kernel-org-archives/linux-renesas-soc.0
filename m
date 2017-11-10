Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54655 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751239AbdKJLXi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 06:23:38 -0500
Date: Fri, 10 Nov 2017 12:23:34 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Subject: Re: [PATCH v4 10/15] arm64: dts: renesas: r8a7795: Point VSPI via
 FCPVI to IPMMU-VP0/1
Message-ID: <20171110112333.n7q36b3ij6wwi6l4@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au>
 <20171101103452.7491-11-horms+renesas@verge.net.au>
 <CAMuHMdWy7xK8GJSU7G_CrVob8PuVWB61TugGBtTYyugJ+M3Cfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWy7xK8GJSU7G_CrVob8PuVWB61TugGBtTYyugJ+M3Cfw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 07, 2017 at 10:35:23AM +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Hook up the FCPVI devices to allow use of VSPI with
> > IPMMU-VP0 and IPMMU-VP1.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> > @@ -155,6 +155,10 @@
> >         iommus = <&ipmmu_vp0 1>;
> >  };
> >
> > +&fcpvi1 {
> > +       iommus = <&ipmmu_vp0 9>;
> > +};
> 
> Do we sort labels alphabetically?
> Or do we follow the order of the original targets?
> 
> (Random comment that may apply elsewhere, too)

In these IPMMU patches I tried to sort them in the same order
as they appear in r8a7795.dtsi. I'm happy to change that if
we decided on a scheme to adopt.

> 
> > +
> >  &fcpvd2 {
> >         iommus = <&ipmmu_vi0 10>;
> >  };
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
