Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35240 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753352AbcEIHoz (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 03:44:55 -0400
Received: by mail-io0-f196.google.com with SMTP id u185so20321222iod.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 May 2016 00:44:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462778041-19595-10-git-send-email-dirk.behme@de.bosch.com>
References: <1462778041-19595-1-git-send-email-dirk.behme@de.bosch.com>
	<1462778041-19595-10-git-send-email-dirk.behme@de.bosch.com>
Date: Mon, 9 May 2016 09:44:54 +0200
Message-ID: <CAMuHMdWHmu0WQSeU8oHwUhm20ZGqzmLGXG1tz8suuGqY=b49Vg@mail.gmail.com>
Subject: Re: [PATCH 09/10] ARM: r8a779x: Add boot mode reg support
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 9, 2016 at 9:14 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> --- a/arch/arm/boot/dts/r8a7790.dtsi
> +++ b/arch/arm/boot/dts/r8a7790.dtsi
> @@ -1102,6 +1102,11 @@
>                         #power-domain-cells = <0>;
>                 };
>
> +               modemr: modemr@e6160060 {
> +                       compatible = "renesas,modemr";
> +                       reg = <0 0xe6160060 0 0x4>;
> +               };
> +

This should be a node for the complete RST module, not just for the RST module's
MODEMR register.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
