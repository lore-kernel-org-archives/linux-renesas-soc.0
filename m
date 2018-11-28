Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:46829 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbeK1Tst (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Nov 2018 14:48:49 -0500
Received: by mail-ua1-f65.google.com with SMTP id v24so8608386uap.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Nov 2018 00:47:58 -0800 (PST)
MIME-Version: 1.0
References: <1543385279-1584-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1543385279-1584-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1543385279-1584-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Nov 2018 09:47:45 +0100
Message-ID: <CAMuHMdUmrJXtXegxzVoy9ELsXuigux705BGakkzUhTxrdszAkQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: add an array of slave devices whitelist
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
> To avoid adding copy and pasted strcmp codes in the future,
> this patch adds an array "rcar_gen3_slave_whitelist" to check
> whether the device can work with the IPMMU or not.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One small comment below.

> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -773,8 +773,13 @@ static int ipmmu_init_platform_device(struct device *dev,
>         { /* sentinel */ }
>  };
>
> +static const char * const rcar_gen3_slave_whitelist[] = {
> +};
> +
>  static bool ipmmu_slave_whitelist(struct device *dev)
>  {
> +       int i;

unsigned int

> +
>         /*
>          * For R-Car Gen3 use a white list to opt-in slave devices.
>          * For Other SoCs, this returns true anyway.
> @@ -786,7 +791,13 @@ static bool ipmmu_slave_whitelist(struct device *dev)
>         if (!soc_device_match(soc_rcar_gen3_whitelist))
>                 return false;
>
> -       /* By default, do not allow use of IPMMU */
> +       /* Check whether this slave device can work with the IPMMU */
> +       for (i = 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
> +               if (!strcmp(dev_name(dev), rcar_gen3_slave_whitelist[i]))
> +                       return true;
> +       }
> +
> +       /* Otherwise, do not allow use of IPMMU */
>         return false;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
