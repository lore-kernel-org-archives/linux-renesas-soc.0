Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34241 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751697AbeBYNOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Feb 2018 08:14:45 -0500
MIME-Version: 1.0
In-Reply-To: <7b64c7c2-b51b-7526-e65e-3648f98fef5c@cogentembedded.com>
References: <7b64c7c2-b51b-7526-e65e-3648f98fef5c@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 25 Feb 2018 14:14:43 +0100
Message-ID: <CAMuHMdWCR+yHxwUJuvaDq4ZFuxExjuAZrEY_Vkj88EHbEpi_Og@mail.gmail.com>
Subject: Re: [PATCH net-next] sh_eth: TSU_QTAG0/1 registers the same as TSU_QTAGM0/1
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Sat, Feb 24, 2018 at 6:28 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The TSU_QTAG0/1 registers found in the Gigabit Ether controllers actually
> have the same long name  as the TSU_QTAGM0/1 registers in the early Ether
> controllers:  Qtag Addition/Deletion Set Register (Port 0/1 to 1/0); thus
> there's no need to make a difference in sh_eth_tsu_init() between those
> controllers. Unfortunately, we can't just remove TSU_QTAG0/1 from the
> register *enum* because that would break the ethtool register dump...
>
> Fixes: b0ca2a21f769 ("sh_eth: Add support of SH7763 to sh_eth")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.c

> @@ -2097,8 +2097,6 @@ static size_t __sh_eth_get_regs(struct n
>                 add_tsu_reg(TSU_FWSL0);
>                 add_tsu_reg(TSU_FWSL1);
>                 add_tsu_reg(TSU_FWSLC);
> -               add_tsu_reg(TSU_QTAG0);
> -               add_tsu_reg(TSU_QTAG1);

Shouldn't you keep the above for ethtool register dump?

>                 add_tsu_reg(TSU_QTAGM0);
>                 add_tsu_reg(TSU_QTAGM1);
>                 add_tsu_reg(TSU_FWSR);

> --- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
> +++ net-next/drivers/net/ethernet/renesas/sh_eth.h
> @@ -118,8 +118,8 @@ enum {
>         TSU_FWSL0,
>         TSU_FWSL1,
>         TSU_FWSLC,
> -       TSU_QTAG0,
> -       TSU_QTAG1,
> +       TSU_QTAG0,                      /* Same as TSU_QTAGM0 */
> +       TSU_QTAG1,                      /* Same as TSU_QTAGM1 */
>         TSU_QTAGM0,
>         TSU_QTAGM1,
>         TSU_FWSR,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
