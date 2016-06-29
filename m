Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:34802 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752399AbcF2MHd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 08:07:33 -0400
Received: by mail-io0-f193.google.com with SMTP id 100so5035972ioh.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2016 05:07:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467106492-1341-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1467106492-1341-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jun 2016 14:07:32 +0200
Message-ID: <CAMuHMdX7chhsWKanVq1o+mfucPitYMaTKHAQkbTa7caF8u2Nnw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: r8a7795: salvator: add serial console pins
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Tue, Jun 28, 2016 at 11:34 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Adds pin control for SCIF2.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> index 9c52613..10fceaf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -31,11 +31,20 @@
>         };
>  };
>
> +&pfc {
> +       scif2_pins: scif2 {
> +               groups = "scif2_data_a";
> +               function = "scif2";
> +       };

Given the driver configures the SCIF to use scif_clk for 115200 bps, I think
you should add support for the scif_clk pins, too. Currently it relies on the
boot loader having configured pinctrl for scif_clk.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
