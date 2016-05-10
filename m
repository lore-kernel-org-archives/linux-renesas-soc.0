Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f194.google.com ([209.85.213.194]:34077 "EHLO
	mail-ig0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbcEJHjv (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 03:39:51 -0400
MIME-Version: 1.0
In-Reply-To: <5731672B.9040204@rvc.renesas.com>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
	<573166EB.70908@rvc.renesas.com>
	<5731672B.9040204@rvc.renesas.com>
Date: Tue, 10 May 2016 09:39:44 +0200
Message-ID: <CAMuHMdVtw564ZQbhGPLbZoReCHmnevedEWMFj5Ndf49chkpL7Q@mail.gmail.com>
Subject: Re: [RFC 3/4] clk: renesas: r8a7796: Add Z clock
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Khiem,

On Tue, May 10, 2016 at 6:44 AM, Khiem Nguyen
<khiem.nguyen.xt@rvc.renesas.com> wrote:
> index c84b549..7368805 100644
> --- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
> @@ -94,6 +94,8 @@ static const struct cpg_core_clk r8a7796_core_clks[]
> __initconst = {
>
>         DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
>         DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
> +
> +       DEF_BASE("z",           R8A7795_CLK_Z,   CLK_TYPE_GEN3_Z,   CLK_PLL0),

R8A7796_CLK_Z?

How could that work?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
