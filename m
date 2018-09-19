Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42081 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbeISNWn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 09:22:43 -0400
Date: Wed, 19 Sep 2018 09:45:58 +0200
From: Simon Horman <horms@verge.net.au>
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next 07/12] net: ethernet: Add helper to remove a
 supported link mode
Message-ID: <20180919074557.vixjj3rg76ayy3k7@verge.net.au>
References: <1536709999-13420-1-git-send-email-andrew@lunn.ch>
 <1536709999-13420-8-git-send-email-andrew@lunn.ch>
 <20180917151302.l6mzzy5xmqlbgejj@verge.net.au>
 <20180917153811.GE5458@lunn.ch>
 <20180918105817.z2o5yybcth7diqsu@verge.net.au>
 <20180918130236.GB29092@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180918130236.GB29092@lunn.ch>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[CC Sergei, linux-renesas-soc]

On Tue, Sep 18, 2018 at 03:02:36PM +0200, Andrew Lunn wrote:
> > Hi Andrew,
> 
> Hi Simon
> 
> Thanks for the dumps
>  
> > 1. net-next: cf7d97e1e54d ("net: mdio: remove duplicated include from mdio_bus.c")
> > 
> >   basic status: no link
> >   capabilities: 1000baseT-HD 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
> >   advertising:  100baseTx-FD 100baseTx-HD flow-control
> >   link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
> > 
> > 2. net-next with this patch reverted
> > 
> >   basic status: autonegotiation complete, link ok
> >   capabilities: 1000baseT-HD 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
> >   advertising:  100baseTx-FD 100baseTx-HD
> >   link partner: 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
> 
> So flow-control is not present here.
> 
> >   basic status: autonegotiation complete, link ok
> >   capabilities: 1000baseT-HD 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
> >   advertising:  100baseTx-FD 100baseTx-HD
> >   link partner: 1000baseT-FD 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
> 
> And here also.

Thanks for raising this, I noticed it too.

> Looking at the code, i see:
> 
> /* E-MAC init function */
> static void ravb_emac_init(struct net_device *ndev)
> {
>         struct ravb_private *priv = netdev_priv(ndev);
> 
>         /* Receive frame limit set register */
>         ravb_write(ndev, ndev->mtu + ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN, RFLR);
> 
>         /* EMAC Mode: PAUSE prohibition; Duplex; RX Checksum; TX; RX */
>         ravb_write(ndev, ECMR_ZPF | (priv->duplex ? ECMR_DM : 0) |
>                    (ndev->features & NETIF_F_RXCSUM ? ECMR_RCSC : 0) |
>                    ECMR_TE | ECMR_RE, ECMR);
> 
> Does this mean Pause is not supported in the hardware?

According to my reading of the documentation Pause is supported by the
hardware and the above code seems to conflict with the comment (possibly
both the code and comment predate the current documentation). My reading of
the documentation is that the above unconditionally _enables_ receiving and
sending Pause frames with time parameter value 0.
