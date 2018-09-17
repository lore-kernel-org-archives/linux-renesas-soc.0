Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:40331 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbeIRADf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 20:03:35 -0400
Received: by mail-it0-f66.google.com with SMTP id h23-v6so12268063ita.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 11:35:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180913144708.12085-1-wsa+renesas@sang-engineering.com>
References: <20180913144708.12085-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Sep 2018 20:35:01 +0200
Message-ID: <CAPDyKFoZ1pPZzMdZvT3b6Su3KfiSuy2whdFw+FULAKENsdZ8Vg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 13 September 2018 at 16:47, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>
> Fix warning when running with CONFIG_DMA_API_DEBUG_SG=3Dy by allocating a
> device_dma_parameters structure and filling in the max segment size. The
> size used is the result of a discussion with Renesas hardware engineers
> and unfortunately not found in the datasheet.
>
>   renesas_sdhi_internal_dmac ee140000.sd: DMA-API: mapping sg segment
>   longer than device claims to support [len=3D126976] [max=3D65536]
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> [wsa: simplified some logic after validating intended dma_parms life cycl=
e
>       and added comment]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>
> After discussing with DMA maintainers [1], this really seems the intended=
 way
> of using dma_parms. Took Niklas patch V2 and simplified the logic a bit m=
ore
> given the information from above (but I'll still tackle the dangling poin=
ter
> issue in the DMA core seperately).
>
> [1] https://www.spinics.net/lists/iommu/msg29861.html
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/=
host/renesas_sdhi_internal_dmac.c
> index ca0b43973769..e0823acaa3c2 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -309,12 +309,20 @@ static const struct soc_device_attribute gen3_soc_w=
hitelist[] =3D {
>  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev=
)
>  {
>         const struct soc_device_attribute *soc =3D soc_device_match(gen3_=
soc_whitelist);
> +       struct device *dev =3D &pdev->dev;
>
>         if (!soc)
>                 return -ENODEV;
>
>         global_flags |=3D (unsigned long)soc->data;
>
> +       dev->dma_parms =3D devm_kzalloc(dev, sizeof(*dev->dma_parms), GFP=
_KERNEL);
> +       if (!dev->dma_parms)
> +               return -ENOMEM;
> +
> +       /* value is max of SD_SECCNT. Confirmed by HW engineers */
> +       dma_set_max_seg_size(dev, 0xffffffff);
> +
>         return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_o=
ps);
>  }
>
> --
> 2.11.0
>
