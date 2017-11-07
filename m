Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:48105 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754491AbdKGKRk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:17:40 -0500
Received: by mail-qt0-f195.google.com with SMTP id z50so14530026qtj.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:17:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103504.7658-2-horms+renesas@verge.net.au>
References: <20171101103504.7658-1-horms+renesas@verge.net.au> <20171101103504.7658-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:17:39 +0100
Message-ID: <CAMuHMdXT=kMQXahCo0TC-BLyO8f_ONn-JPjnaqWjE4UhtXbn_g@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a77970: Add IPMMU device nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:35 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add r8a77970 IPMMU nodes and keep all disabled by default.
>
> Based on work for the r8a7796 by Magnus Damm
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

With the compatible value for ipmmu_ds1 fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

My comments for r8a7795.dtsi about IPMMU-* comments and power-domains
properties are applicable here, too.

> --- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi

[...]

> +               ipmmu_ds1: mmu@e7740000 {
> +                       compatible = "renesas,ipmmu-r8a7796";

"renesas,ipmmu-r8a77970"

> +                       reg = <0 0xe7740000 0 0x1000>; /* IPMMU-DS1 */
> +                       renesas,ipmmu-main = <&ipmmu_mm 1>;
> +                       #iommu-cells = <1>;
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
