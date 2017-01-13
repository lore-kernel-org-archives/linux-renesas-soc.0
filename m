Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57950 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751291AbdAMIhZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jan 2017 03:37:25 -0500
Date: Fri, 13 Jan 2017 09:37:19 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170113083719.GE2269@verge.net.au>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
 <20170112224353.GB1490@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170112224353.GB1490@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 12, 2017 at 11:43:53PM +0100, Wolfram Sang wrote:
> On Wed, Jan 04, 2017 at 06:39:52PM +0100, Wolfram Sang wrote:
> > Simon,
> > 
> > as Ulf picked up the driver patches for HS200 support, it is now safe to pick
> > up the DTS patches, I'd say? I rebased them to the dt-for-4.11 branch.
> > 
> > All the best,
> > 
> >    Wolfram
> > 
> > 
> > Wolfram Sang (2):
> >   arm64: dts: r8a7795: enable HS200 for eMMC
> >   arm64: dts: r8a7796: enable HS200 for eMMC
> > 
> >  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
> >  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 1 +
> >  2 files changed, 2 insertions(+)
> 
> Ping :)

Sorry for missing these.
I have queued them up for v4.11.
