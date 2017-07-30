Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:45102 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754509AbdG3RHl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 30 Jul 2017 13:07:41 -0400
Date: Sun, 30 Jul 2017 19:07:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ravb: add wake-on-lan support via magic packet
Message-ID: <20170730170738.GA29373@lunn.ch>
References: <20170730140646.11781-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170730140646.11781-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas

> @@ -2041,6 +2073,11 @@ static int ravb_probe(struct platform_device *pdev)
>  
>  	priv->chip_id = chip_id;
>  
> +	/* Get clock, if not found that's OK but Wake-On-Lan is unavailable */
> +	priv->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(priv->clk))
> +		priv->clk = NULL;

Can you get EPROBE_DEFER returned?

    Andrew
