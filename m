Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34528 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751333AbcEKHyC (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 11 May 2016 03:54:02 -0400
Received: by mail-io0-f196.google.com with SMTP id d62so4725927iof.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 May 2016 00:54:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462944578-1220-2-git-send-email-dirk.behme@de.bosch.com>
References: <1462944578-1220-1-git-send-email-dirk.behme@de.bosch.com>
	<1462944578-1220-2-git-send-email-dirk.behme@de.bosch.com>
Date: Wed, 11 May 2016 09:54:01 +0200
Message-ID: <CAMuHMdV4okk3JuJkQWjXg_XaruYrBzkmP3b4JdgXZLJQxENZ7w@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] boot-mode-reg: Add core
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, May 11, 2016 at 7:29 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> --- /dev/null
> +++ b/drivers/misc/boot-mode-reg/core.c

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
> +       if (!boot_mode_is_set) {

You've dropped the check for calling this function a subsequent time with
a different value of mode?

> +               boot_mode = mode;
> +               boot_mode_is_set = true;
> +               err = 0;
> +       }
> +       mutex_unlock(&boot_mode_mutex);
> +       return err;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
