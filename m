Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:37508 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757997AbeAISbd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jan 2018 13:31:33 -0500
Date: Tue, 9 Jan 2018 18:31:16 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
Message-ID: <20180109183116.GN17719@n2100.armlinux.org.uk>
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
 <20180109141008.GD27447@lunn.ch>
 <20180109142248.GG17719@n2100.armlinux.org.uk>
 <CAMuHMdXBasJu-u54LxT3x3fXcnW4Bm9N1nNyt-S=R5+=3oZaDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXBasJu-u54LxT3x3fXcnW4Bm9N1nNyt-S=R5+=3oZaDA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 09, 2018 at 07:25:40PM +0100, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> On Tue, Jan 9, 2018 at 3:22 PM, Russell King - ARM Linux
> <linux@armlinux.org.uk> wrote:
> > On Tue, Jan 09, 2018 at 03:10:08PM +0100, Andrew Lunn wrote:
> >> On Tue, Jan 09, 2018 at 12:11:21PM +0100, Geert Uytterhoeven wrote:
> >> > In case of success, the return values of (__)phy_write() and
> >> > (__)phy_modify() are not compatible: (__)phy_write() returns 0, while
> >> > (__)phy_modify() returns the old PHY register value.
> >> >
> >> > Apparently this change was catered for in drivers/net/phy/marvell.c, but
> >> > not in other source files.
> >> >
> >> > Hence genphy_restart_aneg() now returns 4416 instead zero, which is
> >> > considered an error:
> >> >
> >> >     ravb e6800000.ethernet eth0: failed to connect PHY
> >> >     IP-Config: Failed to open eth0
> >> >     IP-Config: No network devices available
> >> >
> >> > Fix this by converting positive values to zero in all callers of
> >> > phy_modify().
> >> >
> >> > Fixes: fea23fb591cce995 ("net: phy: convert read-modify-write to phy_modify()")
> >> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> > ---
> >> > Alternatively, __phy_modify() could be changed to follow __phy_write()
> >> > semantics?
> >>
> >> Hi Geert, Russell
> >>
> >> I took a quick look at the uses of phy_modify(). I don't see any uses
> >> of the return code other than as an error indicator. So having it
> >> return 0 on success seems like a better fix.
> >
> > I'd like to avoid that, because I don't want to have yet another
> > accessor that needs to be used for advertisment modification (where
> > we need to know if we changed any bits.)
> >
> > That's why this accessor returns the old value.
> 
> But this is documented nowhere!
> 
> I believe there are no current users of (__)phy_modify() that rely on this
> behavior.  Except perhaps phy_restore_page(), which I don't understand at all.
> 
> BTW, I think phy_restore_page() may return a strict positive value as well,
> thus breaking m88e1318_set_wol(), which is not supposed to return strict
> positive values.

Correct, and it has to for temperature reading in marvell.c to work.

> So changing __phy_modify() to return zero on success seems like the way
> forward...

So what do we call an accessor that returns the original value?

__phy_modify_return_old_value()

bit long-winded isn't it?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
