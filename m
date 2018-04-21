Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:46124 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753164AbeDUU7x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Apr 2018 16:59:53 -0400
Received: by mail-lf0-f68.google.com with SMTP id j68-v6so9592858lfg.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Apr 2018 13:59:52 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next 4/5] ravb: remove undocumented processing
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-5-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6d453c17-b9da-845b-b24d-bc559f36fad8@cogentembedded.com>
Date: Sat, 21 Apr 2018 23:59:49 +0300
MIME-Version: 1.0
In-Reply-To: <20180417085030.32650-5-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/17/2018 11:50 AM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>

   How about the description (or 2)?

> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  5 -----
>  drivers/net/ethernet/renesas/ravb_main.c | 15 ---------------
>  2 files changed, 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 57eea4a77826..fcd04dbc7dde 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -197,15 +197,11 @@ enum ravb_reg {
>  	MAHR	= 0x05c0,
>  	MALR	= 0x05c8,
>  	TROCR	= 0x0700,	/* Undocumented? */
> -	CDCR	= 0x0708,	/* Undocumented? */
> -	LCCR	= 0x0710,	/* Undocumented? */
>  	CEFCR	= 0x0740,
>  	FRECR	= 0x0748,
>  	TSFRCR	= 0x0750,
>  	TLFRCR	= 0x0758,
>  	RFCR	= 0x0760,
> -	CERCR	= 0x0768,	/* Undocumented? */
> -	CEECR	= 0x0770,	/* Undocumented? */
>  	MAFCR	= 0x0778,
>  };
>  

   I think this is a material of patch #1... 

> @@ -223,7 +219,6 @@ enum CCC_BIT {
>  	CCC_CSEL_HPB	= 0x00010000,
>  	CCC_CSEL_ETH_TX	= 0x00020000,
>  	CCC_CSEL_GMII_REF = 0x00030000,
> -	CCC_BOC		= 0x00100000,	/* Undocumented? */
>  	CCC_LBME	= 0x01000000,

   ... and this -- of patch #2. Or vice versa. :-)

[...]

MBR, Sergei
