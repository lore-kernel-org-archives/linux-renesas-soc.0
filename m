Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34539 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753234AbeDUUxH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Apr 2018 16:53:07 -0400
Received: by mail-lf0-f66.google.com with SMTP id r7-v6so9642938lfr.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Apr 2018 13:53:06 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next 3/5] ravb: do not write 1 to reserved bits
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-4-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <95d97282-eb09-95f0-ebc5-f0e63581ff78@cogentembedded.com>
Date: Sat, 21 Apr 2018 23:53:04 +0300
MIME-Version: 1.0
In-Reply-To: <20180417085030.32650-4-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/17/2018 11:50 AM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> This patch corrects writing 1 to reserved bits.
> The write value should be 0.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/net/ethernet/renesas/ravb.h      | 12 ++++++++++++
>  drivers/net/ethernet/renesas/ravb_main.c |  9 +++++----
>  drivers/net/ethernet/renesas/ravb_ptp.c  |  2 +-
>  3 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index b81f4faf7b10..57eea4a77826 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -433,6 +433,8 @@ enum EIS_BIT {
>  	EIS_QFS		= 0x00010000,
>  };
>  
> +#define EIS_RESERVED_BITS	(u32)(GENMASK(31, 17) | GENMASK(15, 11))
> +
>  /* RIC0 */
>  enum RIC0_BIT {
>  	RIC0_FRE0	= 0x00000001,
> @@ -477,6 +479,8 @@ enum RIS0_BIT {
>  	RIS0_FRF17	= 0x00020000,
>  };
>  
> +#define RIS0_RESERVED_BITS	(u32)GENMASK(31, 18)
> +
>  /* RIC1 */
>  enum RIC1_BIT {
>  	RIC1_RFWE	= 0x80000000,
> @@ -533,6 +537,8 @@ enum RIS2_BIT {
>  	RIS2_RFFF	= 0x80000000,
>  };
>  
> +#define RIS2_RESERVED_BITS	(u32)GENMASK_ULL(30, 18)
> +
>  /* TIC */
>  enum TIC_BIT {
>  	TIC_FTE0	= 0x00000001,	/* Undocumented? */
> @@ -549,6 +555,10 @@ enum TIS_BIT {
>  	TIS_TFWF	= 0x00000200,
>  };
>  
> +#define TIS_RESERVED_BITS	(u32)(GENMASK_ULL(31, 20) | \
> +				      GENMASK_ULL(15, 12) | \
> +				      GENMASK_ULL(7, 4))
> +
>  /* ISS */
>  enum ISS_BIT {
>  	ISS_FRS		= 0x00000001,	/* Undocumented? */
> @@ -622,6 +632,8 @@ enum GIS_BIT {
>  	GIS_PTMF	= 0x00000004,
>  };
>  
> +#define GIS_RESERVED_BITS	(u32)GENMASK(15, 10)
> +
>  /* GIE (R-Car Gen3 only) */
>  enum GIE_BIT {
>  	GIE_PTCS	= 0x00000001,
[...]

   Perhaps we can do what the MUSB driver does: declare the writing-zero-clears
masks (inside *enum*!), and then set them before writing th register... 

MBR, Sergei
