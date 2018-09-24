Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:43627 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727565AbeIXVxU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Sep 2018 17:53:20 -0400
Date: Mon, 24 Sep 2018 17:50:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Simon Horman <horms@verge.net.au>
Cc: David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next 07/12] net: ethernet: Add helper to remove a
 supported link mode
Message-ID: <20180924155023.GB10667@lunn.ch>
References: <20180917151302.l6mzzy5xmqlbgejj@verge.net.au>
 <20180917153811.GE5458@lunn.ch>
 <20180918105817.z2o5yybcth7diqsu@verge.net.au>
 <20180918130236.GB29092@lunn.ch>
 <20180919074557.vixjj3rg76ayy3k7@verge.net.au>
 <20180919123200.GB26940@lunn.ch>
 <20180920080506.qxiy2zeg6xd3xxfz@verge.net.au>
 <20180920125106.GA13632@lunn.ch>
 <20180921081735.z3stog3evjh4m7dx@verge.net.au>
 <20180924153559.kbs6v6o3sj5uenyp@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180924153559.kbs6v6o3sj5uenyp@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 24, 2018 at 05:36:00PM +0200, Simon Horman wrote:
> On Fri, Sep 21, 2018 at 10:17:35AM +0200, Simon Horman wrote:
> > On Thu, Sep 20, 2018 at 02:51:06PM +0200, Andrew Lunn wrote:
> > > > eth0: no link
> > > >   registers for MII PHY 0: 
> > > >     1140 7949 0022 1622 0981 c1e1 000d 0000
> > > 
> > > Hi Simon
> > > 
> > > The ID registers 0022 1622 indicate this is a Micrel KSZ9031.
> > > Are you using the micrel PHY driver?
> > 
> > 
> > Yes, when the Link is successfully negotiated I see:
> > 
> > Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=e6800000.ethernet-ffffffff:00, irq=204)
> > 
> > > > I note a difference in the 3rd line of hex output: 7002 vs 6002
> > > > but I am unsure if that is relevant.
> > > 
> > > Register 20, or 0x14. The datasheet says "Reserved" and there is no
> > > description given :-(
> > > 
> > > I will decode the other registers and see if i can find anything.
> > 
> > Thanks, very much appreciated.
> > 
> > I believe your patch to disable Asym_Pause solves the immediate
> > problem I have observed.
> 
> Andrew, how would you like to resolve this?
> Let me know how I can help.

Hi Simon

I submitted it to netdev in the usual way. I hope DaveM will accept
and merge it.

    Andrew
