Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:35597 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752059AbcEPIQZ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 16 May 2016 04:16:25 -0400
MIME-Version: 1.0
In-Reply-To: <1463126163-29423-23-git-send-email-geert+renesas@glider.be>
References: <1463126163-29423-1-git-send-email-geert+renesas@glider.be>
	<1463126163-29423-23-git-send-email-geert+renesas@glider.be>
Date: Mon, 16 May 2016 10:16:24 +0200
Message-ID: <CAMuHMdV6QwYwWkNfnBZZZdJG7=19ip81kYRKB4MTKH_K857fKA@mail.gmail.com>
Subject: Re: [PATCH 22/23] arm64: dts: r8a7795: Fix W=1 dtc warnings
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	linux-renesas-soc@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 13, 2016 at 9:56 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -69,20 +69,22 @@
>                         next-level-cache = <&L2_CA57>;
>                         enable-method = "psci";
>                 };
> -       };
>
> -       L2_CA57: cache-controller@0 {
> -               compatible = "cache";
> -               power-domains = <&sysc R8A7795_PD_CA57_SCU>;
> -               cache-unified;
> -               cache-level = <2>;
> -       };
> +               L2_CA57: cache-controller@0 {
> +                       compatible = "cache";
> +                       reg = <0>;
> +                       power-domains = <&sysc R8A7795_PD_CA57_SCU>;
> +                       cache-unified;
> +                       cache-level = <2>;
> +               };
>
> -       L2_CA53: cache-controller@1 {
> -               compatible = "cache";
> -               power-domains = <&sysc R8A7795_PD_CA53_SCU>;
> -               cache-unified;
> -               cache-level = <2>;
> +               L2_CA53: cache-controller@100 {
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
