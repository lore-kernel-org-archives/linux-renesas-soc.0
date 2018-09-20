Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:39970 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387701AbeITSej (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 14:34:39 -0400
Date: Thu, 20 Sep 2018 14:51:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Simon Horman <horms@verge.net.au>
Cc: David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 net-next 07/12] net: ethernet: Add helper to remove a
 supported link mode
Message-ID: <20180920125106.GA13632@lunn.ch>
References: <1536709999-13420-1-git-send-email-andrew@lunn.ch>
 <1536709999-13420-8-git-send-email-andrew@lunn.ch>
 <20180917151302.l6mzzy5xmqlbgejj@verge.net.au>
 <20180917153811.GE5458@lunn.ch>
 <20180918105817.z2o5yybcth7diqsu@verge.net.au>
 <20180918130236.GB29092@lunn.ch>
 <20180919074557.vixjj3rg76ayy3k7@verge.net.au>
 <20180919123200.GB26940@lunn.ch>
 <20180920080506.qxiy2zeg6xd3xxfz@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180920080506.qxiy2zeg6xd3xxfz@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> eth0: no link
>   registers for MII PHY 0: 
>     1140 7949 0022 1622 0981 c1e1 000d 0000

Hi Simon

The ID registers 0022 1622 indicate this is a Micrel KSZ9031.
Are you using the micrel PHY driver?

> I note a difference in the 3rd line of hex output: 7002 vs 6002
> but I am unsure if that is relevant.

Register 20, or 0x14. The datasheet says "Reserved" and there is no
description given :-(

I will decode the other registers and see if i can find anything.

    Andrew
