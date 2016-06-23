Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87twgnrp2z.wl%kuninori.morimoto.gx@renesas.com>
References: <87twgnrp2z.wl%kuninori.morimoto.gx@renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Jun 2016 10:47:19 +0200
Message-ID: <CACRpkdbTdZAdoSiwqCDJsrwqzoyHoj4kOR+28+go8ZbMXAR4vg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: use PINMUX_SINGLE() for I2C
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Magnus <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jun 21, 2016 at 9:21 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Now we have PINMUX_SINGLE(). Let's use it instead of PINMUX_IPSR_NOGP()
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Geert, are you queuing this?

Yours,
Linus Walleij
