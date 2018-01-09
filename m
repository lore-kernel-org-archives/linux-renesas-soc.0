Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:34543 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758469AbeAIOsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jan 2018 09:48:19 -0500
Date: Tue, 9 Jan 2018 15:48:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: phy: Fix phy_modify() semantic difference fallout
Message-ID: <20180109144813.GC724@lunn.ch>
References: <1515496281-10988-1-git-send-email-geert+renesas@glider.be>
 <20180109141008.GD27447@lunn.ch>
 <20180109142248.GG17719@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109142248.GG17719@n2100.armlinux.org.uk>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> > I took a quick look at the uses of phy_modify(). I don't see any uses
> > of the return code other than as an error indicator. So having it
> > return 0 on success seems like a better fix.
> 
> I'd like to avoid that, because I don't want to have yet another
> accessor that needs to be used for advertisment modification (where
> we need to know if we changed any bits.)
> 
> That's why this accessor returns the old value.

Hi Russell

where exactly is this use case? I've not found it yet.

I can understand your argument. But how long it is going to take us to
find all the breakage because the return value has changed meaning?

The trade off is adding yet another accessor vs debugging and fixing
the repercussions.

I think i prefer not breaking existing code.

  Andrew
