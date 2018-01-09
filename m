Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:33916 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752567AbeAIOKO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jan 2018 09:10:14 -0500
Date: Tue, 9 Jan 2018 15:10:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
Message-ID: <20180109141008.GD27447@lunn.ch>
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 09, 2018 at 12:11:21PM +0100, Geert Uytterhoeven wrote:
> In case of success, the return values of (__)phy_write() and
> (__)phy_modify() are not compatible: (__)phy_write() returns 0, while
> (__)phy_modify() returns the old PHY register value.
> 
> Apparently this change was catered for in drivers/net/phy/marvell.c, but
> not in other source files.
> 
> Hence genphy_restart_aneg() now returns 4416 instead zero, which is
> considered an error:
> 
>     ravb e6800000.ethernet eth0: failed to connect PHY
>     IP-Config: Failed to open eth0
>     IP-Config: No network devices available
> 
> Fix this by converting positive values to zero in all callers of
> phy_modify().
> 
> Fixes: fea23fb591cce995 ("net: phy: convert read-modify-write to phy_modify()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Alternatively, __phy_modify() could be changed to follow __phy_write()
> semantics?

Hi Geert, Russell

I took a quick look at the uses of phy_modify(). I don't see any uses
of the return code other than as an error indicator. So having it
return 0 on success seems like a better fix.

       Andrew
