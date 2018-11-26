Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:32973 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbeK0DJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 22:09:58 -0500
Received: by mail-lf1-f65.google.com with SMTP id i26so13988134lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Nov 2018 08:15:23 -0800 (PST)
Date: Mon, 26 Nov 2018 17:14:48 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Avri Altman <Avri.Altman@wdc.com>
Subject: Re: [PATCH 2/2] mmc: core: remove obsolete mmc_set_blockcount()
 function
Message-ID: <20181126161448.GO1158@bigcity.dyn.berto.se>
References: <20181126133814.1185-1-wsa+renesas@sang-engineering.com>
 <20181126133814.1185-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181126133814.1185-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

Thanks for your patch.

On 2018-11-26 14:38:14 +0100, Wolfram Sang wrote:
> The only user was converted to fill a sbc command which is the proper
> way to do it because of AutoCMD23 feature of some hosts.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Cl�ment P�ron <peron.clem@gmail.com>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/core/core.c | 14 --------------
>  drivers/mmc/core/core.h |  2 --
>  2 files changed, 16 deletions(-)
> 
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index 50a5c340307b..d3085f70e9a4 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -2413,20 +2413,6 @@ int mmc_set_blocklen(struct mmc_card *card, unsigned int blocklen)
>  }
>  EXPORT_SYMBOL(mmc_set_blocklen);
>  
> -int mmc_set_blockcount(struct mmc_card *card, unsigned int blockcount,
> -			bool is_rel_write)
> -{
> -	struct mmc_command cmd = {};
> -
> -	cmd.opcode = MMC_SET_BLOCK_COUNT;
> -	cmd.arg = blockcount & 0x0000FFFF;
> -	if (is_rel_write)
> -		cmd.arg |= 1 << 31;
> -	cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
> -	return mmc_wait_for_cmd(card->host, &cmd, 5);
> -}
> -EXPORT_SYMBOL(mmc_set_blockcount);
> -
>  static void mmc_hw_reset_for_init(struct mmc_host *host)
>  {
>  	mmc_pwrseq_reset(host);
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 087ba68b2920..8fb6bc37f808 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -118,8 +118,6 @@ int mmc_erase_group_aligned(struct mmc_card *card, unsigned int from,
>  unsigned int mmc_calc_max_discard(struct mmc_card *card);
>  
>  int mmc_set_blocklen(struct mmc_card *card, unsigned int blocklen);
> -int mmc_set_blockcount(struct mmc_card *card, unsigned int blockcount,
> -			bool is_rel_write);
>  
>  int __mmc_claim_host(struct mmc_host *host, struct mmc_ctx *ctx,
>  		     atomic_t *abort);
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
