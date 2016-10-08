Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54807 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751280AbcJHUmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Oct 2016 16:42:50 -0400
Date: Sat, 8 Oct 2016 11:31:50 +0900
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/11] ARM: shmobile: r8a7743: basic SoC support
Message-ID: <20161008023149.GB14617@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <15557770.lH5aPepOeZ@wasted.cogentembedded.com>
 <20161007031537.GK13721@verge.net.au>
 <2345971.ESZSzve5jF@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2345971.ESZSzve5jF@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 07, 2016 at 11:33:33AM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> 
> On Friday 07 Oct 2016 12:15:37 Simon Horman wrote:
> > On Thu, Oct 06, 2016 at 12:37:08AM +0300, Sergei Shtylyov wrote:
> > > Add minimal support for the RZ/G1M (R8A7743) SoC.
> > > 
> > > Based on the original (and large) patch by Dmitry Shifrin
> > > <dmitry.shifrin@cogentembedded.com>.
> > > 
> > > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks, I have queued this up.
> 
> I'd like to see this patch rebased on top of "[PATCH] ARM: shmobile: 
> Consolidate R8A779[234] machine definitions".

I'm happy to drop this patch if that is the desired outcome of
the discussion in this sub-thread.
