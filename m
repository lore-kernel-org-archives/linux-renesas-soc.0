Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45205 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750965AbeEBGf0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 02:35:26 -0400
Date: Wed, 2 May 2018 08:35:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT 2/3] mmc: renesas_sdhi: Add r8a77965 support
Message-ID: <20180502063506.3s4vizhm5aquklrh@verge.net.au>
References: <1525031296-16512-1-git-send-email-ykaneko0929@gmail.com>
 <1525031296-16512-3-git-send-email-ykaneko0929@gmail.com>
 <20180501152915.66re3hotavdy2bi6@verge.net.au>
 <20180502053218.2idc2kfzfksuz74b@tetsubishi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180502053218.2idc2kfzfksuz74b@tetsubishi>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 02, 2018 at 07:32:19AM +0200, Wolfram Sang wrote:
> 
> > > +	{ .compatible = "renesas,sdhi-r8a77965", .data = &of_rcar_gen3_compatible, },
> 
> Do we need this line...
> 
> > >  	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
> 
> ... with this generic fallback in place?

Sorry, I missed that in my review.
I agree that the renesas,sdhi-r8a77965 is not needed.

> 
> > > @@ -276,6 +277,7 @@ static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
> > >  	/* generic ones */
> > >  	{ .soc_id = "r8a7795" },
> > >  	{ .soc_id = "r8a7796" },
> > > +	{ .soc_id = "r8a77965", .revision = "ES1.0" },
> > 
> > I think we can drop .revision = "ES1.0"
> > 
> > to be in keeping with 349936fcdaf8 ("mmc: renesas_sdhi_internal_dmac: use
> > more generic whitelisting").
> 
> Ack.

One more consideration.

With the current state of the driver this patch should be fine,
modulo the changes suggested above. But once HS400 support is merged
some logic will be required to disable that feature for the r8a77965
until HS400 support for that SoC is explicitly added.

Or conversely, perhaps when HS400 is added it should only be enabled
in the driver for SoCs that are known to work: r8a7796 and r8a7795. In the
case of the latter perhaps only ES2.0.

Wolfram, what do you think?
