Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41800 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbeJDOH7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 10:07:59 -0400
MIME-Version: 1.0
References: <34a21e56-22b0-3603-1aba-0800aa02eff7@cogentembedded.com>
In-Reply-To: <34a21e56-22b0-3603-1aba-0800aa02eff7@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Oct 2018 09:15:57 +0200
Message-ID: <CAMuHMdWSvrqe38gXtjNiu7VXiy0sNHLuMi0ySg+A8iBR-FXdkQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: rcar_thermal: fix duplicate IRQ request
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CC Kaneko-san,

On Wed, Oct 3, 2018 at 10:47 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The driver on R8A77995 requests the same IRQ twice since
> platform_get_resource() is always called for the 1st IRQ resource.
>
> Fixes: 1969d9dc2079 ("thermal: rcar_thermal: add r8a77995 support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Nice catch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- linux.orig/drivers/thermal/rcar_thermal.c
> +++ linux/drivers/thermal/rcar_thermal.c
> @@ -504,7 +504,7 @@ static int rcar_thermal_probe(struct pla
>         pm_runtime_get_sync(dev);
>
>         for (i = 0; i < chip->nirqs; i++) {
> -               irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +               irq = platform_get_resource(pdev, IORESOURCE_IRQ, i);
>                 if (!irq)
>                         continue;
>                 if (!common->base) {


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
