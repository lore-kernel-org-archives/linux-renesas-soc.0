Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170117195940.25092-3-chris.brandt@renesas.com>
References: <20170117195940.25092-1-chris.brandt@renesas.com> <20170117195940.25092-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2017 09:44:49 +0100
Message-ID: <CAMuHMdVqgrfPVCz68z9vqX_5GhKVbF-FndraTk40UrBdMMKwYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mmc: sh_mobile_sdhi: explain clock bindings
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

Hi Chris,

On Tue, Jan 17, 2017 at 8:59 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> In the case of a single clock source, you don't need names. However,
> if the controller has 2 clock sources, you need to name them correctly
> so the driver can find the 2nd one.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index a1650ed..258b98c 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -25,8 +25,29 @@ Required properties:
>                 "renesas,sdhi-r8a7795" - SDHI IP on R8A7795 SoC
>                 "renesas,sdhi-r8a7796" - SDHI IP on R8A7796 SoC
>
> +- clocks: Most controllers only have 1 clock source per cahnnel. However, some
> +         have 2. If 2 clocks are specified, you must name them as "core" and
> +         "carddetect". If the controller only has 1 clock, naming is not

Perhaps this clock should just be called "cd", as that's already an
established abbreviation for card detect in MMC DT bindings?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
