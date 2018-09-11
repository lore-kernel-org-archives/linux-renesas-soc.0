Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:41436 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbeIKS2f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 14:28:35 -0400
Received: by mail-io0-f194.google.com with SMTP id q4-v6so3517693iob.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Sep 2018 06:29:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180911130626.7232-1-wsa@the-dreams.de>
References: <20180911130626.7232-1-wsa@the-dreams.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Sep 2018 15:29:14 +0200
Message-ID: <CAPDyKFoppKoS9fG5+4Tb9av3RfC_6nhYqG7Mixa8x7A3gGyn1g@mail.gmail.com>
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
> ---
>
> So, adding HS400 support broke the detection here. I suggest we discuss
> internally, if this kind of white listing is still needed, at all. Until
> then, this patch makes things work again on H3 and M3-W.

As this is tagged "RFC PATCH", does it mean that you want the
discussion to happen before I apply this for fixes?

Kind regards
Uffe

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
