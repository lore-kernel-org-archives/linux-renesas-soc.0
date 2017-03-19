Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34805 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751490AbdCSODb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Mar 2017 10:03:31 -0400
Received: by mail-it0-f67.google.com with SMTP id r141so12309415ita.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Mar 2017 07:02:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170318205226.GA11403@x230>
References: <20170318205226.GA11403@x230>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 Mar 2017 15:02:48 +0100
Message-ID: <CAMuHMdWzHLDjXknbK+Vik-7Qyi_WgcZL4JB5U_srKMh1sZa7Vg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Print correct pinmux info name
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

On Sat, Mar 18, 2017 at 9:52 PM, Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> commit 0c151062f32c ("sh-pfc: Add support for SoC-specific
> initialization") allows defining SoC specific init functions.
> Such custom functions can register new pinmux info structures.
> Here is an example:
>
> static int my_pinmux_init(struct sh_pfc *pfc)
> {
>     if (my_criteria())
>         pfc->info = &new_pinmux_info;
> }
>
> A side effect of the pfc->info update in the above example is that
> the `const struct sh_pfc_soc_info *info` pointer used in the probe
> routine becomes outdated. One consequence of it is printing the wrong
> pinmux info structure name at the end of `sh_pfc_probe()`. Fix this.
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks for your patch!
But next time, please send it inline, for easier commenting.

> ---
>  drivers/pinctrl/sh-pfc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 6399eb1feb12..37fc70fb8e4d 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -703,7 +703,7 @@ static int sh_pfc_probe(struct platform_device *pdev)
>
>       platform_set_drvdata(pdev, pfc);
>
> -     dev_info(pfc->dev, "%s support registered\n", info->name);
> +     dev_info(pfc->dev, "%s support registered\n", pfc->info->name);

>From a code maintenance point of view, I think it's safer to update the info
pointer itself, cfr. "[PATCH v2 1/4] pinctrl: sh-pfc: Update info pointer
after SoC-specific init"
(https://www.spinics.net/lists/linux-renesas-soc/msg12375.html).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
