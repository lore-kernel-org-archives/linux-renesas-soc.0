Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34963 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752614AbcIOLTk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 07:19:40 -0400
Received: by mail-it0-f67.google.com with SMTP id e20so4150115itc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2016 04:19:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914164549.31121-2-ulrich.hecht+renesas@gmail.com>
References: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com> <20160914164549.31121-2-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 13:19:38 +0200
Message-ID: <CAMuHMdVKEA5kY8=S5CNYEoBWw8Rn+HVr=tAYZ0h7DDjUX38ZBA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r8a7796: Add SYS-DMAC clocks
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 14, 2016 at 6:45 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/clk/renesas/r8a7796-cpg-mssr.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> index eb347ed..c02fe34 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -109,6 +109,9 @@ static const struct cpg_core_clk r8a7796_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
> +       DEF_MOD("sys-dmac2",             217,   R8A7796_CLK_S3D1),
> +       DEF_MOD("sys-dmac1",             218,   R8A7796_CLK_S3D1),
> +       DEF_MOD("sys-dmac0",             219,   R8A7796_CLK_S3D1),

It's not clear from the documentation what the actual parent clock is.
The datasheet says "ZS", which we know is S3D1 on H3.
However, Table 50.2 says ZS is S0D3 on M3-W (and H3 ES2.0)....

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
