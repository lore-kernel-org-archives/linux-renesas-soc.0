Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:33192 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752188AbdFLOZl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 10:25:41 -0400
Date: Mon, 12 Jun 2017 10:25:25 -0400 (EDT)
Message-Id: <20170612.102525.1159274040679939960.davem@davemloft.net>
To: yuval.shaia@oracle.com
Cc: michael.chan@broadcom.com, f.fainelli@gmail.com,
        siva.kallam@broadcom.com, prashant@broadcom.com,
        madalin.bucur@nxp.com, leoli@freescale.com,
        sebastian.hesselbarth@gmail.com,
        sergei.shtylyov@cogentembedded.com, grygorii.strashko@ti.com,
        w-kwok2@ti.com, m-karicheri2@ti.com, andrew@lunn.ch,
        woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        vivien.didelot@savoirfairelinux.com, arnd@arndb.de,
        tremyfr@gmail.com, jarod@redhat.com, horms+renesas@verge.net.au,
        kazuya.mizuguchi.ks@renesas.com, dan.carpenter@oracle.com,
        niklas.soderlund+renesas@ragnatech.se, johan@kernel.org,
        masaru.nagai.vx@renesas.com, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com,
        ivan.khoronzhuk@linaro.org, mugunthanvnm@ti.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] net: phy: Make phy_ethtool_ksettings_get return void
From: David Miller <davem@davemloft.net>
In-Reply-To: <20170612141508.29229-1-yuval.shaia@oracle.com>
References: <20170612141508.29229-1-yuval.shaia@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yuval Shaia <yuval.shaia@oracle.com>
Date: Mon, 12 Jun 2017 17:15:08 +0300

> Make return value void since function never return meaningfull value
> 
> Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> ---
> v0 ->v1:
> 	* These files were missing in v0
> 		* drivers/net/ethernet/renesas/ravb_main.c
> 		* drivers/net/ethernet/renesas/sh_eth.c
> 		* drivers/net/ethernet/ti/netcp_ethss.c
> 	* Add Acked-by: Sergei Shtylyov
> v1 -> v2:
> 	* Adjust to net-next tree

Applied, thank you.
