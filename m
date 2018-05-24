Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:43587 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965390AbeEXNar (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 09:30:47 -0400
Date: Thu, 24 May 2018 15:30:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/6] sh_eth: remove custom .nway_reset from ethtool ops
Message-ID: <20180524133044.GG24557@lunn.ch>
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-5-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527160318-10958-5-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 24, 2018 at 02:11:56PM +0300, Vladimir Zapolskiy wrote:
> The change fixes a sleep in atomic context issue, which can be
> always triggered by running 'ethtool -r' command, because
> phy_start_aneg() protects phydev fields by a mutex.
> 
> Another note is that the change implicitly replaces phy_start_aneg()
> with a newer phy_restart_aneg().
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
