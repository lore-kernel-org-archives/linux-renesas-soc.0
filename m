Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33848 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752410AbdLETCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 14:02:24 -0500
Received: by mail-lf0-f67.google.com with SMTP id x20so1531322lff.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Dec 2017 11:02:23 -0800 (PST)
Subject: Re: [PATCH v2] net: sh_eth: do not advertise Gigabit capabilities
 when not available
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171205092952.3455-1-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <efb99078-3156-666b-0b7e-6c2d1976c89f@cogentembedded.com>
Date: Tue, 5 Dec 2017 22:02:20 +0300
MIME-Version: 1.0
In-Reply-To: <20171205092952.3455-1-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/05/2017 12:29 PM, Thomas Petazzoni wrote:

> Not all variants of the sh_eth hardware have Gigabit
> support. Unfortunately, the current driver doesn't tell the PHY about
> the limited MAC capabilities. Due to this, if you have a Gigabit
> capable PHY, the PHY will advertise its Gigabit capability and
> establish a link at 1Gbit/s, even though the MAC doesn't support it.
> 
> In order to avoid this, we use the recently introduced
> phy_set_max_speed() to tell the PHY to not advertise speed higher than
> 100 MBit/s.
> 
> Tested on a SH7786 platform, with a Gigabit PHY.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>   - Use phy_set_max_speed(), as suggested by Sergei Shtylyov
>     <sergei.shtylyov@cogentembedded.com>.
> ---
>   drivers/net/ethernet/renesas/sh_eth.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index db72d13cebb9..44ff2835c954 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
[...]
> @@ -1892,9 +1893,22 @@ static int sh_eth_phy_init(struct net_device *ndev)
>   		return PTR_ERR(phydev);
>   	}
>   
> +	/* mask with MAC supported features */
> +	if (mdp->cd->register_type != SH_ETH_REG_GIGABIT) {
> +		err = phy_set_max_speed(phydev, SPEED_100);
> +		if (err) {
> +			netdev_err(ndev, "failed to limit PHY to 100 Mbit/s\n");
> +			goto err_phy_disconnect;

    Er, why do we need a *goto* here at all? Just call phy_disconnect() here 
and be done with that...

> +		}
> +	}
> +
>   	phy_attached_info(phydev);
>   
>   	return 0;
> +
> +err_phy_disconnect:
> +	phy_disconnect(phydev);
> +	return err;
>   }
>   
>   /* PHY control start function */

MBR, Sergei
