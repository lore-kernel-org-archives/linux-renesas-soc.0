Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34613 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbeCWJFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 05:05:03 -0400
Date: Fri, 23 Mar 2018 10:05:00 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: r8a7795: sort subnodes of
 the soc node
Message-ID: <20180323090459.xmzcihmln6bxynzk@verge.net.au>
References: <20180322102423.18269-1-horms+renesas@verge.net.au>
 <20180322102423.18269-3-horms+renesas@verge.net.au>
 <CAMuHMdWz9wr0iVVqJ=abm1LRZ3QcfWTk02bKk-MpkVP=mBX52w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWz9wr0iVVqJ=abm1LRZ3QcfWTk02bKk-MpkVP=mBX52w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 23, 2018 at 09:41:29AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Mar 22, 2018 at 11:24 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Sort subnodes of the soc node.
> > - The primary key is the bus address.
> > - The secondary key is the IP block.
> > - The tertiary key is the node name.
> >
> > This is part of an ongoing effort to provide consistent node
> > order in the DT of Renesas SoCs to improve maintainability.
> >
> > This should not have any run-time effect.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > v2
> > * Rebase
> 
> Thanks for the update!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> using dtx_diff, and "grep '@.*{', which tells me
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> 
> >                 pciec0: pcie@fe000000 {
> > @@ -2097,6 +2090,23 @@
> >                         status = "disabled";
> >                 };
> >
> > +               gic: interrupt-controller@f1010000 {
> 
> Probably gic should be before pciec0.
> Currently it's after pciec1, which has a lower address than pciec1.

Thanks, I will fix this in v3.
