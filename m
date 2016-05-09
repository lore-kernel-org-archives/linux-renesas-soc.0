Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35691 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbcEIHnA (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:43:00 -0400
Received: by mail-io0-f194.google.com with SMTP id u185so20317130iod.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 00:42:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462778041-19595-2-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
	<1462778041-19595-2-git-send-email-dirk.behme@de.bosch.com>
Date: Mon, 9 May 2016 09:42:59 +0200
Message-ID: <CAMuHMdXjXsrG+Y4ik0syzOZSyH4-7ej3zbJmTduwWLA+1BAgCg@mail.gmail.com>
Subject: Re: [PATCH 01/10] boot-mode-reg: Add core
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 9, 2016 at 9:13 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> --- /dev/null
> +++ b/drivers/misc/boot-mode-reg/core.c
> @@ -0,0 +1,78 @@

> +/**
> + * boot_mode_reg_get() - retrieve boot mode register value
> + * @mode: implementation-dependent boot mode register value
> + *
> + * Retrieves the boot mode register value previously registered
> + * using boot_mode_reg_set().
> + *
> + * return: 0 on success
> + */
> +int boot_mode_reg_get(u32 *mode)
> +{
> +       int err = -ENOENT;
> +
> +       mutex_lock(&boot_mode_mutex);
> +       if (!boot_mode_is_set)
> +               goto err;
> +       *mode = boot_mode;
> +       err = 0;
> +err:

The goto and label can easily be avoided by inverting the if condition:

        if (boot_mode_is_set) {
                *mode = boot_mode;
                err = 0;
        }

> +       mutex_unlock(&boot_mode_mutex);
> +       return err;
> +}
> +EXPORT_SYMBOL_GPL(boot_mode_reg_get);
> +
> +/**
> + * boot_mode_reg_set() - record boot mode register value
> + * @mode: implementation-dependent boot mode register value
> + *
> + * Records the boot mode register value which may subsequently
> + * be retrieved using boot_mode_reg_get().
> + *
> + * return: 0 on success
> + */
> +int boot_mode_reg_set(u32 mode)
> +{
> +       int err = -EBUSY;
> +
> +       mutex_lock(&boot_mode_mutex);
> +       if (boot_mode_is_set && boot_mode != mode)
> +               goto err;
> +       boot_mode = mode;
> +       boot_mode_is_set = true;
> +       err = 0;
> +err:

Convert goto and label to inverted if.

> +       mutex_unlock(&boot_mode_mutex);
> +       return err;
> +}
> +EXPORT_SYMBOL_GPL(boot_mode_reg_set);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
