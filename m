Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:33645 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727597AbeHWMM3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 08:12:29 -0400
Received: by mail-vk0-f67.google.com with SMTP id w187-v6so2228965vkw.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 01:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <1534516265-10059-1-git-send-email-fabrizio.castro@bp.renesas.com> <1534516265-10059-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1534516265-10059-2-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Aug 2018 10:43:40 +0200
Message-ID: <CAMuHMdUe=p42Bp6xgmvrNwPKs=VHUP2BezDBPPn9KgPawvOtgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/ipmmu-vmsa: Hook up R8A774A1 DT maching code
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Fri, Aug 17, 2018 at 4:31 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add support for RZ/G2M (R8A774A1) SoC IPMMUs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch applies on top of renesas-drivers-2018-07-31-v4.18-rc7
>
>  drivers/iommu/ipmmu-vmsa.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 51af2c5..cf5cfcf 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -761,6 +761,7 @@ static bool ipmmu_slave_whitelist(struct device *dev)
>  }
>
>  static const struct soc_device_attribute soc_rcar_gen3[] = {
> +       { .soc_id = "r8a774a1", },
>         { .soc_id = "r8a7795", },
>         { .soc_id = "r8a7796", },
>         { .soc_id = "r8a77965", },
> @@ -942,6 +943,9 @@ static const struct of_device_id ipmmu_of_ids[] = {
>                 .compatible = "renesas,ipmmu-vmsa",
>                 .data = &ipmmu_features_default,
>         }, {
> +               .compatible = "renesas,ipmmu-r8a774a1",
> +               .data = &ipmmu_features_rcar_gen3,
> +       }, {
>                 .compatible = "renesas,ipmmu-r8a7795",
>                 .data = &ipmmu_features_rcar_gen3,
>         }, {
> @@ -1143,6 +1147,7 @@ subsys_initcall(ipmmu_init);
>  module_exit(ipmmu_exit);
>
>  IOMMU_OF_DECLARE(ipmmu_vmsa_iommu_of, "renesas,ipmmu-vmsa");
> +IOMMU_OF_DECLARE(ipmmu_r8a774a1_iommu_of, "renesas,ipmmu-r8a774a1");
>  IOMMU_OF_DECLARE(ipmmu_r8a7795_iommu_of, "renesas,ipmmu-r8a7795");
>  IOMMU_OF_DECLARE(ipmmu_r8a7796_iommu_of, "renesas,ipmmu-r8a7796");
>  IOMMU_OF_DECLARE(ipmmu_r8a77965_iommu_of, "renesas,ipmmu-r8a77965");

The IOMMU_OF_DECLARE() lines will be gone v4.18-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
