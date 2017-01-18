Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170117195940.25092-4-chris.brandt@renesas.com>
References: <20170117195940.25092-1-chris.brandt@renesas.com> <20170117195940.25092-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2017 09:41:28 +0100
Message-ID: <CAMuHMdUU-hEMzBQ5gUF3S+N2nR0GHY1nLXEcQcGzd+tH+efBwg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: r7s72100: update sdhi clock bindings
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 17, 2017 at 8:59 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> The SDHI controller in the RZ/A1 has 2 clock sources per channel and both
> need to be enabled/disabled for proper operation. This fixes the fact that
> the define for R7S72100_CLK_SDHI1 was not correct to begin with (typo), and
> that all 4 clock sources need to be defined an used.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Note that this depends on the acceptance of the DT binding doc update.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
