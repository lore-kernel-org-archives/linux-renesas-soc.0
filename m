Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:35094 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752935AbcEWHHV (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 23 May 2016 03:07:21 -0400
Received: by mail-ig0-f171.google.com with SMTP id bi2so28436597igb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 May 2016 00:07:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1463966906-15129-2-git-send-email-horms+renesas@verge.net.au>
References: <1463966906-15129-1-git-send-email-horms+renesas@verge.net.au>
	<1463966906-15129-2-git-send-email-horms+renesas@verge.net.au>
Date: Mon, 23 May 2016 09:07:20 +0200
Message-ID: <CAMuHMdXsu=O13rLysob1Xp+5vWcp7gq6byCffR-6hGc+W-837A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: r8a7796: Add Renesas R8A7796 SoC support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 23, 2016 at 3:28 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Basic support for the Gen 3 R-Car M3-W SoC.
>
> Based on work for the r8a7795 and r8a7796 SoCs by
> Takeshi Kihara, Dirk Behme and Geert Uytterhoeven.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> @@ -0,0 +1,120 @@
> +       psci {
> +               compatible = "arm,psci-1.0";

Do we want to use 1.0 on r8a7795, too?

> +               method = "smc";
> +       };

> +       soc {
> +               compatible = "simple-bus";
> +               interrupt-parent = <&gic>;
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               gic: interrupt-controller@0xf1010000 {

If you drop the "0x" (which is BTW also present in r8a7795.dtsi), you can add
my
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
