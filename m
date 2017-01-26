Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46794 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753780AbdAZK1V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 05:27:21 -0500
Date: Thu, 26 Jan 2017 11:27:13 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126102713.GA27721@verge.net.au>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
 <20170112224353.GB1490@katana>
 <20170113083719.GE2269@verge.net.au>
 <20170113083928.GD1446@katana>
 <20170126100116.GC21851@verge.net.au>
 <20170126100355.GA1435@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170126100355.GA1435@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 11:03:56AM +0100, Wolfram Sang wrote:
> On Thu, Jan 26, 2017 at 11:01:17AM +0100, Simon Horman wrote:
> > On Fri, Jan 13, 2017 at 09:39:28AM +0100, Wolfram Sang wrote:
> > > > Sorry for missing these.
> > > > I have queued them up for v4.11.
> > > 
> > > Thank you!
> > 
> > On my r8a7796/salvator-x I see the following with this series applied:
> > 
> > sh_mobile_sdhi ee140000.sd: timeout waiting for hardware interrupt (CMD13)
> 
> Do you have the HS200 enablement patches in that branch? They are
> currently in -next.

I tried mmc/next (but didn't notice anything special there).
Which patches should I be looking for?
