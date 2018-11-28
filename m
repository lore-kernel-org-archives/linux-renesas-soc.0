Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:43638 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbeK1Tru (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 14:47:50 -0500
Received: by mail-ua1-f67.google.com with SMTP id z11so8605632uaa.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Nov 2018 00:46:59 -0800 (PST)
MIME-Version: 1.0
References: <1543385279-1584-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1543385279-1584-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1543385279-1584-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Nov 2018 09:46:46 +0100
Message-ID: <CAMuHMdVfQgsAgUVBpApjuL=Nv16L=SfCd8vDtFwvR3F4qYpfUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/ipmmu-vmsa: Modify ipmmu_slave_whitelist() to
 check SoC revisions
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Shimoda-san,

On Wed, Nov 28, 2018 at 7:10 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Some R-Car Gen3 SoCs has hardware restrictions on the IPMMU. So,
> to check whether this R-Car Gen3 SoC can use the IPMMU correctly,
> this patch modifies the ipmmu_slave_whitelist().
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One question below.

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c

> @@ -771,11 +765,35 @@ static bool ipmmu_slave_whitelist(struct device *dev)
>         { /* sentinel */ }
>  };
>
> +static const struct soc_device_attribute soc_rcar_gen3_whitelist[] = {
> +       { .soc_id = "r8a7795", .revision = "ES3.0" },

Don't you want "ES3.*"?

> +       { .soc_id = "r8a77965", },
> +       { .soc_id = "r8a77990", },
> +       { .soc_id = "r8a77995", },
> +       { /* sentinel */ }
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
