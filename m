Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34581 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751531AbeCWJCw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Mar 2018 05:02:52 -0400
Date: Fri, 23 Mar 2018 10:02:48 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a7796: sort subnodes of
 the root node
Message-ID: <20180323090247.7whvhvb2k6fmm63n@verge.net.au>
References: <20180322102423.18269-1-horms+renesas@verge.net.au>
 <20180322102423.18269-4-horms+renesas@verge.net.au>
 <CAMuHMdX51Uqr=2aN+EC8wnEqNoDWYOVdOXA=aWhC-uX1k5p4sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX51Uqr=2aN+EC8wnEqNoDWYOVdOXA=aWhC-uX1k5p4sg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 23, 2018 at 09:37:41AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Mar 22, 2018 at 11:24 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Sort subnodes of the root node alphanumerically.
> >
> > This is part of an ongoing effort to provide consistent node
> > order in the DT of Renesas SoCs to improve maintainability.
> >
> > This should not have any run-time effect.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> using "grep '{' | grep -v @", which tells me
>   - clusterX_opp should be before cpus,
>   - thermal_zones should be before timer.

Thanks, I will fix that in v3.
