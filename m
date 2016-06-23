Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CACRpkdbTdZAdoSiwqCDJsrwqzoyHoj4kOR+28+go8ZbMXAR4vg@mail.gmail.com>
References: <87twgnrp2z.wl%kuninori.morimoto.gx@renesas.com> <CACRpkdbTdZAdoSiwqCDJsrwqzoyHoj4kOR+28+go8ZbMXAR4vg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jun 2016 10:55:28 +0200
Message-ID: <CAMuHMdWjCZgFmJKy1HfHhi82v4DOvbtvZ6MA=X7EE_Qr-prRdw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: use PINMUX_SINGLE() for I2C
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

On Thu, Jun 23, 2016 at 10:47 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Tue, Jun 21, 2016 at 9:21 AM, Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
>
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> Now we have PINMUX_SINGLE(). Let's use it instead of PINMUX_IPSR_NOGP()
>>
>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Thx!

> Geert, are you queuing this?

Sure, it's time to prepare a pull request soon...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
