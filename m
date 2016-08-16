Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35651 "EHLO
	mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753517AbcHPPVT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 11:21:19 -0400
Received: by mail-it0-f68.google.com with SMTP id f6so5436337ith.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2016 08:20:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471358833-18248-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1471358833-18248-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1471358833-18248-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2016 17:20:57 +0200
Message-ID: <CAMuHMdU6K1Ub-qDNfcxQtjbWN85fV5BSn17NH9W60o+Hnd-4Eg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: r8a7796: salvator: add serial console pins
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Tue, Aug 16, 2016 at 4:47 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Adds pin control for SCIF2.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> index e72be38..d4a774c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -31,11 +31,20 @@
>         };
>  };
>
> +&pfc {
> +       scif2_pins: scif2 {
> +               groups = "scif2_data_a", "scif2_clk";
> +               function = "scif2";
> +       };
> +};

I think you misunderstood my comment: I didn't mean to add "scif2_clk" (which
is not used on Salvator-X), but "scif_clk", which is the external clock for all
(H)SCIF instances, provided by 14.7456 MHz crystal X1  on Salvator-X.
This is used to program the BRG in SCIF2 to exactly 115200 bps.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
