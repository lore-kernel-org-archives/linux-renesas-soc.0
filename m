Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:39832 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729485AbeGaKWo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jul 2018 06:22:44 -0400
MIME-Version: 1.0
References: <20180725191546.3416-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180725191546.3416-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Jul 2018 10:43:17 +0200
Message-ID: <CAMuHMdXb62LQm8OFTYjv3UUzQkO+92of9T-Xp1X+56dfjwmP1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77965: Add SATA pins, groups and functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Jul 25, 2018 at 9:15 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds SATA0 pin, group and function to the R8A77965 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [wsa: rebased to upstream base]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c

> @@ -3664,6 +3685,11 @@ static const char * const du_groups[] = {
>         "du_disp",
>  };
>
> +static const char * const sata0_groups[] = {
> +       "sata0_devslp_a",
> +       "sata0_devslp_b",
> +};
> +

Moving the above hunk to its correct destination while applying...

>  static const char * const hscif0_groups[] = {
>         "hscif0_data",
>         "hscif0_clk",

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
