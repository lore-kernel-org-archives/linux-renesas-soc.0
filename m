Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 18 May 2017 11:21:45 -0400 (EDT)
Message-Id: <20170518.112145.1364316716714361952.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: andrew@lunn.ch, f.fainelli@gmail.com, robh+dt@kernel.org,
        frowand.list@gmail.com, thomas.petazzoni@free-electrons.com,
        sergei.shtylyov@cogentembedded.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] of_mdio: Fix broken PHY IRQ in case of probe deferral
From: David Miller <davem@davemloft.net>
In-Reply-To: <1495112345-24795-1-git-send-email-geert+renesas@glider.be>
References: <1495112345-24795-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Thu, 18 May 2017 14:59:05 +0200

> If an Ethernet PHY is initialized before the interrupt controller it is
> connected to, a message like the following is printed:
> 
>     irq: no irq domain found for /interrupt-controller@e61c0000 !
> 
> However, the actual error is ignored, leading to a non-functional (-1)
> PHY interrupt later:
> 
>     Micrel KSZ8041RNLI ee700000.ethernet-ffffffff:01: attached PHY driver [Micrel KSZ8041RNLI] (mii_bus:phy_addr=ee700000.ethernet-ffffffff:01, irq=-1)
> 
> Depending on whether the PHY driver will fall back to polling, Ethernet
> may or may not work.
> 
> To fix this:
>   1. Switch of_mdiobus_register_phy() from irq_of_parse_and_map() to
>      of_irq_get().
>      Unlike the former, the latter returns -EPROBE_DEFER if the
>      interrupt controller is not yet available, so this condition can be
>      detected.
>      Other errors are handled the same as before, i.e. use the passed
>      mdio->irq[addr] as interrupt.
>   2. Propagate and handle errors from of_mdiobus_register_phy() and
>      of_mdiobus_register_device().
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Florian or someone similarly knowledgable, please review.
