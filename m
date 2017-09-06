Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:35396 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750933AbdIFSL0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 14:11:26 -0400
Received: by mail-lf0-f52.google.com with SMTP id d17so19530769lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2017 11:11:25 -0700 (PDT)
Subject: Re: [PATCH 8/8] spi: sh-msiof: Add registers reset
To: Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
 <20170906070507.26223-9-dirk.behme@de.bosch.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <63079dc2-b86a-6de8-7c2c-cfae23c8985a@cogentembedded.com>
Date: Wed, 6 Sep 2017 21:11:22 +0300
MIME-Version: 1.0
In-Reply-To: <20170906070507.26223-9-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/06/2017 10:05 AM, Dirk Behme wrote:

> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> 
> Reset register before starting transfer.
> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>   drivers/spi/spi-sh-msiof.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index fdad8d852602..e8aebd406477 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
[...]
> @@ -254,6 +256,25 @@ static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
>   	return IRQ_HANDLED;
>   }
>   
> +static void sh_msiof_spi_reset_regs(struct sh_msiof_spi_priv *p)
> +{
> +	u32 mask = CTR_TXRST | CTR_RXRST;

    *const*?

> +	u32 data;
> +	int k;
> +
> +	data = sh_msiof_read(p, CTR);
> +	data |= mask;
> +

    Don't think empty line is needed here.

> +	sh_msiof_write(p, CTR, data);
> +
> +	for (k = 100; k > 0; k--) {
> +		if (!(sh_msiof_read(p, CTR) & mask))
> +			break;
> +
> +		udelay(10);
> +	}
> +}
> +
>   static struct {
>   	unsigned short div;
>   	unsigned short brdv;
[...]

MBR, Sergei
