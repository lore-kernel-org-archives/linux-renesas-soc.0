Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:40412 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752229AbdLDUF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 15:05:28 -0500
Received: by mail-lf0-f66.google.com with SMTP id t197so20598850lfe.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 12:05:27 -0800 (PST)
Subject: Re: [PATCH 1/2] net: sh_eth: use correct "struct device" when calling
 DMA mapping functions
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
 <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <607df840-613e-b86c-2224-43815b50627c@cogentembedded.com>
Date: Mon, 4 Dec 2017 23:05:23 +0300
MIME-Version: 1.0
In-Reply-To: <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2017 04:33 PM, Thomas Petazzoni wrote:

> There are two types of "struct device": the one representing the
> physical device on its physical bus (platform, SPI, PCI, etc.), and
> the one representing the logical device in its device class (net,
> etc.).
> 
> The DMA mapping API expects to receive as argument a "struct device"
> representing the physical device, as the "struct device" contains
> information about the bus that the DMA API needs.
> 
> However, the sh_eth driver mistakenly uses the "struct device"
> representing the logical device (embedded in "struct net_device")
> rather than the "struct device" representing the physical device on
> its bus.
> 
> This commit fixes that by adjusting all calls to the DMA mapping API.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   drivers/net/ethernet/renesas/sh_eth.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
> index 7e060aa9fbed..91e918e654fe 100644
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -1149,7 +1149,8 @@ static int sh_eth_tx_free(struct net_device *ndev, bool sent_only)
>   			   entry, le32_to_cpu(txdesc->status));
>   		/* Free the original skb. */
>   		if (mdp->tx_skbuff[entry]) {
> -			dma_unmap_single(&ndev->dev, le32_to_cpu(txdesc->addr),
> +			dma_unmap_single(&mdp->pdev->dev,

    Using 'ndev->dev.parent' (as in ravb) also should work... not sure which 
is better (although I'm seeing very strange things in the ravb driver built 
with AArch654 gcc 4.8.5).

[...]

MBR, Sergei
