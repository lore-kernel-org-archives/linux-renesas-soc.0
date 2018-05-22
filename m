Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36477 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbeEVI62 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 May 2018 04:58:28 -0400
Date: Tue, 22 May 2018 10:58:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r8a77995-draak: add X12 input
 dot clock
Message-ID: <20180522085823.hjdrxt32bufajup3@verge.net.au>
References: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526386840-15368-6-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20180516083822.xfmmg7sybdn37cjr@verge.net.au>
 <2229151.yue33o4Tiy@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2229151.yue33o4Tiy@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 20, 2018 at 11:58:36AM +0300, Laurent Pinchart wrote:
> Hi Ulrich,
> 
> Thank you for the patch.
> 
> On Wednesday, 16 May 2018 11:38:22 EEST Simon Horman wrote:
> > On Tue, May 15, 2018 at 02:20:40PM +0200, Ulrich Hecht wrote:
> > > 74.25 Mhz oscillator X12 is connected to DU_DOTCLKIN0.
> > > 
> > > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > > ---
> > > 
> > >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > 
> > This looks fine but I will wait to see if there are other reviews before
> > applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> As far as I'm concerned this patch can be merged already. I would however 
> possibly hold off merging patch 3/5 and 4/5 until they can be tested.

Thanks, I have applied this patch for v4.19.

As per your suggestion, I have marked patches 3/5 and 4/5 as deferred
pending testing.
