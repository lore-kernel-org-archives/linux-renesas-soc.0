Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34054 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731110AbeGSPQN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jul 2018 11:16:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id f8-v6so7849989ljk.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jul 2018 07:32:46 -0700 (PDT)
Subject: Re: [PATCH/RFC 01/02] ravb: Do not announce 100Mbps HDX as supported
To: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <153200105784.13504.12882377600823578834.sendpatchset@little-apple>
 <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f7dad4b7-d1d6-3fcc-750d-deffc0e26717@cogentembedded.com>
Date: Thu, 19 Jul 2018 17:32:43 +0300
MIME-Version: 1.0
In-Reply-To: <153200106718.13504.7319401547888522726.sendpatchset@little-apple>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 07/19/2018 02:51 PM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
> 
> According to the data sheet the Ethernet-AVB hardware in R-Car Gen3
> and R-Car Gen2 SoCs do not support half duplex operation. So update
> the driver to mark 100Mbit HDX as unsupported.

   What about 1000Mbit HDX?

> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Written on top of renesas-drivers-2018-07-17-v4.18-rc5
> 
>  drivers/net/ethernet/renesas/ravb_main.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- 0001/drivers/net/ethernet/renesas/ravb_main.c
> +++ work/drivers/net/ethernet/renesas/ravb_main.c	2018-07-19 19:18:38.210607110 +0900
> @@ -1066,8 +1066,8 @@ static int ravb_phy_init(struct net_devi
>  		netdev_info(ndev, "limited PHY to 100Mbit/s\n");
>  	}
>  
> -	/* 10BASE is not supported */
> -	phydev->supported &= ~PHY_10BT_FEATURES;
> +	/* Nether 10BASE nor half duplex is supported */

   Neither. s/is/are/?

> +	phydev->supported &= ~(PHY_10BT_FEATURES | SUPPORTED_100baseT_Half);

   I think you missed SUPPORTED_1000baseT_Half.

[garbage skipped]

MBR, Sergei
