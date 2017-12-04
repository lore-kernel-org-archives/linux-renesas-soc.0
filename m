Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:38093 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752320AbdLDRnC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 12:43:02 -0500
Received: by mail-lf0-f65.google.com with SMTP id e137so20158929lfg.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 09:43:01 -0800 (PST)
Subject: Re: [PATCH] net: sh_eth: do not advertise Gigabit capabilities when
 not available
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204141346.17410-1-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <018f1129-826b-ecd7-9b71-b720706aa930@cogentembedded.com>
Date: Mon, 4 Dec 2017 20:42:57 +0300
MIME-Version: 1.0
In-Reply-To: <20171204141346.17410-1-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2017 05:13 PM, Thomas Petazzoni wrote:

> Not all variants of the sh_eth hardware have Gigabit
> support. Unfortunately, the current driver doesn't update
> phydev->supported depending on the MAC capabilities. Due to this, if
> you have a Gigabit capable PHY, the PHY will advertise its Gigabit
> capability and establish a link at 1Gbit/s, even though the MAC
> doesn't support it.
> 
> In order to avoid this, we mark phydev->supported if we're running a
> non-Gigabit capable hardware.
> 
> Tested on a SH7786 platform, with a Gigabit PHY.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   drivers/net/ethernet/renesas/sh_eth.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index db72d13cebb9..0074c5998481 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -1892,6 +1892,11 @@ static int sh_eth_phy_init(struct net_device *ndev)
>   		return PTR_ERR(phydev);
>   	}
>   
> +	/* mask with MAC supported features */
> +	if (mdp->cd->register_type != SH_ETH_REG_GIGABIT)
> +		phydev->supported &= PHY_BASIC_FEATURES;
> +	phydev->advertising = phydev->supported;
> +

    Um, looking at this again, I think we have phy_set_max_speed() for that 
kind of stuff now...

[...]

MBR, Sergei
