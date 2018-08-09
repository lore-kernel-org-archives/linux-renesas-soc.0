Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45954 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbeHIN15 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Aug 2018 09:27:57 -0400
Date: Thu, 9 Aug 2018 13:03:33 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-xs: enable SATA
Message-ID: <20180809110332.jxcpvpkgj6nupsgc@verge.net.au>
References: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
 <20180802111607.oinxgve5yutvfner@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180802111607.oinxgve5yutvfner@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 02, 2018 at 01:16:07PM +0200, Simon Horman wrote:
> On Mon, Jul 30, 2018 at 09:34:56AM +0200, Wolfram Sang wrote:
> > Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
> > off for that to work.
> > 
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > 
> > Changes since v1:
> > 	* fixed indentation (Thanks, Geert!)
> > 	* merged two patches into one (Thanks, Simon!)
> > 	* Added Geert's tag
> > 
> >  arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts  | 14 ++++++++++++++
> >  arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts | 14 ++++++++++++++
> >  2 files changed, 28 insertions(+)
> 
> This looks good to me:
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> But (note to self) depends on:
> 
> [PATCH v2] arm64: dts: r8a77965: Add SATA controller node

Both that dependency and that patch applied for v4.20.
