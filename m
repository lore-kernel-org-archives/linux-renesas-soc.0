Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38810 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbeLKCBU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 21:01:20 -0500
Received: by mail-lf1-f65.google.com with SMTP id p86so9554443lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 18:01:18 -0800 (PST)
Date: Tue, 11 Dec 2018 03:01:15 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rcar-csi2: Fix PHTW table values for E3/V3M
Message-ID: <20181211020115.GK17972@bigcity.dyn.berto.se>
References: <1544453635-16359-1-git-send-email-jacopo+renesas@jmondi.org>
 <2063363.Wr8td8jMvS@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2063363.Wr8td8jMvS@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your feedback,

On 2018-12-10 22:16:52 +0200, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Monday, 10 December 2018 16:53:55 EET Jacopo Mondi wrote:
> > The PHTW selection algorithm implemented in rcsi2_phtw_write_mbps() checks
> > for lower bound of the interval used to match the desired bandwidth. Use
> > that in place of the currently used upport bound.
> 
> The rcsi2_phtw_write_mbps() function performs the following (error handling 
> removed):
> 
>         const struct rcsi2_mbps_reg *value;
> 
>         for (value = values; value->mbps; value++)
>                 if (value->mbps >= mbps)
>                         break;
> 
>         return rcsi2_phtw_write(priv, value->reg, code);
> 
> With this patch, an mbps value of 85 will match the second entry in the 
> phtw_mbps_v3m_e3 table:
> 
> [0]	{ .mbps =   80, .reg = 0x00 },
> [1]	{ .mbps =   90, .reg = 0x20 },
> ...
> 
> The datasheet however documents the range 80-89 to map to 0x00.
> 
> What am I missing ?

I'm afraid you are missing a issue with the original implementation of 
the rcar-csi2 driver (my fault). The issue you point out is a problem 
with the current freq selection logic not the tables themself which 
needs to be corrected.

This patch aligns the table with the other tables in the driver and is 
sound. A patch (Jacopo care to submit it?) is needed to resolve the 
faulty logic in the driver. It should select the range according to 
Laurents findings and not the range above it as the current code does.

> 
> > Fixes: 10c08812fe60 ("media: rcar: rcar-csi2: Update V3M/E3 PHTW tables")
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  drivers/media/platform/rcar-vin/rcar-csi2.c | 62 ++++++++++++-------------
> >  1 file changed, 31 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > b/drivers/media/platform/rcar-vin/rcar-csi2.c index
> > 80ad906d1136..7e9cb8bcfe70 100644
> > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > @@ -152,37 +152,37 @@ static const struct rcsi2_mbps_reg
> > phtw_mbps_h3_v3h_m3n[] = { };
> > 
> >  static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
> > -	{ .mbps =   89, .reg = 0x00 },
> > -	{ .mbps =   99, .reg = 0x20 },
> > -	{ .mbps =  109, .reg = 0x40 },
> > -	{ .mbps =  129, .reg = 0x02 },
> > -	{ .mbps =  139, .reg = 0x22 },
> > -	{ .mbps =  149, .reg = 0x42 },
> > -	{ .mbps =  169, .reg = 0x04 },
> > -	{ .mbps =  179, .reg = 0x24 },
> > -	{ .mbps =  199, .reg = 0x44 },
> > -	{ .mbps =  219, .reg = 0x06 },
> > -	{ .mbps =  239, .reg = 0x26 },
> > -	{ .mbps =  249, .reg = 0x46 },
> > -	{ .mbps =  269, .reg = 0x08 },
> > -	{ .mbps =  299, .reg = 0x28 },
> > -	{ .mbps =  329, .reg = 0x0a },
> > -	{ .mbps =  359, .reg = 0x2a },
> > -	{ .mbps =  399, .reg = 0x4a },
> > -	{ .mbps =  449, .reg = 0x0c },
> > -	{ .mbps =  499, .reg = 0x2c },
> > -	{ .mbps =  549, .reg = 0x0e },
> > -	{ .mbps =  599, .reg = 0x2e },
> > -	{ .mbps =  649, .reg = 0x10 },
> > -	{ .mbps =  699, .reg = 0x30 },
> > -	{ .mbps =  749, .reg = 0x12 },
> > -	{ .mbps =  799, .reg = 0x32 },
> > -	{ .mbps =  849, .reg = 0x52 },
> > -	{ .mbps =  899, .reg = 0x72 },
> > -	{ .mbps =  949, .reg = 0x14 },
> > -	{ .mbps =  999, .reg = 0x34 },
> > -	{ .mbps = 1049, .reg = 0x54 },
> > -	{ .mbps = 1099, .reg = 0x74 },
> > +	{ .mbps =   80, .reg = 0x00 },
> > +	{ .mbps =   90, .reg = 0x20 },
> > +	{ .mbps =  100, .reg = 0x40 },
> > +	{ .mbps =  110, .reg = 0x02 },
> > +	{ .mbps =  130, .reg = 0x22 },
> > +	{ .mbps =  140, .reg = 0x42 },
> > +	{ .mbps =  150, .reg = 0x04 },
> > +	{ .mbps =  170, .reg = 0x24 },
> > +	{ .mbps =  180, .reg = 0x44 },
> > +	{ .mbps =  200, .reg = 0x06 },
> > +	{ .mbps =  220, .reg = 0x26 },
> > +	{ .mbps =  240, .reg = 0x46 },
> > +	{ .mbps =  250, .reg = 0x08 },
> > +	{ .mbps =  270, .reg = 0x28 },
> > +	{ .mbps =  300, .reg = 0x0a },
> > +	{ .mbps =  330, .reg = 0x2a },
> > +	{ .mbps =  360, .reg = 0x4a },
> > +	{ .mbps =  400, .reg = 0x0c },
> > +	{ .mbps =  450, .reg = 0x2c },
> > +	{ .mbps =  500, .reg = 0x0e },
> > +	{ .mbps =  550, .reg = 0x2e },
> > +	{ .mbps =  600, .reg = 0x10 },
> > +	{ .mbps =  650, .reg = 0x30 },
> > +	{ .mbps =  700, .reg = 0x12 },
> > +	{ .mbps =  750, .reg = 0x32 },
> > +	{ .mbps =  800, .reg = 0x52 },
> > +	{ .mbps =  850, .reg = 0x72 },
> > +	{ .mbps =  900, .reg = 0x14 },
> > +	{ .mbps =  950, .reg = 0x34 },
> > +	{ .mbps = 1000, .reg = 0x54 },
> > +	{ .mbps = 1050, .reg = 0x74 },
> >  	{ .mbps = 1125, .reg = 0x16 },
> >  	{ /* sentinel */ },
> >  };
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
> 

-- 
Regards,
Niklas S�derlund
