Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:34849 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753065AbcEIHqb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:46:31 -0400
Received: by mail-ig0-f195.google.com with SMTP id jn6so10687217igb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 00:46:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462778041-19595-11-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
	<1462778041-19595-11-git-send-email-dirk.behme@de.bosch.com>
Date: Mon, 9 May 2016 09:46:29 +0200
Message-ID: <CAMuHMdVc0FMQ=COP=caFKSqMtSVE6gJB-P=Nsz+fA0DG26HB4Q@mail.gmail.com>
Subject: Re: [PATCH 10/10] boot-mode-reg: Convert to device tree
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 9, 2016 at 9:14 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> --- a/drivers/misc/boot-mode-reg/rcar.c
> +++ b/drivers/misc/boot-mode-reg/rcar.c
> @@ -16,24 +16,32 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>
>  #include <misc/boot-mode-reg.h>
>
> -#define MODEMR 0xe6160060
> -
>  static int __init rcar_read_mode_pins(void)
>  {
>         void __iomem *modemr;
> +       struct device_node *np;
>         int err = -ENOMEM;
>         static u32 mode;
>
> -       modemr = ioremap_nocache(MODEMR, 4);
> +       np = of_find_compatible_node(NULL, NULL, "renesas,modemr");
> +       if (!np) {
> +               pr_err("can't find renesas,modemr device node");
> +               goto err;

At least for R-Car Gen2, we need to preserve compatibility with old DTBs that
don't have the node in DT.

> +       }
> +
> +       modemr = of_iomap(np, 0);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
