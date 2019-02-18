Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903D8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 08:43:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68DCA21479
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 08:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbfBRInv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 03:43:51 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:36266 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfBRInv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 03:43:51 -0500
Received: by mail-vs1-f66.google.com with SMTP id t13so9182739vsk.3;
        Mon, 18 Feb 2019 00:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q6hm37jQunpH+A6LuVKWt/R4P3s8OIVHv6k8sRnJKS8=;
        b=sqGR/Kq/vO2Nx5XqMj0DbiAU1tmE74UneTTCO43Wy66rj1oibwgCH7VOihvUjMsKMi
         sd0hJiTDb4Rh0jVJjrd0gf+4Xo3k5FSfV00b0qBHsxyyRuhL0YlEWceS74rWflr7TmCD
         MYnoA1QFW6TWstChs4J28MBJdgXSX2a7EIL7LNWmMOQc11KSKyY0hOHtFKUe8DTscJX+
         NRk/8mHi1Nnuz043qnCaK2uybMIcDU6sSCIL0GGxGcfIWI15KI7SsiTheC3nmHWjPhCa
         8Hb4uP3KWDjhZu6m1zHyJBLl2DMHAeKiz5t/tBxqtDlHfAgmFnkJP0/Zzkv5Tm6/FAS7
         aVLg==
X-Gm-Message-State: AHQUAuZZaCKPIIAJpz2lVpNrX7H2qOCjfSY9jaLXmfIjJYFOHVSgBr5O
        hZk+oQh7cl+0CZLSZsvh9NunxeznLuz3xibms3a3NjGT
X-Google-Smtp-Source: AHgI3IauCptOBn9EsugaIdXkW5syz0m3kLnYpKT7PF498w3a5ZioU0ck2Pv7bAU5Ot+CMkNv8xy7yNjuIW6m2PndNBQ=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr10517102vsc.152.1550479430061;
 Mon, 18 Feb 2019 00:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20190216134923.7277-1-marek.vasut@gmail.com>
In-Reply-To: <20190216134923.7277-1-marek.vasut@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Feb 2019 09:43:38 +0100
Message-ID: <CAMuHMdVkAEmLjUb12iNw49ecwJZU=9Cqsg_d1iEftbF6R7yd7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Retain TDSELCTRL register across suspend/resume
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Sat, Feb 16, 2019 at 2:49 PM <marek.vasut@gmail.com> wrote:
> The TDSELCTRL register is responsible for configuring the SDHI clock
> return path delay and may be adjusted by the bootloader. Retain the
> value across suspend/resume to prevent hardware instability after
> resume.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

Looks good to me. Two comments though.

R-Car D3 (r8a77995) also has a TDSEL register, but it is not handled by
your patch.  Adding that would mean s/SDHI/SDHI and MMC/.

> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -657,6 +657,10 @@ static unsigned int sh_pfc_walk_regs(struct sh_pfc *pfc,
>                 for (i = 0; pfc->info->ioctrl_regs[i].reg; i++)
>                         do_reg(pfc, pfc->info->ioctrl_regs[i].reg, n++);
>
> +       if (pfc->info->tdsel_regs)
> +               for (i = 0; pfc->info->tdsel_regs[i].reg; i++)
> +                       do_reg(pfc, pfc->info->tdsel_regs[i].reg, n++);
> +
>         return n;
>  }

> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -176,6 +176,10 @@ struct pinmux_ioctrl_reg {
>         u32 reg;
>  };
>
> +struct pinmux_tdsel_reg {
> +       u32 reg;
> +};
> +
>  struct pinmux_data_reg {
>         u32 reg;
>         u8 reg_width;
> @@ -270,6 +274,7 @@ struct sh_pfc_soc_info {
>         const struct pinmux_drive_reg *drive_regs;
>         const struct pinmux_bias_reg *bias_regs;
>         const struct pinmux_ioctrl_reg *ioctrl_regs;
> +       const struct pinmux_tdsel_reg *tdsel_regs;
>         const struct pinmux_data_reg *data_regs;
>
>         const u16 *pinmux_data;

Is there any special reason why you added a new block of registers with
separate handling, instead of adding TDSEL to the existing
pinmux_ioctrl_reg[] arrays, which list other IOCTRL registers like
POCCTRL?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
