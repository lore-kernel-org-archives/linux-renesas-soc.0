Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1463479411-10817-2-git-send-email-kieran@bingham.xyz>
References: <1463479411-10817-1-git-send-email-kieran@bingham.xyz>
	<1463479411-10817-2-git-send-email-kieran@bingham.xyz>
Date: Tue, 17 May 2016 12:25:37 +0200
Message-ID: <CAMuHMdWX7H184XBTHxoh76e3=2a+qphZVvvHJiR87MUnJcA4Fg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Provide r8a7795 FDP1 clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kieran Bingham <kieran@ksquared.org.uk>
Cc: linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Tue, May 17, 2016 at 12:03 PM, Kieran Bingham <kieran@ksquared.org.uk> wrote:
> Add the clocks with a parent of S2D1 for now, until the correct
> parentage is identified

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> @@ -128,6 +128,9 @@ static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>  };
>
>  static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
> +       DEF_MOD("fdp1-ch2",              117,   R8A7795_CLK_S2D1),
> +       DEF_MOD("fdp1-ch1",              118,   R8A7795_CLK_S2D1),
> +       DEF_MOD("fdp1-ch0",              119,   R8A7795_CLK_S2D1),

I would call them "fdp1-2" etc., to match the documentation for the various
Module Stop registers.

Apart from that:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
