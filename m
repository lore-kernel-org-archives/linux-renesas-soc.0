Return-Path: <linux-i2c-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1456103719-10818-1-git-send-email-horms+renesas@verge.net.au>
References: <1456103719-10818-1-git-send-email-horms+renesas@verge.net.au>
Date: Mon, 22 Feb 2016 14:44:34 +0100
Message-ID: <CAMuHMdV7XKdCYoJMYzv8zdUgiQrzWFtzVE2NuOY6Sj=6dnD-dg@mail.gmail.com>
Subject: Re: [PATCH] i2c: riic, sh_mobile, rcar: Use ARCH_RENESAS
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux I2C <linux-i2c@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 22, 2016 at 2:15 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Make use of ARCH_RENESAS in place of ARCH_SHMOBILE.
>
> This is part of an ongoing process to migrate from ARCH_SHMOBILE to
> ARCH_RENESAS the motivation for which being that RENESAS seems to be a more
> appropriate name than SHMOBILE for the majority of Renesas ARM based SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
