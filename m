Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35174 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753826AbdIGIeu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 04:34:50 -0400
MIME-Version: 1.0
In-Reply-To: <20170906070507.26223-6-dirk.behme@de.bosch.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com> <20170906070507.26223-6-dirk.behme@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Sep 2017 10:34:49 +0200
Message-ID: <CAMuHMdX0tu1aZqQoqUwvaN-dnsKicU_UwmRFzW6KL0LKJiULVQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] spi: sh-msiof: Wait for Tx FIFO empty after DMA
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, Sep 6, 2017 at 9:05 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
>
> When Tx DMA is only used, Tx FIFO is still not empty after DMA callback.
> This patch waits for sweeping data out of the Tx FIFO.
>
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> [adjust context]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  drivers/spi/spi-sh-msiof.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
> index 660b03ed6770..a960e8da123d 100644
> --- a/drivers/spi/spi-sh-msiof.c
> +++ b/drivers/spi/spi-sh-msiof.c
> @@ -638,6 +638,17 @@ static int sh_msiof_wait_for_completion(struct sh_msiof_spi_priv *p,
>                                 dev_err(&p->pdev->dev, "Tx DMA timeout\n");
>                                 return -ETIMEDOUT;
>                         }
> +                       if (!rx) {

May the issue also happen is TX and RX are used?
See also "[PATCH 4/8] spi: sh-msiof: Fix DMA completion".

> +                               sh_msiof_write(p, IER, IER_TEOFE);
> +
> +                               /* wait for tx fifo to be emptied */
> +                               if (!wait_for_completion_timeout(&p->done,
> +                                                                HZ)) {
> +                                       dev_err(&p->pdev->dev,
> +                                       "Tx fifo to be emptied timeout\n");
> +                                       return -ETIMEDOUT;
> +                               }
> +                       }
>                 }
>                 if (rx) {
>                         if (!wait_for_completion_timeout(&p->done_dma_rx,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
