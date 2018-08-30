Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:39800 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbeH3Qc0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:32:26 -0400
Received: by mail-it0-f68.google.com with SMTP id h1-v6so2422186itj.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 05:30:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1534999460-15111-7-git-send-email-yamada.masahiro@socionext.com>
References: <1534999460-15111-1-git-send-email-yamada.masahiro@socionext.com> <1534999460-15111-7-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Aug 2018 14:30:29 +0200
Message-ID: <CAPDyKFpHHviQevw_rH3LzT7jMeLuYOyhmGD6+TwDx4AmfsDeuw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] mmc: tmio: refactor CLK_CTL bit calculation
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 23 August 2018 at 06:44, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>   for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
>           clock <<= 1;
>
> ... is too tricky, hence I replaced with
>
>   roundup_pow_of_two(divisor) >> 2
>
> '(clk >> 22) & 0x1' is the bit test for the 1/1 divisor, but
> it is not clear.  'divisor <= 1' is easier to understand.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  drivers/mmc/host/tmio_mmc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
> index b031a77..e04c322 100644
> --- a/drivers/mmc/host/tmio_mmc.c
> +++ b/drivers/mmc/host/tmio_mmc.c
> @@ -48,19 +48,27 @@ static void tmio_mmc_clk_stop(struct tmio_mmc_host *host)
>  static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
>                                unsigned int new_clock)
>  {
> -       u32 clk = 0, clock;
> +       unsigned int clock, divisor;
> +       u32 clk = 0;
> +       int clk_sel;
>
>         if (new_clock == 0) {
>                 tmio_mmc_clk_stop(host);
>                 return;
>         }
>
> -       clock = host->mmc->f_min;
> +       divisor = host->pdata->hclk / new_clock;
>
> -       for (clk = 0x80000080; new_clock >= (clock << 1); clk >>= 1)
> -               clock <<= 1;
> +       if (divisor <= 1) {
> +               clk_sel = 1;
> +               clk = 0;
> +       } else {
> +               clk_sel = 0;
> +               /* bit7 set: 1/512, ... bit0 set:1/4, all bits clear: 1/2 */
> +               clk = roundup_pow_of_two(divisor) >> 2;
> +       }
>
> -       host->pdata->set_clk_div(host->pdev, (clk >> 22) & 1);
> +       host->pdata->set_clk_div(host->pdev, clk_sel);
>
>         sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>                         sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
> --
> 2.7.4
>
