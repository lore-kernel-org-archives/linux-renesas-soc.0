Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36624 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753041AbeDZGNM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 02:13:12 -0400
Date: Wed, 25 Apr 2018 08:49:39 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/4] ARM: dts: renesas: r8a7790: Add FDP1 instances
Message-ID: <20180425064938.e3huk4x33ykrpgfx@verge.net.au>
References: <20180422103528.3402-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180422103528.3402-2-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdVmaAGZmSyXq+5F4pcL-=ytZMZEBM2TVMUVFNCrwxxtxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVmaAGZmSyXq+5F4pcL-=ytZMZEBM2TVMUVFNCrwxxtxA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 05:01:29PM +0200, Geert Uytterhoeven wrote:
> On Sun, Apr 22, 2018 at 12:35 PM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The r8a7790 has three FDP1 instances.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

> 
> > --- a/arch/arm/boot/dts/r8a7790.dtsi
> > +++ b/arch/arm/boot/dts/r8a7790.dtsi
> > @@ -1606,6 +1606,33 @@
> >                         resets = <&cpg 128>;
> >                 };
> >
> > +               fdp1@fe940000 {
> 
> Just wondering: should we go for "display-processor@foo"?
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
