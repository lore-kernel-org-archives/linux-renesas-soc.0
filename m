Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:45715 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755513AbdJJHdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 03:33:35 -0400
Received: by mail-it0-f51.google.com with SMTP id n195so860242itg.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Oct 2017 00:33:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171008145009.17550-1-wsa+renesas@sang-engineering.com>
References: <20171008145009.17550-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Oct 2017 09:33:34 +0200
Message-ID: <CAPDyKFoT=La2LHhT6SvjZ=FtLYEYbisJ2RZD0REmhpO3MK8WVQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: sunxi: drop superfluous error message
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 8 October 2017 at 16:50, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This error message can go because a) currently nothing else than
> EPROBE_DEFER is returned and b) if this is going to change a much more
> detailed error message should come from mmc_regulator_get_supply()
> anyhow.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>
> While I think this patch is correct as is (because of this discussion [1]), I
> still wonder about the intention of the now removed message. Because a not
> supplied vmmc is not determined by the return value of *_get_supply(), but by a
> check if mmc->supply.vmmc is populated afterwards. So, if this was the original
> intention such a check would need to be implemented on top of this patch.
>
> [1] https://patchwork.kernel.org/patch/9965823/
>
>  drivers/mmc/host/sunxi-mmc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index 53c970fe087397..cc98355dbdb9cc 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1175,11 +1175,8 @@ static int sunxi_mmc_resource_request(struct sunxi_mmc_host *host,
>                 return -EINVAL;
>
>         ret = mmc_regulator_get_supply(host->mmc);
> -       if (ret) {
> -               if (ret != -EPROBE_DEFER)
> -                       dev_err(&pdev->dev, "Could not get vmmc supply\n");
> +       if (ret)
>                 return ret;
> -       }
>
>         host->reg_base = devm_ioremap_resource(&pdev->dev,
>                               platform_get_resource(pdev, IORESOURCE_MEM, 0));
> --
> 2.11.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
