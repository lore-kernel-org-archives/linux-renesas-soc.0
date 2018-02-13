Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:40056 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933890AbeBMKBJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 05:01:09 -0500
Received: by mail-lf0-f65.google.com with SMTP id 37so5443664lfs.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 02:01:08 -0800 (PST)
Subject: Re: [PATCH] ravb: add support for changing MTU
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180212200033.1802-1-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0aa8c77f-ab78-141a-c81d-a877cccd6bb1@cogentembedded.com>
Date: Tue, 13 Feb 2018 13:01:04 +0300
MIME-Version: 1.0
In-Reply-To: <20180212200033.1802-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 02/12/2018 11:00 PM, Niklas Söderlund wrote:

> Allow for chancing the MTU within the limit of the maximum size of a

   Changing. :-)

> descriptor (2048 bytes). Add the callback to change MTU from user-space
> and take the configurable MTU into account when configuring the
> hardware.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index c87f57ca44371586..a4870c9e42195802 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -300,9 +300,9 @@ static void ravb_ring_format(struct net_device *ndev, int q)
>  	for (i = 0; i < priv->num_rx_ring[q]; i++) {
>  		/* RX descriptor */
>  		rx_desc = &priv->rx_ring[q][i];
> -		rx_desc->ds_cc = cpu_to_le16(PKT_BUF_SZ);
> +		rx_desc->ds_cc = cpu_to_le16(priv->rx_buf_sz);
>  		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
> -					  PKT_BUF_SZ,
> +					  le16_to_cpu(rx_desc->ds_cc),

  Why not 'priv->rx_buf_sz'?

[...]
> @@ -346,6 +346,10 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>  	int ring_size;
>  	int i;
>  
> +	/* +16 gets room from the status from the card. */
> +	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
> +		ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN + 16;

   Mhm, I don't think FCS gets added to the frame buffer... And why add 16?

[...]

MBR, Sergei
