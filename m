Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:43591 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965390AbeEXNbW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 09:31:22 -0400
Date: Thu, 24 May 2018 15:31:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/6] sh_eth: remove custom .get_link_ksettings from
 ethtool ops
Message-ID: <20180524133118.GH24557@lunn.ch>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160484-11087-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527160484-11087-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 24, 2018 at 02:14:43PM +0300, Vladimir Zapolskiy wrote:
> The change replaces a custom implementation of .get_link_ksettings
> callback with a shared phy_ethtool_get_link_ksettings(), note that
> &priv->lock wrapping is not needed, because the lock does not
> serialize access to phydev fields.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
