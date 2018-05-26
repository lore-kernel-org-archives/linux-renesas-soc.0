Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:32818 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032170AbeEZQ4S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 May 2018 12:56:18 -0400
Received: by mail-wm0-f67.google.com with SMTP id x12-v6so36913869wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 May 2018 09:56:18 -0700 (PDT)
Subject: Re: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b3ede08c-f5f2-a0b2-8b2d-d4a2eec66e05@cogentembedded.com>
Date: Sat, 26 May 2018 19:56:15 +0300
MIME-Version: 1.0
In-Reply-To: <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   A formal patch review this time...

On 05/24/2018 02:11 PM, Vladimir Zapolskiy wrote:

> The change fixes a sleep in atomic context issue, which can be
> always triggered by running 'ethtool -r' command, because
> phy_start_aneg() protects phydev fields by a mutex.

   OK so far...

> Another note is that the change implicitly replaces phy_start_aneg()
> with a newer phy_restart_aneg().

   Why? Is this necessary to fix the BUG()?

> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 68f122140966..4a043eb0e2aa 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1150,21 +1150,6 @@ static int ravb_set_link_ksettings(struct net_device *ndev,
>  	return error;
>  }
>  
> -static int ravb_nway_reset(struct net_device *ndev)
> -{
> -	struct ravb_private *priv = netdev_priv(ndev);
> -	int error = -ENODEV;
> -	unsigned long flags;
> -
> -	if (ndev->phydev) {
> -		spin_lock_irqsave(&priv->lock, flags);

   OK, removing spin_lock_irqsave() fixes the BUG()...
   Not sure what we rotect against here anyway, MAC interrupts?

> -		error = phy_start_aneg(ndev->phydev);
> -		spin_unlock_irqrestore(&priv->lock, flags);
> -	}
> -
> -	return error;
> -}
> -
>  static u32 ravb_get_msglevel(struct net_device *ndev)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
> @@ -1377,7 +1362,7 @@ static int ravb_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
>  }
>  
>  static const struct ethtool_ops ravb_ethtool_ops = {
> -	.nway_reset		= ravb_nway_reset,
> +	.nway_reset		= phy_ethtool_nway_reset,

   What does this fix?

>  	.get_msglevel		= ravb_get_msglevel,
>  	.set_msglevel		= ravb_set_msglevel,
>  	.get_link		= ethtool_op_get_link,

MBR, Sergei
