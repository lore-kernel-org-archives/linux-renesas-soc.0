Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39080 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbeIQX1X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 19:27:23 -0400
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so14011303lji.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 10:58:55 -0700 (PDT)
Subject: Re: [PATCH net-next] ravb: do not write 1 to reserved bits
To: Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20180917151911.25450-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <12758acf-6444-47eb-ad74-170034959bd7@cogentembedded.com>
Date: Mon, 17 Sep 2018 20:58:52 +0300
MIME-Version: 1.0
In-Reply-To: <20180917151911.25450-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/17/2018 06:19 PM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> EtherAVB hardware requires 0 to be written to status register bits in
> order to clear them, however, care must be taken not to:
> 
> 1. Clear other bits, by writing zero to them
> 2. Write one to reserved bits
> 
> This patch corrects the ravb driver with respect to the second point above.
> This is done by defining reserved bit masks for the affected registers and,
> after auditing the code, ensure all sites that may write a one to a
> reserved bit use are suitably masked.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v2 [Simon Horman]
> * Cover ravb_timestamp_interrupt() by this change
> * Use enum value rather than #define for reserved masks
> * Reword changelog
> 
> v1 [Kazuya Mizuguchi]
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  6 ++++++
>  drivers/net/ethernet/renesas/ravb_main.c | 11 ++++++-----
>  drivers/net/ethernet/renesas/ravb_ptp.c  |  2 +-
>  3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 1470fc12282b..bca219edcf94 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
> @@ -428,6 +428,7 @@ enum EIS_BIT {
>  	EIS_CULF1	= 0x00000080,
>  	EIS_TFFF	= 0x00000100,
>  	EIS_QFS		= 0x00010000,
> +	EIS_RESERVED	= (u32)(GENMASK(31, 17) | GENMASK(15, 11)),

   Are you sure those (u32) casts are necessary? Happily builds in both 32- and 64-bit
mode without them... 

[...]
> @@ -528,6 +530,7 @@ enum RIS2_BIT {
>  	RIS2_QFF16	= 0x00010000,
>  	RIS2_QFF17	= 0x00020000,
>  	RIS2_RFFF	= 0x80000000,
> +	RIS2_RESERVED	= (u32)GENMASK_ULL(30, 18),

   Why GENMASK_ULL() suddenly? Doesn't seem needed at all...

[...]
> @@ -544,6 +547,8 @@ enum TIS_BIT {
>  	TIS_FTF1	= 0x00000002,	/* Undocumented? */
>  	TIS_TFUF	= 0x00000100,
>  	TIS_TFWF	= 0x00000200,
> +	TIS_RESERVED	= (u32)(GENMASK_ULL(31, 20) | GENMASK_ULL(15, 12) | \
> +				GENMASK_ULL(7, 4))

   Same question.

[...]

MBR, Sergei
