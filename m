Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54166 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751518AbdF1TEm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2017 15:04:42 -0400
Date: Wed, 28 Jun 2017 21:04:37 +0200
From: Simon Horman <horms@verge.net.au>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Subject: Re: [renesas-drivers:topic/sdhi-gen3-dma-2017-v2-rebased1 3/4]
 drivers/mmc//host/renesas_sdhi_internal_dmac.c:96:2: error: implicit
 declaration of function 'writeq'
Message-ID: <20170628190434.GB17318@verge.net.au>
References: <201706281100.6rIDiZIL%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201706281100.6rIDiZIL%fengguang.wu@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 28, 2017 at 11:37:02AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/sdhi-gen3-dma-2017-v2-rebased1
> head:   bcf4bf9f75e02e84971693bce04e5c3775b0f97e
> commit: 6e76773921ebc2c58d7878a8cb3cb26e57f5ed06 [3/4] mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 6e76773921ebc2c58d7878a8cb3cb26e57f5ed06
>         # save the attached .config to linux build tree
>         make.cross ARCH=arm 
> 
> All errors (new ones prefixed by >>):

This should be resolved in topic/sdhi-gen3-dma-2017-v3

>    drivers/mmc//host/renesas_sdhi_internal_dmac.c: In function 'renesas_sdhi_internal_dmac_dm_write':
> >> drivers/mmc//host/renesas_sdhi_internal_dmac.c:96:2: error: implicit declaration of function 'writeq' [-Werror=implicit-function-declaration]
>      writeq(val, host->ctl + addr);
>      ^~~~~~
>    cc1: some warnings being treated as errors
> 
> vim +/writeq +96 drivers/mmc//host/renesas_sdhi_internal_dmac.c
> 
>     80		/* Gen3 SDHI DMAC can handle 0xffffffff blk count, but seg = 1 */
>     81		.max_blk_count	= 0xffffffff,
>     82		.max_segs	= 1,
>     83	};
>     84	
>     85	static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>     86		{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
>     87		{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
>     88		{},
>     89	};
>     90	MODULE_DEVICE_TABLE(of, renesas_sdhi_internal_dmac_of_match);
>     91	
>     92	static void
>     93	renesas_sdhi_internal_dmac_dm_write(struct tmio_mmc_host *host,
>     94					    int addr, u64 val)
>     95	{
>   > 96		writeq(val, host->ctl + addr);
>     97	}
>     98	
>     99	static void
>    100	renesas_sdhi_internal_dmac_enable_dma(struct tmio_mmc_host *host, bool enable)
>    101	{
>    102		if (!host->chan_tx || !host->chan_rx)
>    103			return;
>    104	
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
