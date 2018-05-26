Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36506 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032315AbeEZTux (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 May 2018 15:50:53 -0400
Received: by mail-wr0-f194.google.com with SMTP id k5-v6so14323284wrn.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 May 2018 12:50:52 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 3/6] ravb: remove custom .set_link_ksettings from ethtool
 ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-4-git-send-email-vladimir_zapolskiy@mentor.com>
Message-ID: <ab7d62f4-75eb-a58a-69ff-4ca8c1ece36b@cogentembedded.com>
Date: Sat, 26 May 2018 22:50:49 +0300
MIME-Version: 1.0
In-Reply-To: <1527160318-10958-4-git-send-email-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/24/2018 02:11 PM, Vladimir Zapolskiy wrote:

> The change replaces a custom implementation of .set_link_ksettings
> callback with a shared phy_ethtool_set_link_ksettings(), this fixes
> sleep in atomic context bug, which is encountered every time when link
> settings are changed by ethtool.

   Seeing it now...

> Now duplex mode setting is enforced in ravb_adjust_link() only, also
> now TX/RX is disabled when link is put down or modifications to E-MAC
> registers ECMR and GECMR are expected for both cases of checked and
> ignored link status pin state from E-MAC interrupt handler.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 58 +++++++++-----------------------
>  1 file changed, 15 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 3d91caa44176..0d811c02ff34 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -980,6 +980,13 @@ static void ravb_adjust_link(struct net_device *ndev)
>  	struct ravb_private *priv = netdev_priv(ndev);
>  	struct phy_device *phydev = ndev->phydev;
>  	bool new_state = false;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +
> +	/* Disable TX and RX right over here, if E-MAC change is ignored */
> +	if (priv->no_avb_link)
> +		ravb_rcv_snd_disable(ndev);
>  
>  	if (phydev->link) {
>  		if (phydev->duplex != priv->duplex) {
> @@ -997,18 +1004,21 @@ static void ravb_adjust_link(struct net_device *ndev)
>  			ravb_modify(ndev, ECMR, ECMR_TXF, 0);
>  			new_state = true;
>  			priv->link = phydev->link;
> -			if (priv->no_avb_link)
> -				ravb_rcv_snd_enable(ndev);
>  		}
>  	} else if (priv->link) {
>  		new_state = true;
>  		priv->link = 0;
>  		priv->speed = 0;
>  		priv->duplex = -1;
> -		if (priv->no_avb_link)
> -			ravb_rcv_snd_disable(ndev);
>  	}
>  
> +	/* Enable TX and RX right over here, if E-MAC change is ignored */
> +	if (priv->no_avb_link && phydev->link)
> +		ravb_rcv_snd_enable(ndev);
> +
> +	mmiowb();
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +

   I like this part. :-)

>  	if (new_state && netif_msg_link(priv))
>  		phy_print_status(phydev);
>  }
> @@ -1096,44 +1106,6 @@ static int ravb_phy_start(struct net_device *ndev)
>  	return 0;
>  }
>  
> -static int ravb_set_link_ksettings(struct net_device *ndev,
> -				   const struct ethtool_link_ksettings *cmd)
> -{
> -	struct ravb_private *priv = netdev_priv(ndev);
> -	unsigned long flags;
> -	int error;
> -
> -	if (!ndev->phydev)
> -		return -ENODEV;
> -
> -	spin_lock_irqsave(&priv->lock, flags);
> -
> -	/* Disable TX and RX */
> -	ravb_rcv_snd_disable(ndev);
> -
> -	error = phy_ethtool_ksettings_set(ndev->phydev, cmd);
> -	if (error)
> -		goto error_exit;
> -
> -	if (cmd->base.duplex == DUPLEX_FULL)
> -		priv->duplex = 1;
> -	else
> -		priv->duplex = 0;
> -
> -	ravb_set_duplex(ndev);
> -
> -error_exit:
> -	mdelay(1);
> -
> -	/* Enable TX and RX */
> -	ravb_rcv_snd_enable(ndev);
> -
> -	mmiowb();
> -	spin_unlock_irqrestore(&priv->lock, flags);
> -
> -	return error;
> -}
> -

   But this part is clearly lumping it all together... 

[...]
> @@ -1357,7 +1329,7 @@ static const struct ethtool_ops ravb_ethtool_ops = {
>  	.set_ringparam		= ravb_set_ringparam,
>  	.get_ts_info		= ravb_get_ts_info,
>  	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
> -	.set_link_ksettings	= ravb_set_link_ksettings,
> +	.set_link_ksettings	= phy_ethtool_set_link_ksettings,

   Should have been a part of the final patch in the fix/enhancement chain...

>  	.get_wol		= ravb_get_wol,
>  	.set_wol		= ravb_set_wol,
>  };

MBR, Sergei
