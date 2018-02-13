Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40231 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935116AbeBMNMg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Feb 2018 08:12:36 -0500
Received: by mail-lf0-f68.google.com with SMTP id 37so6131441lfs.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2018 05:12:35 -0800 (PST)
From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Date: Tue, 13 Feb 2018 14:12:33 +0100
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ravb: add support for changing MTU
Message-ID: <20180213131233.GA18618@bigcity.dyn.berto.se>
References: <20180212200033.1802-1-niklas.soderlund+renesas@ragnatech.se>
 <0aa8c77f-ab78-141a-c81d-a877cccd6bb1@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0aa8c77f-ab78-141a-c81d-a877cccd6bb1@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

Thanks for your feedback.

On 2018-02-13 13:01:04 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 02/12/2018 11:00 PM, Niklas S�derlund wrote:
> 
> > Allow for chancing the MTU within the limit of the maximum size of a
> 
>    Changing. :-)

Yes :-)

> 
> > descriptor (2048 bytes). Add the callback to change MTU from user-space
> > and take the configurable MTU into account when configuring the
> > hardware.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> [...]
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > index c87f57ca44371586..a4870c9e42195802 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -300,9 +300,9 @@ static void ravb_ring_format(struct net_device *ndev, int q)
> >  	for (i = 0; i < priv->num_rx_ring[q]; i++) {
> >  		/* RX descriptor */
> >  		rx_desc = &priv->rx_ring[q][i];
> > -		rx_desc->ds_cc = cpu_to_le16(PKT_BUF_SZ);
> > +		rx_desc->ds_cc = cpu_to_le16(priv->rx_buf_sz);
> >  		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
> > -					  PKT_BUF_SZ,
> > +					  le16_to_cpu(rx_desc->ds_cc),
> 
>   Why not 'priv->rx_buf_sz'?

To align the arguments used with the one in ravb_rx() which uses 
le16_to_cpu(rx_desc->ds_cc) already before this patch.

	static bool ravb_rx(struct net_device *ndev, int *quota, int q)
	{
	...
	    /* Refill the RX ring buffers. */
	    for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
		    ...
		    desc->ds_cc = cpu_to_le16(priv->rx_buf_sz);

		    if (!priv->rx_skb[q][entry]) {
			    ...
			    dma_addr = dma_map_single(ndev->dev.parent, skb->data,
						      le16_to_cpu(desc->ds_cc),
						      DMA_FROM_DEVICE);
			    ...
		    }    
		    ...
	    }
	    ...
	}

I have no preference one way or the other but I think both call sites 
should look the same :-)

> 
> [...]
> > @@ -346,6 +346,10 @@ static int ravb_ring_init(struct net_device *ndev, int q)
> >  	int ring_size;
> >  	int i;
> >  
> > +	/* +16 gets room from the status from the card. */
> > +	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
> > +		ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN + 16;
> 
>    Mhm, I don't think FCS gets added to the frame buffer... And why add 16?

And +16 is added as the comment above states, to leave from the 
descriptor status appended by the hardware. This is already the case 
with PKT_BUF_SZ which for ravb is is set to 1538. MTU (1500) + ETH_HLEN 
(14) + VLAN_HLEN(4) + ETH_FCS_LEN(4) + ravb status (16) == 1538.

This is also what the sh_eth driver do and I think it's value to keep 
these to driver as similar as possible in this regard, would you not 
agree? If in deed the FSC is not added I think we should fix this for 
both drivers in a follow up commit.

> 
> [...]
> 
> MBR, Sergei

-- 
Regards,
Niklas S�derlund
