Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36673 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758479AbdAIKV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 05:21:57 -0500
Received: by mail-it0-f65.google.com with SMTP id n68so8800183itn.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Jan 2017 02:21:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <c9293d784d32c868e83079bb6d1e26f316c4148d.1483700694.git.horms+renesas@verge.net.au>
References: <cover.1483700694.git.horms+renesas@verge.net.au> <c9293d784d32c868e83079bb6d1e26f316c4148d.1483700694.git.horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Jan 2017 11:21:56 +0100
Message-ID: <CAMuHMdWz56S2oeFhoZvaPz7Dgf2se+feDTkWAqofRMjNjr6vpg@mail.gmail.com>
Subject: Re: [PATCH 07/16] arm64: dts: r8a7795: add sound CTU support
To: Simon Horman <horms+renesas@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 6, 2017 at 12:17 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds CTU (= Channel Transfer Unit) support which is needed
> to sound mixing.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  1 +
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> index bcaf4008d32d..82a269a4f10d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -412,6 +412,7 @@
>                  <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
>                  <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
>                  <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
> +                <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,

As the board-specific DTS file completely overrides the clocks list property,
this same change must be made to r8a7795-h3ulcb.dts.

>                  <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
>                  <&audio_clk_a>, <&cs2000>,
>                  <&audio_clk_c>,
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index 2c076c21d7fa..e09f5b7b874a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -919,6 +919,7 @@
>                                  <&cpg CPG_MOD 1026>, <&cpg CPG_MOD 1027>,
>                                  <&cpg CPG_MOD 1028>, <&cpg CPG_MOD 1029>,
>                                  <&cpg CPG_MOD 1030>, <&cpg CPG_MOD 1031>,
> +                                <&cpg CPG_MOD 1020>, <&cpg CPG_MOD 1021>,
>                                  <&cpg CPG_MOD 1019>, <&cpg CPG_MOD 1018>,
>                                  <&audio_clk_a>, <&audio_clk_b>,
>                                  <&audio_clk_c>,

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
