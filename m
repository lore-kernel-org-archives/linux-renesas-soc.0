Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:49122 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756654AbdKGJLV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 04:11:21 -0500
Received: by mail-qt0-f194.google.com with SMTP id f8so14335791qta.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 01:11:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103452.7491-3-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au> <20171101103452.7491-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 10:11:20 +0100
Message-ID: <CAMuHMdUgW=KNLAg-hEoOPCF0-q=iP+j_PLFb4Qfxt+HSobZgnA@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] arm64: dts: renesas: r8a7795-es1: Add IPMMU
 device nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add r8a7795 ES1.x IPMMU nodes and keep all disabled by default.
>
> This is a follow-up to a patch that adds IPMMU device nodes that
> are common to r8a7795 ES1.x and ES2.0
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
> @@ -26,6 +26,22 @@
>         /delete-node/ mmu@fd960000;
>         /delete-node/ mmu@fd970000;
>
> +       ipmmu_mp1: mmu@ec680000 {
> +               compatible = "renesas,ipmmu-r8a7795";
> +               reg = <0 0xec680000 0 0x1000>; /* IPMMU-MP1 */

Do we need the comments?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
