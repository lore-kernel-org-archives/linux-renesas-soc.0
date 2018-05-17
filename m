Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39980 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750891AbeEQIMY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 04:12:24 -0400
Date: Thu, 17 May 2018 10:12:04 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] sh_eth: add EDMR.NBST support
Message-ID: <20180517081200.qtwj2dycizqijbpj@verge.net.au>
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <7e929d5a-e97d-7339-a089-2231c7a6a92c@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e929d5a-e97d-7339-a089-2231c7a6a92c@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 16, 2018 at 10:58:26PM +0300, Sergei Shtylyov wrote:
> The R-Car V3H (AKA R8A77980) GEther controller adds the DMA burst mode bit
> (NBST) in EDMR and the manual tells to always set it before doing any DMA.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
>  drivers/net/ethernet/renesas/sh_eth.c |    4 ++++
>  drivers/net/ethernet/renesas/sh_eth.h |    2 ++
>  2 files changed, 6 insertions(+)
> 
> Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
> ===================================================================
> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c
> @@ -1434,6 +1434,10 @@ static int sh_eth_dev_init(struct net_de
>  
>  	sh_eth_write(ndev, mdp->cd->trscer_err_mask, TRSCER);
>  
> +	/* DMA transfer burst mode */
> +	if (mdp->cd->nbst)
> +		sh_eth_modify(ndev, EDMR, EDMR_NBST, EDMR_NBST);
> +
>  	if (mdp->cd->bculr)
>  		sh_eth_write(ndev, 0x800, BCULR);	/* Burst sycle set */

Not related to this patch, but: s/sycle/cycle/

>  
> Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
> ===================================================================
> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.h
> @@ -184,6 +184,7 @@ enum GECMR_BIT {
>  
>  /* EDMR */
>  enum DMAC_M_BIT {
> +	EDMR_NBST = 0x80,

It would be nice to start using BIT() in this file.

>  	EDMR_EL = 0x40, /* Litte endian */
>  	EDMR_DL1 = 0x20, EDMR_DL0 = 0x10,
>  	EDMR_SRST_GETHER = 0x03,
> @@ -505,6 +506,7 @@ struct sh_eth_cpu_data {
>  	unsigned bculr:1;	/* EtherC have BCULR */
>  	unsigned tsu:1;		/* EtherC have TSU */
>  	unsigned hw_swap:1;	/* E-DMAC have DE bit in EDMR */
> +	unsigned nbst:1;	/* E-DMAC has NBST bit in EDMR */
>  	unsigned rpadir:1;	/* E-DMAC have RPADIR */
>  	unsigned no_trimd:1;	/* E-DMAC DO NOT have TRIMD */
>  	unsigned no_ade:1;	/* E-DMAC DO NOT have ADE bit in EESR */
> 
