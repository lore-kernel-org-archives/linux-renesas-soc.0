Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34517 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754314AbdG3Tv7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jul 2017 15:51:59 -0400
Received: by mail-lf0-f43.google.com with SMTP id g25so102919258lfh.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Jul 2017 12:51:58 -0700 (PDT)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Sun, 30 Jul 2017 21:51:54 +0200
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ravb: add wake-on-lan support via magic packet
Message-ID: <20170730195154.GE1382@bigcity.dyn.berto.se>
References: <20170730140646.11781-1-niklas.soderlund+renesas@ragnatech.se>
 <20170730170738.GA29373@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170730170738.GA29373@lunn.ch>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Andrew,

On 2017-07-30 19:07:38 +0200, Andrew Lunn wrote:
> Hi Niklas
> 
> > @@ -2041,6 +2073,11 @@ static int ravb_probe(struct platform_device *pdev)
> >  
> >  	priv->chip_id = chip_id;
> >  
> > +	/* Get clock, if not found that's OK but Wake-On-Lan is unavailable */
> > +	priv->clk = devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(priv->clk))
> > +		priv->clk = NULL;
> 
> Can you get EPROBE_DEFER returned?

I don't think so, but I'm not sure :-)

The clock I'm trying to get is the module clock of the ravb itself, so 
if that clock is not available (and enabled) no register writes to the 
ravb would be possible in the first place, so i guess it's safe to 
assume -EPROBE_DEFER can not happen here?

I'm just trying to play it safe here since the clock is only needed to 
support WoL, I though it best to not change behavior here. Try to get 
the clock, if we can great we can do WoL if not then user-space will be 
prevented from enabling WoL and nothing in the current behavior changes.

> 
>     Andrew

-- 
Regards,
Niklas S�derlund
