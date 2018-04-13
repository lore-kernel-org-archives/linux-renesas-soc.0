Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:43430 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750792AbeDMT0J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Apr 2018 15:26:09 -0400
Received: by mail-lf0-f66.google.com with SMTP id v207-v6so14068037lfa.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Apr 2018 12:26:08 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
References: <20180413141021.8680-1-wsa+renesas@sang-engineering.com>
 <20180413141021.8680-2-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5a7d9222-76dd-8071-03a0-6eb39c7e0393@cogentembedded.com>
Date: Fri, 13 Apr 2018 22:26:05 +0300
MIME-Version: 1.0
In-Reply-To: <20180413141021.8680-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 04/13/2018 05:10 PM, Wolfram Sang wrote:

> Early revisions of certain SoCs cannot do multiple DMA RX streams in
> parallel. To avoid data corruption, only allow one DMA RX channel and
> fall back to PIO, if needed.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 34 ++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 8e0acd197c43..c8d479375fb6 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
[...]
> @@ -251,18 +273,24 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
>   * implementation as others may use a different implementation.
>   */
>  static const struct soc_device_attribute gen3_soc_whitelist[] = {
> -        { .soc_id = "r8a7795", .revision = "ES1.*" },
> +        { .soc_id = "r8a7795", .revision = "ES1.*",
> +	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>          { .soc_id = "r8a7795", .revision = "ES2.0" },
> -        { .soc_id = "r8a7796", .revision = "ES1.0" },
> +        { .soc_id = "r8a7796", .revision = "ES1.0",
> +	  .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },

   Again, could you fix the indentation while updating these 2 initializers?
checkpatch.pl complains about the spaces...

>          { .soc_id = "r8a77995", .revision = "ES1.0" },
>          { /* sentinel */ }
>  };

MBR, Sergei
