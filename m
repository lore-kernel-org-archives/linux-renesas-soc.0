Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46039 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbeJ1WRs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 28 Oct 2018 18:17:48 -0400
Received: by mail-ua1-f68.google.com with SMTP id x3so2007298ual.12
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Oct 2018 06:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <154014429795.2869.7870954544925695802.sendpatchset@octo>
In-Reply-To: <154014429795.2869.7870954544925695802.sendpatchset@octo>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 28 Oct 2018 14:32:56 +0100
Message-ID: <CAMuHMdXv3LYcjpWxRxnVbcei5e7i0VxOL5RRro24b5_mKODakw@mail.gmail.com>
Subject: Re: [PATCH/RFC] iommu/ipmmu-vmsa: R-Car M3-N/V3H/E3 AVB whitelist prototype
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

Thanks for your patch!

On Sun, Oct 21, 2018 at 7:56 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm@opensource.se>
>
> For testing purpose enable IPMMU for Ethernet-AVB on R-Car M3-N/V3H/E3.
>
> Not for upstream merge.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm@opensource.se>
> ---
>
>  Applies on top of renesas-devel-20181019-v4.19-rc8
>
>  drivers/iommu/ipmmu-vmsa.c |    4 ++++
>  1 file changed, 4 insertions(+)
>
> --- 0001/drivers/iommu/ipmmu-vmsa.c
> +++ work/drivers/iommu/ipmmu-vmsa.c     2018-10-22 02:46:30.139880557 +0900
> @@ -756,6 +756,10 @@ static int ipmmu_init_platform_device(st
>
>  static bool ipmmu_slave_whitelist(struct device *dev)
>  {
> +       /* R-Car M3-N/V3H/E3 Ethernet-AVB */
> +       if (!strcmp(dev_name(dev), "e6800000.ethernet"))
> +               return true;

I'm afraid the whitelisting doesn't work that way: with the above check, it will
be enabled on all R-Car Gen3 SoCs.

> +
>         /* By default, do not allow use of IPMMU */
>         return false;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
