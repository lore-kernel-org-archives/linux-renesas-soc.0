Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35464 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbeGRNA4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 09:00:56 -0400
Received: by mail-lj1-f193.google.com with SMTP id p10-v6so3923721ljg.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jul 2018 05:23:15 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Wed, 18 Jul 2018 14:23:13 +0200
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 4/4] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180718122313.GS10087@bigcity.dyn.berto.se>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-5-niklas.soderlund+renesas@ragnatech.se>
 <20180718085408.eydhelufuhgtyhxj@verge.net.au>
 <20180718094629.ttdsuzj6nxacvv3a@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180718094629.ttdsuzj6nxacvv3a@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 2018-07-18 11:46:29 +0200, Wolfram Sang wrote:
> On Wed, Jul 18, 2018 at 10:54:08AM +0200, Simon Horman wrote:
> > Hi Niklas,
> > 
> > On Tue, Jul 17, 2018 at 04:52:16PM +0200, Niklas S�derlund wrote:
> > > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > > 
> > > Checking for SCC error during retuning is unnecessary.
> > > 
> > > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > > [Niklas: fix small style issue]
> > > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Sorry, Niklas, I got confused with the messages, that's my fault. I want
> to revoke my tags here which were meant for another patch in your
> series. I actually wanted to write a comment about...

No problem, I think I need to do some more work on it as Simon pointed 
out more work is needed for HS400.

> 
> > > 
> > > ---
> > > 
> > > * Changes since v2
> > > - Added check for HS400 as it's now merged.
> > > - Added tags from Wolfram.
> > > ---
> > >  drivers/mmc/host/renesas_sdhi_core.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> > > index 777e32b0e410e850..a21b347424f67c52 100644
> > > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > > @@ -444,6 +444,14 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
> > >  {
> > >  	struct renesas_sdhi *priv = host_to_priv(host);
> > >  
> > > +	if (!(host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) &&
> > > +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS200) &&
> > > +	    !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
> > 
> > According to the BSP this needs to differentiate between 4tap and 8tap
> > variants of HS400 support.
> 
> ... checking exactly this.
> 



-- 
Regards,
Niklas S�derlund
