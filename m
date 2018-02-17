Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34551 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbeBQJIE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Feb 2018 04:08:04 -0500
Received: by mail-lf0-f68.google.com with SMTP id l191so7057688lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Feb 2018 01:08:03 -0800 (PST)
Subject: Re: [PATCH v2] ravb: add support for changing MTU
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180216161008.12882-1-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <2935baf3-ff3b-67dc-743a-a772c38a282c@cogentembedded.com>
Date: Sat, 17 Feb 2018 12:08:00 +0300
MIME-Version: 1.0
In-Reply-To: <20180216161008.12882-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 2/16/2018 7:10 PM, Niklas Söderlund wrote:

> Allow for changing the MTU within the limit of the maximum size of a
> descriptor (2048 bytes). Add the callback to change MTU from user-space
> and take the configurable MTU into account when configuring the
> hardware.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   drivers/net/ethernet/renesas/ravb.h      |  1 +
>   drivers/net/ethernet/renesas/ravb_main.c | 34 +++++++++++++++++++++++++-------
>   2 files changed, 28 insertions(+), 7 deletions(-)
> 
> * Changes since v1
> - Fix spelling error.
> - s/le16_to_cpu(rx_desc->ds_cc)/priv->rx_buf_sz/.
> - Drop ETH_FCS_LEN + 16 from rx_buf_sz calculation as pointed out by
>    Sergei.
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 96a27b00c90e212a..b81f4faf7b10114d 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -1018,6 +1018,7 @@ struct ravb_private {
>   	u32 dirty_rx[NUM_RX_QUEUE];	/* Producer ring indices */
>   	u32 cur_tx[NUM_TX_QUEUE];
>   	u32 dirty_tx[NUM_TX_QUEUE];
> +	u32 rx_buf_sz;			/* Based on MTU+slack. */
>   	struct napi_struct napi[NUM_RX_QUEUE];
>   	struct work_struct work;
>   	/* MII transceiver section. */
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c87f57ca44371586..34e841306e04a3d3 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -238,7 +238,7 @@ static void ravb_ring_free(struct net_device *ndev, int q)
>   					       le32_to_cpu(desc->dptr)))
>   				dma_unmap_single(ndev->dev.parent,
>   						 le32_to_cpu(desc->dptr),
> -						 PKT_BUF_SZ,
> +						 priv->rx_buf_sz,
>   						 DMA_FROM_DEVICE);
>   		}
>   		ring_size = sizeof(struct ravb_ex_rx_desc) *
> @@ -300,9 +300,9 @@ static void ravb_ring_format(struct net_device *ndev, int q)
>   	for (i = 0; i < priv->num_rx_ring[q]; i++) {
>   		/* RX descriptor */
>   		rx_desc = &priv->rx_ring[q][i];
> -		rx_desc->ds_cc = cpu_to_le16(PKT_BUF_SZ);
> +		rx_desc->ds_cc = cpu_to_le16(priv->rx_buf_sz);
>   		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
> -					  PKT_BUF_SZ,
> +					  priv->rx_buf_sz,
>   					  DMA_FROM_DEVICE);
>   		/* We just set the data size to 0 for a failed mapping which
>   		 * should prevent DMA from happening...
> @@ -346,6 +346,10 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>   	int ring_size;
>   	int i;
>   
> +	/* +16 gets room from the status from the card. */

    You removed the addition of 16 but left the comment intact. :-)
Will have to fix it up in a follow-up patch now...

> +	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +

    Not sure why PKT_BUF_SZ is 1538, sigh...

> +		ETH_HLEN + VLAN_HLEN;
> +
>   	/* Allocate RX and TX skb rings */
>   	priv->rx_skb[q] = kcalloc(priv->num_rx_ring[q],
>   				  sizeof(*priv->rx_skb[q]), GFP_KERNEL);
[...]

MBR, Sergei
