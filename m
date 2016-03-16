Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <874mc7fe29.wl%kuninori.morimoto.gx@renesas.com>
References: <8760wnfe3r.wl%kuninori.morimoto.gx@renesas.com>
	<874mc7fe29.wl%kuninori.morimoto.gx@renesas.com>
Date: Wed, 16 Mar 2016 09:27:22 +0100
Message-ID: <CAMuHMdVhLSXLVT5HYW=TfxZgM7TdtcJdsbqcVz-56U_AYczhng@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: enable to indicate GPSR/IPSR/MOD_SEL
 for debug
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Magnus <magnus.damm@gmail.com>, Simon <horms@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, Mar 16, 2016 at 1:47 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current sh_pfc can't indicate GPSR/IPSR/MOD_SEL name for debug.
> Of course we can get it from indicated register address, but it
> is not convenient. This patch enables to indicate these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -94,6 +94,7 @@ struct pinmux_func {
>  };
>
>  struct pinmux_cfg_reg {
> +       const char *name;

Have you looked at the size increase, esp. for multi-platform kernels?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
