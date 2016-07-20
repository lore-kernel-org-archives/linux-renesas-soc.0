Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38233 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752044AbcGTGY7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 02:24:59 -0400
Date: Wed, 20 Jul 2016 15:24:54 +0900
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ai Kyuse <ai.kyuse.uw@renesas.com>
Subject: Re: [PATCH v3 3/4] mmc: sh_mobile_sdhi: Add tuning support
Message-ID: <20160720062454.GA24635@verge.net.au>
References: <1464057797-29951-1-git-send-email-horms+renesas@verge.net.au>
 <1464057797-29951-4-git-send-email-horms+renesas@verge.net.au>
 <20160527115933.GD1663@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160527115933.GD1663@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 27, 2016 at 01:59:34PM +0200, Wolfram Sang wrote:
> On Tue, May 24, 2016 at 11:43:16AM +0900, Simon Horman wrote:
> > From: Ai Kyuse <ai.kyuse.uw@renesas.com>
> 
> I wonder if you shouldn't take over ownership of this and the previous
> patch? You changed quite a lot.

Sure, will do.

[snip]

> > +
> > +static unsigned int sh_mobile_sdhi_init_tuning(struct tmio_mmc_host *host)
> > +{
> > +	if (!(host->mmc->caps & MMC_CAP_UHS_SDR104))
> > +		return 0;
> 
> Will the core call us if MMC_CAP_UHS_SDR104 was not set?

Empirically, yes, that appears to be the case.


For all your other suggestions: thanks, I will update things as you suggest.
