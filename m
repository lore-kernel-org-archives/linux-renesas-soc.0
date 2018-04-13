Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:45088 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751553AbeDMP7S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 11:59:18 -0400
Received: by mail-lf0-f68.google.com with SMTP id q5-v6so13264437lff.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Apr 2018 08:59:18 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] mmc: renesas_sdhi_internal_dmac: use more generic
 whitelisting
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Simon Horman <horms+renesas@verge.net.au>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
References: <20180413141021.8680-1-wsa+renesas@sang-engineering.com>
 <20180413141021.8680-5-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f6be0bba-5f29-c83e-12b3-e490e909eae0@cogentembedded.com>
Date: Fri, 13 Apr 2018 18:59:14 +0300
MIME-Version: 1.0
In-Reply-To: <20180413141021.8680-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 04/13/2018 05:10 PM, Wolfram Sang wrote:

> Whitelisting every ES version does not scale. So, we whitelist whole
> SoCs independent of ES version. If we need specific handling for an ES
> version, we put it to the front, so it will be matched first.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index a02fab89e25e..4b275225aa9d 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -272,12 +272,15 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
>   * implementation as others may use a different implementation.
>   */
>  static const struct soc_device_attribute gen3_soc_whitelist[] = {
> +	/* specific ones */
>          { .soc_id = "r8a7795", .revision = "ES1.*",
>  	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
> -        { .soc_id = "r8a7795", .revision = "ES2.0" },
>          { .soc_id = "r8a7796", .revision = "ES1.0",
>  	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
> -        { .soc_id = "r8a77995", .revision = "ES1.0" },
> +	/* generic ones */
> +        { .soc_id = "r8a7795" },
> +        { .soc_id = "r8a7796" },
> +        { .soc_id = "r8a77995" },

   Could you use a tab for indentation of the new lines?
Actually, it was on my TODO list (before the patch adding R8A77980 to the white
list)...

>          { /* sentinel */ }
>  };
>  

MBR, Sergei
