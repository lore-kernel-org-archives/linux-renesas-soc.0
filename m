Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1463126163-29423-6-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
	<1463126163-29423-6-git-send-email-geert+renesas@glider.be>
Date: Mon, 16 May 2016 10:15:33 +0200
Message-ID: <CAMuHMdXxNS309-wB3tsuBzps9vqYDvqq2bd=9H_XXemELvcFSA@mail.gmail.com>
Subject: Re: [PATCH 05/23] ARM: dts: r8a7790: Fix W=1 dtc warnings
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	linux-renesas-soc@vger.kernel.org,
	Kumar Gala <galak@codeaurora.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 13, 2016 at 9:55 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -127,6 +127,22 @@
>                         power-domains = <&sysc R8A7790_PD_CA7_CPU3>;
>                         next-level-cache = <&L2_CA7>;
>                 };
> +
> +               L2_CA15: cache-controller@0 {
> +                       compatible = "cache";
> +                       reg = <0>;
> +                       power-domains = <&sysc R8A7790_PD_CA15_SCU>;
> +                       cache-unified;
> +                       cache-level = <2>;
> +               };
> +
> +               L2_CA7: cache-controller@100 {
> +                       compatible = "cache";
> +                       reg = <100>;

Oops, <0x100>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
