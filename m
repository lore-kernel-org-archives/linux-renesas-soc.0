Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:40354 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933168AbeCEIpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 03:45:51 -0500
Received: by mail-it0-f43.google.com with SMTP id e64so9039813ita.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Mar 2018 00:45:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180304224933.17498-1-wsa+renesas@sang-engineering.com>
References: <20180304224933.17498-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 5 Mar 2018 09:45:50 +0100
Message-ID: <CAPDyKFrT6j36YPGn3fSq8kqZVafpsofsZnP+35XdwLcvGyNXBg@mail.gmail.com>
Subject: Re: [PATCH] mmc: tmio: populate correct callback when using GPIO CD
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 4 March 2018 at 23:49, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> The patch "mmc: tmio: support IP-builtin card detection logic" had a
> typo and populated RO instead of CD. Fix it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Ulf: I didn't add a Fixes: tag because you used to sometimes rebase your
> for-next branch and thus the tag would dangle then. Do you still do that BTW?

No need for a fixes tag, just pointing to the commit as you do in the
changelog is perfectly fine to me.

And yes, I am re-basing my branch from time to time. Until I find the
positive effects of doing so, to become less than the negative, then I
will keep doing it.

>
>  drivers/mmc/host/tmio_mmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index d82dfea381727e..e30df9ad8197c4 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1244,7 +1244,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>                 _host->ops.get_ro = mmc_gpio_get_ro;
>
>         if (mmc_can_gpio_cd(mmc))
> -               _host->ops.get_ro = mmc_gpio_get_cd;
> +               _host->ops.get_cd = mmc_gpio_get_cd;
>
>         _host->native_hotplug = !(mmc_can_gpio_cd(mmc) ||
>                                   mmc->caps & MMC_CAP_NEEDS_POLL ||
> --
> 2.11.0
>

Applied for next!

Kind regards
Uffe
