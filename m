Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57640 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbeITNrh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 09:47:37 -0400
Date: Thu, 20 Sep 2018 10:05:12 +0200
From: Simon Horman <horms@verge.net.au>
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next 07/12] net: ethernet: Add helper to remove a
 supported link mode
Message-ID: <20180920080506.qxiy2zeg6xd3xxfz@verge.net.au>
References: <1536709999-13420-1-git-send-email-andrew@lunn.ch>
 <1536709999-13420-8-git-send-email-andrew@lunn.ch>
 <20180917151302.l6mzzy5xmqlbgejj@verge.net.au>
 <20180917153811.GE5458@lunn.ch>
 <20180918105817.z2o5yybcth7diqsu@verge.net.au>
 <20180918130236.GB29092@lunn.ch>
 <20180919074557.vixjj3rg76ayy3k7@verge.net.au>
 <20180919123200.GB26940@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180919123200.GB26940@lunn.ch>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 19, 2018 at 02:32:00PM +0200, Andrew Lunn wrote:
> > > And here also.
> > 
> > Thanks for raising this, I noticed it too.
> > 
> > > Looking at the code, i see:
> > > 
> > > /* E-MAC init function */
> > > static void ravb_emac_init(struct net_device *ndev)
> > > {
> > >         struct ravb_private *priv = netdev_priv(ndev);
> > > 
> > >         /* Receive frame limit set register */
> > >         ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
> > > 
> > >         /* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
> > >         ravb_write(ndev, ECMR_ZPF | (priv->duplex ? ECMR_DM : 0) |
> > >                    (ndev->features & NETIF_F_RXCSUM ? ECMR_RCSC : 0) |
> > >                    ECMR_TE | ECMR_RE, ECMR);
> > > 
> > > Does this mean Pause is not supported in the hardware?
> > 
> > According to my reading of the documentation Pause is supported by the
> > hardware and the above code seems to conflict with the comment (possibly
> > both the code and comment predate the current documentation). My reading of
> > the documentation is that the above unconditionally _enables_ receiving and
> > sending Pause frames with time parameter value 0.
> 
> Hi Simon
> 
> We should first prove that this additional Pause is causing the
> issue. After that, we can decide if we want to add Pause support to
> the driver. Please could you test this patch.

Hi Andrew,

thanks for your patch. I agree with the approach you have taken here,
however, unfortunately this patch does not seem to resolve the problem that
I have observed.

With this patch on top of net-next ([1] & [2]) I see:

[1] net-next as of two days ago, the version used when reporting
    results earlier in this thread
    cf7d97e1e54d ("net: mdio: remove duplicated include from mdio_bus.c")

# mii-tool -vv eth0
Using SIOCGMIIPHY=0x8947
eth0: no link
  registers for MII PHY 0: 
    1140 7949 0022 1622 0981 c1e1 000d 0000
    0000 0300 0000 0000 0000 0000 0000 3000
    0000 0000 0000 0000 7002 0000 0000 0200
    0000 0000 0000 0500 0000 0000 0000 0000
  product info: vendor 00:08:85, model 34 rev 2
  basic mode:   autonegotiation enabled
  basic status: no link
  capabilities: 1000baseT-HD 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  advertising:  100baseTx-FD 100baseTx-HD
  link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD

[2] net-next as of this morning
    faa08325b429 ("isdn/hisax: Remove unnecessary parenthesis")

# mii-tool -vv eth0
Using SIOCGMIIPHY=0x8947
eth0: no link
  registers for MII PHY 0: 
    1140 7949 0022 1622 0981 c1e1 000d 0000
    0000 0300 0000 0000 0000 0000 0000 3000
    0000 0000 0000 0000 6002 0000 0000 0200
    0000 0000 0000 0500 0000 0000 0000 0000
  product info: vendor 00:08:85, model 34 rev 2
  basic mode:   autonegotiation enabled
  basic status: no link
  capabilities: 1000baseT-HD 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  advertising:  100baseTx-FD 100baseTx-HD
  link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD

I note a difference in the 3rd line of hex output: 7002 vs 6002
but I am unsure if that is relevant.
