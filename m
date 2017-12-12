Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:40316 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750731AbdLLJue (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 04:50:34 -0500
Received: by mail-qt0-f196.google.com with SMTP id u42so45679072qte.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Dec 2017 01:50:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171212082436.12210-4-horms+renesas@verge.net.au>
References: <20171212082436.12210-1-horms+renesas@verge.net.au> <20171212082436.12210-4-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Dec 2017 10:50:33 +0100
Message-ID: <CAMuHMdW6hPCT0J0PHvXkJos51=0QjWijebWZZ5C_cgKzNS5=6Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a7796: add reg properties to
 pciec[01] nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 12, 2017 at 9:24 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add reg properties to pciec[01] placeholder nodes
>
> This is to stop the compiler complaining as follows:
> $ make
> ...
>   DTC     arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb
> arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
>   DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
>   DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
>   DTC     arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb
> arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
