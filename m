Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:43573 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965042AbeEXNWH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 09:22:07 -0400
Date: Thu, 24 May 2018 15:22:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
Message-ID: <20180524132202.GE24557@lunn.ch>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 24, 2018 at 02:11:53PM +0300, Vladimir Zapolskiy wrote:
> The change fixes a sleep in atomic context issue, which can be
> always triggered by running 'ethtool -r' command, because
> phy_start_aneg() protects phydev fields by a mutex.
> 
> Another note is that the change implicitly replaces phy_start_aneg()
> with a newer phy_restart_aneg().
> 
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
> -		error = phy_start_aneg(ndev->phydev);
> -		spin_unlock_irqrestore(&priv->lock, flags);
> -	}

Eck! phylib assumes thread context and takes a mutex while calling
into the PHY driver.

It would be good to add some sort of fixes: tag. Maybe for the commit
that added the generic nway_reset? That would at least cover some
stable kernels.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
