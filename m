Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:38950 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932332AbeAKPsh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 10:48:37 -0500
Date: Thu, 11 Jan 2018 10:48:35 -0500 (EST)
Message-Id: <20180111.104835.381039264896352436.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: rmk+kernel@armlinux.org.uk, andrew@lunn.ch, f.fainelli@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
From: David Miller <davem@davemloft.net>
In-Reply-To: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue,  9 Jan 2018 12:11:21 +0100

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

I really want a resolution to this quickly, this broke lots of stuff
for people.

__phy_modify() wants to return multiple values, so it should be coded
up to do so explicitly rather than trying to encode two values from
overlapping value spaces in one return value.

That means the original value should be returned by-reference.  And
this will make the error/no-error return value unambiguous.

int __phy_modify(struct phy_device *phydev, u32 regnum, u16 mask, u16 set,
		 u16 *orig_val);

Thank you.
