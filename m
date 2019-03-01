Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BBFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:25:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9F892085A
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 09:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="AVdsuhRo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731686AbfCAJY7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 04:24:59 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:60098 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbfCAJY7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 04:24:59 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5E35325B78D;
        Fri,  1 Mar 2019 20:24:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551432297; bh=Qb0LZq6ywaQNv4PoXK1ehQq6bXj9ZkoZ3Mdw0xZ5XdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AVdsuhRoA2ryOLwDJsuz+p5VQkyCDA8ZMi5hfo9hV4BQObPrk106OxysXymuo0WVi
         OCxHcLSS+CCMQJMxcErSmS9a87URH7sm0fJQFZXWay0TZvLgVY8A5sOvdHriRTDQ+G
         LstN7a9LoNo2OUo/MiGPN+lyigxHFwfFCffJi5Pg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 631F3940421; Fri,  1 Mar 2019 10:24:55 +0100 (CET)
Date:   Fri, 1 Mar 2019 10:24:55 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH] spi: sh-msiof: Add reset of registers before starting
 transfer
Message-ID: <20190301092454.elhpld6q2ucaql5v@verge.net.au>
References: <20190228110215.1657-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190228110215.1657-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 28, 2019 at 12:02:15PM +0100, Geert Uytterhoeven wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> 
> In accordance with hardware specification Ver 1.0, reset register
> transmission / reception setting before transfer.
> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/spi/spi-sh-msiof.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index b20e70a2bdd115d7..6e83368874839d09 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -130,6 +130,8 @@ struct sh_msiof_spi_priv {
>  #define CTR_TFSE	0x00004000 /* Transmit Frame Sync Signal Output Enable */
>  #define CTR_TXE		0x00000200 /* Transmit Enable */
>  #define CTR_RXE		0x00000100 /* Receive Enable */
> +#define CTR_TXRST	0x00000002 /* Transmit Reset */
> +#define CTR_RXRST	0x00000001 /* Receive Reset */

nit: can we start using the BIT() macro here?

>  /* FCTR */
>  #define FCTR_TFWM_MASK	0xe0000000 /* Transmit FIFO Watermark */
> @@ -246,6 +248,25 @@ static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static void sh_msiof_spi_reset_regs(struct sh_msiof_spi_priv *p)
> +{
> +	u32 mask = CTR_TXRST | CTR_RXRST;
> +	u32 data;
> +	int k;
> +
> +	data = sh_msiof_read(p, CTR);
> +	data |= mask;
> +
> +	sh_msiof_write(p, CTR, data);
> +
> +	for (k = 100; k > 0; k--) {
> +		if (!(sh_msiof_read(p, CTR) & mask))
> +			break;
> +
> +		udelay(1);
> +	}
> +}
> +
>  static const u32 sh_msiof_spi_div_array[] = {
>  	SCR_BRDV_DIV_1, SCR_BRDV_DIV_2,	 SCR_BRDV_DIV_4,
>  	SCR_BRDV_DIV_8,	SCR_BRDV_DIV_16, SCR_BRDV_DIV_32,
> @@ -925,6 +946,9 @@ static int sh_msiof_transfer_one(struct spi_controller *ctlr,
>  	bool swab;
>  	int ret;
>  
> +	/* reset registers */
> +	sh_msiof_spi_reset_regs(p);
> +
>  	/* setup clocks (clock already enabled in chipselect()) */
>  	if (!spi_controller_is_slave(p->ctlr))
>  		sh_msiof_spi_set_clk_regs(p, clk_get_rate(p->clk), t->speed_hz);
> -- 
> 2.17.1
> 
