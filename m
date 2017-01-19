Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36243 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751510AbdASV0J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 16:26:09 -0500
Received: by mail-wm0-f51.google.com with SMTP id c85so11867753wmi.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jan 2017 13:26:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170117202601.3742-1-wsa@the-dreams.de>
References: <20170117202601.3742-1-wsa@the-dreams.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jan 2017 22:19:57 +0100
Message-ID: <CAPDyKFob1cN_yRdFd846UpX5CQ2a-Cv=93KJ41GAJY2AeRidjQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: tmio: disable clocks when unbinding
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 17 January 2017 at 21:26, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Create a helper function to disable clocks and use it in remove(), too.
> Now, clk_summary in debugfs reports the clocks as disabled and
> unprepared after unbinding.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/tmio_mmc_pio.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/tmio_mmc_pio.c b/drivers/mmc/host/tmio_mmc_pio.c
> index ddba7b833f2c52..db3bde716b3eed 100644
> --- a/drivers/mmc/host/tmio_mmc_pio.c
> +++ b/drivers/mmc/host/tmio_mmc_pio.c
> @@ -947,6 +947,12 @@ static int tmio_mmc_clk_enable(struct tmio_mmc_host *host)
>         return host->clk_enable(host);
>  }
>
> +static void tmio_mmc_clk_disable(struct tmio_mmc_host *host)
> +{
> +       if (host->clk_disable)
> +               host->clk_disable(host);
> +}
> +
>  static void tmio_mmc_power_on(struct tmio_mmc_host *host, unsigned short vdd)
>  {
>         struct mmc_host *mmc = host->mmc;
> @@ -1332,6 +1338,8 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
>
>         pm_runtime_put_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
> +
> +       tmio_mmc_clk_disable(host);
>  }
>  EXPORT_SYMBOL(tmio_mmc_host_remove);
>
> @@ -1346,8 +1354,7 @@ int tmio_mmc_host_runtime_suspend(struct device *dev)
>         if (host->clk_cache)
>                 tmio_mmc_clk_stop(host);
>
> -       if (host->clk_disable)
> -               host->clk_disable(host);
> +       tmio_mmc_clk_disable(host);
>
>         return 0;
>  }
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
