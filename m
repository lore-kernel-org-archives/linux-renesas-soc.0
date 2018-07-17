Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:44774 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731667AbeGQNvJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 09:51:09 -0400
Received: by mail-lf0-f67.google.com with SMTP id g6-v6so803110lfb.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jul 2018 06:18:30 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 17 Jul 2018 15:18:28 +0200
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 4/4] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180717131828.GI10087@bigcity.dyn.berto.se>
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se>
 <20180705141841.11121-5-niklas.soderlund+renesas@ragnatech.se>
 <20180712125722.q7b3q7ghh7hdm7jf@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180712125722.q7b3q7ghh7hdm7jf@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

Thanks for your feedback.

On 2018-07-12 14:57:22 +0200, Simon Horman wrote:
> On Thu, Jul 05, 2018 at 04:18:41PM +0200, Niklas S�derlund wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > 
> > Checking for SCC error during retuning is unnecessary.
> > 
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > [Niklas: fix small style issue]
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  drivers/mmc/host/renesas_sdhi_core.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> > index 589da18bd636c2f4..ef711c532a26babe 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -445,6 +445,13 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
> >  {
> >  	struct renesas_sdhi *priv = host_to_priv(host);
> >  
> > +	if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
> > +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200))
> > +		return false;
> > +
> > +	if (host->mmc->doing_retune)
> > +		return false;
> > +
> 
> I believe this patch needs to be updaed now that HS400 support has
> been merged.

Thanks I missed that HS400 had been merged, will update for next 
version.

> 
> >  	/* Check SCC error */
> >  	if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
> >  	    SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &&
> > -- 
> > 2.17.0
> > 

-- 
Regards,
Niklas S�derlund
