Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36588 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdBGKXE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Feb 2017 05:23:04 -0500
Received: by mail-io0-f194.google.com with SMTP id q20so12374812ioi.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Feb 2017 02:23:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161027102934.26426.94225.sendpatchset@little-apple>
References: <20161027102856.26426.48132.sendpatchset@little-apple> <20161027102934.26426.94225.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2017 11:22:57 +0100
Message-ID: <CAMuHMdWZeRTpRo=+KdN52f3yBYRu7NxXebVhEivBCW5rKcZvCg@mail.gmail.com>
Subject: Re: [PATCH 04/04] arm64: dts: r8a7795: Connect Ethernet AVB to IPMMU
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Joerg Roedel <joro@8bytes.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Thu, Oct 27, 2016 at 12:29 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add IPMMU-DS0 to the Ethernet-AVB device node.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi |    1 +
>  1 file changed, 1 insertion(+)
>
> --- 0006/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi       2016-10-27 18:08:09.590607110 +0900
> @@ -706,6 +706,7 @@
>                         phy-mode = "rgmii-id";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       iommus = <&ipmmu_ds0 16>;

For consistency, you may want to add this line just below the power-domains
property.

>                 };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
