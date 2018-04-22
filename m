Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36504 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756356AbeDVPL4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Apr 2018 11:11:56 -0400
Received: by mail-lf0-f66.google.com with SMTP id d20-v6so11349547lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Apr 2018 08:11:55 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next 5/5] ravb: remove tx buffer addr 4byte
 alilgnment restriction for R-Car Gen3
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-6-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f2d4e43f-4448-28ab-f6a5-73830f765f38@cogentembedded.com>
Date: Sun, 22 Apr 2018 18:11:52 +0300
MIME-Version: 1.0
In-Reply-To: <20180417085030.32650-6-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 4/17/2018 11:50 AM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> This patch sets from two descriptor to one descriptor because R-Car Gen3
> does not have the 4 bytes alignment restriction of the transmission buffer.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index fcd04dbc7dde..3d0985305c26 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -964,7 +964,10 @@ enum RAVB_QUEUE {
>  #define RX_QUEUE_OFFSET	4
>  #define NUM_RX_QUEUE	2
>  #define NUM_TX_QUEUE	2
> -#define NUM_TX_DESC	2	/* TX descriptors per packet */
> +
> +/* TX descriptors per packet */
> +#define NUM_TX_DESC_GEN2	2
> +#define NUM_TX_DESC_GEN3	1

    We hanrdly need these...

>  
>  struct ravb_tstamp_skb {
>  	struct list_head list;
[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 88056dd912ed..f137b62d5b52 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -189,12 +189,13 @@ static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed_only)
>  	int free_num = 0;
>  	int entry;
>  	u32 size;
> +	int num_tx_desc = priv->num_tx_desc;

    Please keep sorting the declarations by length -- that's DaveM's pet peeve 
(and indeed looks prettier. :-)

[...]
> @@ -229,6 +230,7 @@ static void ravb_ring_free(struct net_device *ndev, int q)
>  	struct ravb_private *priv = netdev_priv(ndev);
>  	int ring_size;
>  	int i;
> +	int num_tx_desc = priv->num_tx_desc;

    Here as well.

>  
>  	if (priv->rx_ring[q]) {
>  	
>  		for (i = 0; i < priv->num_rx_ring[q]; i++) {
[...]
> @@ -321,8 +324,10 @@ static void ravb_ring_format(struct net_device *ndev, int q)
>   	for (i = 0, tx_desc = priv->tx_ring[q]; i < priv->num_tx_ring[q];
>   	     i++, tx_desc++) {
>   		tx_desc->die_dt = DT_EEMPTY;
> -		tx_desc++;
> -		tx_desc->die_dt = DT_EEMPTY;
> +		if (num_tx_desc >= 2) {

    > 1, please.
    Strictly speaking, this only works when num_tx_desc == 2, however that's 
my fault...

> +			tx_desc++;
> +			tx_desc->die_dt = DT_EEMPTY;
> +		}
>   	}
>   	tx_desc->dptr = cpu_to_le32((u32)priv->tx_desc_dma[q]);
>   	tx_desc->die_dt = DT_LINKFIX; /* type */
> @@ -345,6 +350,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>   	struct sk_buff *skb;
>   	int ring_size;
>   	int i;
> +	int num_tx_desc = priv->num_tx_desc;

    Again, please keep the descarations sorted by length.

>   
>   	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
>   		ETH_HLEN + VLAN_HLEN;
[...]
> @@ -1533,10 +1539,11 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	void *buffer;
>   	u32 entry;
>   	u32 len;
> +	int num_tx_desc = priv->num_tx_desc;

    Here as well...

[...]
> @@ -1547,41 +1554,55 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
[...]
> +	entry = priv->cur_tx[q] % (priv->num_tx_ring[q] * num_tx_desc);
> +	priv->tx_skb[q][entry / num_tx_desc] = skb;
> +
> +	if (num_tx_desc >= 2) {

    > 1, please.

[...]
> @@ -1589,9 +1610,11 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	if (q == RAVB_NC) {
>   		ts_skb = kmalloc(sizeof(*ts_skb), GFP_ATOMIC);
>   		if (!ts_skb) {
> -			desc--;
> -			dma_unmap_single(ndev->dev.parent, dma_addr, len,
> -					 DMA_TO_DEVICE);
> +			if (num_tx_desc >= 2) {

    Likewise.

> +				desc--;
> +				dma_unmap_single(ndev->dev.parent, dma_addr,
> +						 len, DMA_TO_DEVICE);
> +			}
>   			goto unmap;
>   		}
>   		ts_skb->skb = skb;
[...]
> @@ -2106,6 +2132,9 @@ static int ravb_probe(struct platform_device *pdev)
>   	ndev->max_mtu = 2048 - (ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
>   	ndev->min_mtu = ETH_MIN_MTU;
>   
> +	priv->num_tx_desc = (chip_id == RCAR_GEN2) ?

    Parens not needed.

> +		NUM_TX_DESC_GEN2 : NUM_TX_DESC_GEN3;

    Just 2 : 1;

[...]

    However... I'm not seeing this patch disabling memory allocation for 
priv->tx_align[] and reducing the memory pressure is one of 2 reasons for this 
patch, isn't it?

MBR, Sergei
