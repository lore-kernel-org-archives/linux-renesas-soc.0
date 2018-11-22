Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37680 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388851AbeKWAm3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Nov 2018 19:42:29 -0500
Date: Thu, 22 Nov 2018 15:02:55 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] mmc: tmio: introduce mask for 'always 1' bits
Message-ID: <20181122140255.32z7xi5o5aba6u5n@verge.net.au>
References: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119131357.28648-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 19, 2018 at 02:13:57PM +0100, Wolfram Sang wrote:
> Some variants (namely Renesas SDHI) have bits in the STATS and IRQ_MASK
> registers which are 'always 1' and should be written as such. Introduce
> a seperate mask for this and apply it whenever such a register is
> written.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> This is my response to BSP patches modifying all the register writes directly
> (BSP commits 2d339800bbc73d and f73d5eb86097df). This seems much more future
> proof to me.
> 
> Yamada-san: could you check if your HW has 'always 1' bits, too?
> 
> Tested on a R-Car M3-N. No regression and no performance impacts when reading
> large files from eMMC or UHS-SD cards.
> 
>  drivers/mmc/host/renesas_sdhi_core.c | 1 +
>  drivers/mmc/host/tmio_mmc.h          | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index a049b01206f1..31a351a20dc0 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -722,6 +722,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		host->ops.card_busy = renesas_sdhi_card_busy;
>  		host->ops.start_signal_voltage_switch =
>  			renesas_sdhi_start_signal_voltage_switch;
> +		host->sdcard_irq_setbit_mask = TMIO_STAT_ALWAYS_SET_27;
>  	}
>  
>  	/* Orginally registers were 16 bit apart, could be 32 or 64 nowadays */
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 5f6dfb86e43e..c03529e3f01a 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -70,6 +70,7 @@
>  #define TMIO_STAT_DAT0		BIT(23)	/* only known on R-Car so far */
>  #define TMIO_STAT_RXRDY         BIT(24)
>  #define TMIO_STAT_TXRQ          BIT(25)
> +#define TMIO_STAT_ALWAYS_SET_27	BIT(27) /* only known on R-Car 2+ so far */

The _27 seems to be odd to include in the name, but I assume it
was the least bad option you could come up with.

Other that that this looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


>  #define TMIO_STAT_ILL_FUNC      BIT(29) /* only when !TMIO_MMC_HAS_IDLE_WAIT */
>  #define TMIO_STAT_SCLKDIVEN     BIT(29) /* only when TMIO_MMC_HAS_IDLE_WAIT */
>  #define TMIO_STAT_CMD_BUSY      BIT(30)
> @@ -154,6 +155,7 @@ struct tmio_mmc_host {
>  	u32			sdcard_irq_mask;
>  	u32			sdio_irq_mask;
>  	unsigned int		clk_cache;
> +	u32			sdcard_irq_setbit_mask;
>  
>  	spinlock_t		lock;		/* protect host private data */
>  	unsigned long		last_req_ts;
> @@ -268,6 +270,9 @@ static inline void sd_ctrl_write16_rep(struct tmio_mmc_host *host, int addr,
>  static inline void sd_ctrl_write32_as_16_and_16(struct tmio_mmc_host *host,
>  						int addr, u32 val)
>  {
> +	if (addr == CTL_IRQ_MASK || addr == CTL_STATUS)
> +		val |= host->sdcard_irq_setbit_mask;
> +
>  	iowrite16(val & 0xffff, host->ctl + (addr << host->bus_shift));
>  	iowrite16(val >> 16, host->ctl + ((addr + 2) << host->bus_shift));
>  }
> -- 
> 2.11.0
> 
