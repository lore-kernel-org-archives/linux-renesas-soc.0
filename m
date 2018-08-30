Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:51430 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728841AbeH3Qco (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 12:32:44 -0400
Received: by mail-it0-f66.google.com with SMTP id e14-v6so2346684itf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 05:30:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180830121603.13202-1-wsa+renesas@sang-engineering.com>
References: <20180830121603.13202-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 30 Aug 2018 14:30:47 +0200
Message-ID: <CAPDyKFqwK17O0EHO=zbHo+UuU2WeU9yr2yPTky5Z=ioai9GYVA@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: remove now unused variable
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 30 August 2018 at 14:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This variable is unused now after some refactoring.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/tmio_mmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc.c b/drivers/mmc/host/tmio_mmc.c
> index 0ae100e62b57..29bda8224ae7 100644
> --- a/drivers/mmc/host/tmio_mmc.c
> +++ b/drivers/mmc/host/tmio_mmc.c
> @@ -45,7 +45,7 @@ static void tmio_mmc_clk_stop(struct tmio_mmc_host *host)
>  static void tmio_mmc_set_clock(struct tmio_mmc_host *host,
>                                unsigned int new_clock)
>  {
> -       unsigned int clock, divisor;
> +       unsigned int divisor;
>         u32 clk = 0;
>         int clk_sel;
>
> --
> 2.11.0
>
