Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:32777 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbeIRAD0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 20:03:26 -0400
Received: by mail-it0-f66.google.com with SMTP id j198-v6so11906981ita.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 11:34:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180911130626.7232-1-wsa@the-dreams.de>
References: <20180911130626.7232-1-wsa@the-dreams.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Sep 2018 20:34:52 +0200
Message-ID: <CAPDyKFpRMkg3+F+Rn0JMvpNbZ7GLqe5-wbnTwDzq+JSA6Rh7HA@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: sdhi: sys_dmac: check for all Gen3 types when whitelisting
To: Wolfram Sang <wsa@the-dreams.de>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11 September 2018 at 15:06, Wolfram Sang <wsa@the-dreams.de> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Fixes: 26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes, thanks!

Kind regards
Uffe

> ---
>
> So, adding HS400 support broke the detection here. I suggest we discuss
> internally, if this kind of white listing is still needed, at all. Until
> then, this patch makes things work again on H3 and M3-W.
>
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index f5fcbb5dc8cd..f027f66fe0c1 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -495,7 +495,8 @@ static const struct soc_device_attribute gen3_soc_whitelist[] = {
>
>  static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
>  {
> -       if (of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible &&
> +       if ((of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible ||
> +           of_device_get_match_data(&pdev->dev) == &of_rcar_r8a7795_compatible) &&
>             !soc_device_match(gen3_soc_whitelist))
>                 return -ENODEV;
>
> --
> 2.18.0
>
