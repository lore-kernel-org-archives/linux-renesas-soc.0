Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36540 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752216AbcGAIEv (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 1 Jul 2016 04:04:51 -0400
MIME-Version: 1.0
In-Reply-To: <19325938.k24uiBRvOQ@wasted.cogentembedded.com>
References: <1748403.xeiuK39ynx@wasted.cogentembedded.com> <19325938.k24uiBRvOQ@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Jul 2016 10:04:50 +0200
Message-ID: <CAMuHMdX3VnYBM+xmSrgnAudeH+-ghcLt2GKbGLemGt+SzfQ4zg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A7792 PFC support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Wed, Jun 29, 2016 at 11:21 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the PFC support for the R8A7792 SoC including pin groups for some
> on-chip devices such as SCIF, INTC, and LBSC...

Thanks for your patch!

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

> --- /dev/null
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c


> +/* - LSBC ------------------------------------------------------------------- */

LBSC

> +static const unsigned int lbsc_cs0_pins[] = {
> +       /* CS0# */
> +       RCAR_GP_PIN(3, 27),
> +};

I've only reviewed the numbers of GPIOs per bank, and the pins.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
