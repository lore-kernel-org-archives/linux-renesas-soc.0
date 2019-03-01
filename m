Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0C8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:28:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BA8A2087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="UImU/hGP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731686AbfCAJ2u (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 04:28:50 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60278 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbfCAJ2u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 04:28:50 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1391925B73F;
        Fri,  1 Mar 2019 20:28:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551432528; bh=7WOCjBKAVMvZkqLnaP4J08q4EX5nEHzhiGUGbE69kYg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UImU/hGPGcyNjvt81tCyiye9fDY6uegC2aF/F0rgqoycmM0PvPuv0Ql4V3MrJAaV2
         QRE1eLuVKI2+5F0qh0b0Mf5brFnzGgS52hsqT5jlfUQetT6lWtrSdH1phbBxXU2+Cd
         hg2ZhS8CCYyIq+33fLBReq4XA5okylShVGgPoeng=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3AD56940421; Fri,  1 Mar 2019 10:28:46 +0100 (CET)
Date:   Fri, 1 Mar 2019 10:28:46 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] spi: sh-msiof: Restrict bits per word to 8/16/24/32 on
 R-Car Gen2/3
Message-ID: <20190301092846.gfgpcfz46ja5olxw@verge.net.au>
References: <20190228110513.1833-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190228110513.1833-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 28, 2019 at 12:05:13PM +0100, Geert Uytterhoeven wrote:
> While the MSIOF variants in older SuperH and SH/R-Mobile SoCs support
> bits-per-word values in the full range 8..32, the variants present in
> R-Car Gen2 and Gen3 SoCs are restricted to 8, 16, 24, or 32.
> 
> Obtain the value from family-specific sh_msiof_chipdata to fix this.
> 
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> Tested on SH-Mobile AG5 with 12 bits per word.
> 
>  drivers/spi/spi-sh-msiof.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index 6e83368874839d09..48535e95102c9b08 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -32,6 +32,7 @@
>  #include <asm/unaligned.h>
>  
>  struct sh_msiof_chipdata {
> +	u32 bits_per_word_mask;
>  	u16 tx_fifo_size;
>  	u16 rx_fifo_size;
>  	u16 ctlr_flags;
> @@ -1072,6 +1073,7 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
>  }
>  
>  static const struct sh_msiof_chipdata sh_data = {
> +	.bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32),
>  	.tx_fifo_size = 64,
>  	.rx_fifo_size = 64,
>  	.ctlr_flags = 0,
> @@ -1079,6 +1081,8 @@ static const struct sh_msiof_chipdata sh_data = {
>  };
>  
>  static const struct sh_msiof_chipdata rcar_gen2_data = {
> +	.bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
> +			      SPI_BPW_MASK(24) | SPI_BPW_MASK(32),
>  	.tx_fifo_size = 64,
>  	.rx_fifo_size = 64,
>  	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
> @@ -1086,6 +1090,8 @@ static const struct sh_msiof_chipdata rcar_gen2_data = {
>  };
>  
>  static const struct sh_msiof_chipdata rcar_gen3_data = {
> +	.bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
> +			      SPI_BPW_MASK(24) | SPI_BPW_MASK(32),
>  	.tx_fifo_size = 64,
>  	.rx_fifo_size = 64,
>  	.ctlr_flags = SPI_CONTROLLER_MUST_TX,
> @@ -1410,7 +1416,7 @@ static int sh_msiof_spi_probe(struct platform_device *pdev)
>  	ctlr->setup = sh_msiof_spi_setup;
>  	ctlr->prepare_message = sh_msiof_prepare_message;
>  	ctlr->slave_abort = sh_msiof_slave_abort;
> -	ctlr->bits_per_word_mask = SPI_BPW_RANGE_MASK(8, 32);
> +	ctlr->bits_per_word_mask = chipdata->bits_per_word_mask;
>  	ctlr->auto_runtime_pm = true;
>  	ctlr->transfer_one = sh_msiof_transfer_one;
>  
> -- 
> 2.17.1
> 
