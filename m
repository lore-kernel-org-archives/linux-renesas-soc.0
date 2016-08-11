Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33190 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752439AbcHKJRT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 11 Aug 2016 05:17:19 -0400
Received: by mail-it0-f66.google.com with SMTP id d65so51321ith.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Aug 2016 02:17:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1470745752-23738-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1470745752-23738-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1470745752-23738-5-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2016 11:17:17 +0200
Message-ID: <CAMuHMdXKVocK4pCF8h6h53263AzFfO9wdmN7wigH5xvLUpTA-g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: renesas: salvator-x: Enable DU
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Aug 9, 2016 at 2:29 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Only the VGA output is supported for now.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

One question below, though...

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -135,6 +135,50 @@

> +&du {
> +       status = "okay";

Don't you need pinctrl properties? Or are you relying on initial settings?

GPSR initial settings for DU depend on MD[4:1] i.e. SW10[5:8].
The defaults on my board are not 0000, so all DU pins are GPIOs?
IPSR initial settings don't seem to be documented.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
