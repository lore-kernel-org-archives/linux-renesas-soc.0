Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:47515 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752272AbdLERzW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 12:55:22 -0500
Date: Tue, 5 Dec 2017 18:55:15 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] net: sh_eth: do not advertise Gigabit capabilities
 when not available
Message-ID: <20171205175515.GR12805@lunn.ch>
References: <20171205092952.3455-1-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171205092952.3455-1-thomas.petazzoni@free-electrons.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 05, 2017 at 10:29:52AM +0100, Thomas Petazzoni wrote:
> Not all variants of the sh_eth hardware have Gigabit
> support. Unfortunately, the current driver doesn't tell the PHY about
> the limited MAC capabilities. Due to this, if you have a Gigabit
> capable PHY, the PHY will advertise its Gigabit capability and
> establish a link at 1Gbit/s, even though the MAC doesn't support it.
> 
> In order to avoid this, we use the recently introduced
> phy_set_max_speed() to tell the PHY to not advertise speed higher than
> 100 MBit/s.
> 
> Tested on a SH7786 platform, with a Gigabit PHY.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
