Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:40970 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933191AbeAKPxd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jan 2018 10:53:33 -0500
Date: Thu, 11 Jan 2018 15:53:16 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: David Miller <davem@davemloft.net>
Cc: geert+renesas@glider.be, andrew@lunn.ch, f.fainelli@gmail.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
Message-ID: <20180111155316.GV17719@n2100.armlinux.org.uk>
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
 <20180111.104835.381039264896352436.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180111.104835.381039264896352436.davem@davemloft.net>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 11, 2018 at 10:48:35AM -0500, David Miller wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Date: Tue,  9 Jan 2018 12:11:21 +0100
> 
> > In case of success, the return values of (__)phy_write() and
> > (__)phy_modify() are not compatible: (__)phy_write() returns 0, while
> > (__)phy_modify() returns the old PHY register value.
> > 
> > Apparently this change was catered for in drivers/net/phy/marvell.c, but
> > not in other source files.
> > 
> > Hence genphy_restart_aneg() now returns 4416 instead zero, which is
> > considered an error:
> > 
> >     ravb e6800000.ethernet eth0: failed to connect PHY
> >     IP-Config: Failed to open eth0
> >     IP-Config: No network devices available
> > 
> > Fix this by converting positive values to zero in all callers of
> > phy_modify().
> > 
> > Fixes: fea23fb591cce995 ("net: phy: convert read-modify-write to phy_modify()")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Alternatively, __phy_modify() could be changed to follow __phy_write()
> > semantics?
> 
> I really want a resolution to this quickly, this broke lots of stuff
> for people.
> 
> __phy_modify() wants to return multiple values, so it should be coded
> up to do so explicitly rather than trying to encode two values from
> overlapping value spaces in one return value.
> 
> That means the original value should be returned by-reference.  And
> this will make the error/no-error return value unambiguous.
> 
> int __phy_modify(struct phy_device *phydev, u32 regnum, u16 mask, u16 set,
> 		 u16 *orig_val);

I'm sorry I have no time to work on this right now due to the meltdown
and spectre stuff that hit last week.  If you need to do something,
please revert both the mvneta series and the series containing this
patch.

Thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
