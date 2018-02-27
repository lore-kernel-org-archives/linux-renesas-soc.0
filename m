Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.132]:34286 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753167AbeB0OgH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 09:36:07 -0500
Cc: Adrian Hunter <adrian.hunter@intel.com>, shawn.lin@rock-chips.com,
        Michal Simek <michal.simek@xilinx.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhci-of-arasan: Add quirk to avoid erroneous msg
To: Phil Edworthy <phil.edworthy@renesas.com>
References: <1519739731-27920-1-git-send-email-phil.edworthy@renesas.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <b35a8ac6-af47-5851-95ae-371288bb5f25@rock-chips.com>
Date: Tue, 27 Feb 2018 22:27:46 +0800
MIME-Version: 1.0
In-Reply-To: <1519739731-27920-1-git-send-email-phil.edworthy@renesas.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

�� 2018/2/27 21:55, Phil Edworthy д��:
> Since the controller does not support the end-of-busy IRQ, don't use it.
> Otherwise, on older SD cards you will get lots of these messages:
> "mmc0: Got data interrupt 0x00000002 even though no data operation was in progress"
> 

I'm afraid you have to explain which version of arasan's IP suffer from
this and what does the "older SD cards" mean?

> This has been reported on Xilinx devices that also use the Arasan IP.
> See https://patchwork.kernel.org/patch/8062871/
> 
> This has been tested on the Renesas RZ/ND-DB board with the RZ/N1 SoC.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
>   drivers/mmc/host/sdhci-of-arasan.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
> index c33a5f7..ab66e32 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
> @@ -290,7 +290,8 @@ static const struct sdhci_pltfm_data sdhci_arasan_pdata = {
>   	.ops = &sdhci_arasan_ops,
>   	.quirks = SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN,
>   	.quirks2 = SDHCI_QUIRK2_PRESET_VALUE_BROKEN |
> -			SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN,
> +			SDHCI_QUIRK2_CLOCK_DIV_ZERO_BROKEN |
> +			SDHCI_QUIRK2_STOP_WITH_TC,
>   };
>   
>   static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *host, u32 intmask)
> 


-- 
Best Regards
Shawn Lin
