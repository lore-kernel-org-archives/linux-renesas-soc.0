Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:43526 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751147AbeEPSVH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 14:21:07 -0400
Date: Wed, 16 May 2018 14:21:02 -0400 (EDT)
Message-Id: <20180516.142102.1650229402143291732.davem@davemloft.net>
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch,
        vivien.didelot@savoirfairelinux.com, nicolas.ferre@microchip.com,
        fugang.duan@nxp.com, sergei.shtylyov@cogentembedded.com,
        peppe.cavallaro@st.com, alexandre.torgue@st.com,
        joabreu@synopsys.com, grygorii.strashko@ti.com,
        woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        robh+dt@kernel.org, frowand.list@gmail.com,
        antoine.tenart@free-electrons.com, Tobias.Jordan@elektrobit.com,
        rmk+kernel@armlinux.org.uk, geert+renesas@glider.be,
        thomas.petazzoni@free-electrons.com,
        niklas.soderlund+renesas@ragnatech.se, horms+renesas@verge.net.au,
        muvarov@gmail.com, nsekhar@ti.com, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/2] of: mdio: Fall back to
 mdiobus_register() with NULL device_node
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180515235619.27773-1-f.fainelli@gmail.com>
References: <20180515235619.27773-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 15 May 2018 16:56:17 -0700

> This patch series updates of_mdiobus_register() such that when the device_node
> argument is NULL, it calls mdiobus_register() directly. This is consistent with
> the behavior of of_mdiobus_register() when CONFIG_OF=n.
> 
> I only converted the most obvious drivers, there are others that have a much
> less obvious behavior and specifically attempt to deal with CONFIG_ACPI.
> 
> Changes in v2:
> 
> - fixed build error in davincin_mdio.c (Grygorii)
> - reworked first patch a bit: commit message, subject and removed useless
>   code comment

Based upon Andrew's response to Geert's feedback, I'm applying this series.

Thanks.
