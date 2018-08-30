Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:43826 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbeH3Qcd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:32:33 -0400
Received: by mail-io0-f194.google.com with SMTP id y10-v6so7359661ioa.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 05:30:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180830121438.12588-1-wsa+renesas@sang-engineering.com>
References: <20180830121438.12588-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Aug 2018 14:30:37 +0200
Message-ID: <CAPDyKFpzg4wHwsCGbExg3mQxhEVbxcZFOL+WRyP627YnFVRmPA@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: more concise clk calculation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30 August 2018 at 14:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Concise, but still readable.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/tmio_mmc.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
> index 0ae9ba1ee01b..0ae100e62b57 100644
> --- a/drivers/mmc/host/tmio_mmc.c
> +++ b/drivers/mmc/host/tmio_mmc.c
> @@ -56,14 +56,9 @@ static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
>
>         divisor = host->pdata->hclk / new_clock;
>
> -       if (divisor <= 1) {
> -               clk_sel = 1;
> -               clk = 0;
> -       } else {
> -               clk_sel = 0;
> -               /* bit7 set: 1/512, ... bit0 set:1/4, all bits clear: 1/2 */
> -               clk = roundup_pow_of_two(divisor) >> 2;
> -       }
> +       /* bit7 set: 1/512, ... bit0 set: 1/4, all bits clear: 1/2 */
> +       clk_sel = (divisor <= 1);
> +       clk = clk_sel ? 0 : (roundup_pow_of_two(divisor) >> 2);
>
>         host->pdata->set_clk_div(host->pdev, clk_sel);
>
> --
> 2.11.0
>
