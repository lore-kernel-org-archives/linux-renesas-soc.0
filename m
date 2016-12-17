Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:33080 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752695AbcLQVvE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Dec 2016 16:51:04 -0500
Received: by mail-lf0-f42.google.com with SMTP id c13so30789868lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Dec 2016 13:51:03 -0800 (PST)
Subject: Re: [PATCHv2 1/5] sh_eth: add generic wake-on-lan support via magic
 packet
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20161212160931.6478-1-niklas.soderlund+renesas@ragnatech.se>
 <20161212160931.6478-2-niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <079800f0-2e80-7a0b-01e2-51e09f05345c@cogentembedded.com>
Date: Sun, 18 Dec 2016 00:50:59 +0300
MIME-Version: 1.0
In-Reply-To: <20161212160931.6478-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/12/2016 07:09 PM, Niklas Söderlund wrote:

    Not the complete review yet, just some superficial comments.

> Add generic functionality to support Wake-on-Lan using MagicPacket which

    LAN.

> are supported by at least a few versions of sh_eth. Only add
> functionality for WoL, no specific sh_eth version are marked to support
> WoL yet.

[...]

> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 05b0dc5..87640b9 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
[...]
> @@ -3150,15 +3187,67 @@ static int sh_eth_drv_remove(struct platform_device *pdev)
[...]
> +static int sh_eth_wol_restore(struct net_device *ndev)
> +{
> +	struct sh_eth_private *mdp = netdev_priv(ndev);
> +	int ret;
> +
> +	napi_enable(&mdp->napi);
> +
> +	/* Disable MagicPacket */
> +	sh_eth_modify(ndev, ECMR, ECMR_PMDE, 0);
> +
> +	/* The device need to be reset to restore MagicPacket logic

    Needs.

[...]
> index d050f37..4ceed00 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.h
> +++ b/drivers/net/ethernet/renesas/sh_eth.h
> @@ -493,6 +493,7 @@ struct sh_eth_cpu_data {
>  	unsigned shift_rd0:1;	/* shift Rx descriptor word 0 right by 16 */
>  	unsigned rmiimode:1;	/* EtherC has RMIIMODE register */
>  	unsigned rtrate:1;	/* EtherC has RTRATE register */
> +	unsigned magic:1;	/* EtherC has ECMR.PMDE and ECSR.MPD */

    After looking at the SH7734/63 manuals it became obvious that PMDE was a 
result of typo, the bit is called MPDE actually, the current name doesn't make 
sense anyway. Care to fix?

MBR, Sergei
