Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36867 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750980AbdIFR5o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 13:57:44 -0400
Received: by mail-lf0-f52.google.com with SMTP id 80so14645533lfy.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Sep 2017 10:57:43 -0700 (PDT)
Subject: Re: [PATCH 5/8] spi: sh-msiof: Wait for Tx FIFO empty after DMA
To: Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com>
 <20170906070507.26223-6-dirk.behme@de.bosch.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <75325ad0-f454-d79e-b11c-28e12808d552@cogentembedded.com>
Date: Wed, 6 Sep 2017 20:57:40 +0300
MIME-Version: 1.0
In-Reply-To: <20170906070507.26223-6-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 09/06/2017 10:05 AM, Dirk Behme wrote:

> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> 
> When Tx DMA is only used, Tx FIFO is still not empty after DMA callback.
> This patch waits for sweeping data out of the Tx FIFO.
> 
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> [adjust context]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>   drivers/spi/spi-sh-msiof.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index 660b03ed6770..a960e8da123d 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -638,6 +638,17 @@ static int sh_msiof_wait_for_completion(struct sh_msiof_spi_priv *p,
>   				dev_err(&p->pdev->dev, "Tx DMA timeout\n");
>   				return -ETIMEDOUT;
>   			}
> +			if (!rx) {
> +				sh_msiof_write(p, IER, IER_TEOFE);
> +
> +				/* wait for tx fifo to be emptied */
> +				if (!wait_for_completion_timeout(&p->done,
> +								 HZ)) {
> +					dev_err(&p->pdev->dev,
> +					"Tx fifo to be emptied timeout\n");

    Please indent this line properly, messages can violate 80-column limit.

> +					return -ETIMEDOUT;
> +				}
> +			}
>   		}
>   		if (rx) {
>   			if (!wait_for_completion_timeout(&p->done_dma_rx,
[...]

MBR, Sergei
