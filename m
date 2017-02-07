Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35758 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdBGKYB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Feb 2017 05:24:01 -0500
Received: by mail-io0-f196.google.com with SMTP id m98so12378170iod.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Feb 2017 02:24:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <148211399048.8020.7153630286323992170.sendpatchset@little-apple>
References: <148211397261.8020.4659661835061990009.sendpatchset@little-apple> <148211399048.8020.7153630286323992170.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2017 11:23:59 +0100
Message-ID: <CAMuHMdWAu+TgbPTSAyVSSA2UfJ_aX72dSnF6aiJmbxyxy-TJ1w@mail.gmail.com>
Subject: Re: [PATCH v2 02/02] arm64: dts: r8a7795: Hook up SYS-DMAC to IPMMU
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

On Mon, Dec 19, 2016 at 3:19 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Hook up r8a7795 DMAC nodes to IPMMU-MP1, IPMMU-DS0 and IPMMU-DS1.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
>
>  Changes from V1:
>  - None
>
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi |   40 ++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> --- 0002/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a7795.dtsi       2016-12-19 11:03:23.310607110 +0900
> @@ -368,6 +368,14 @@
>                         power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
>                         #dma-cells = <1>;
>                         dma-channels = <16>;
> +                       iommus = <&ipmmu_mp1 0>, <&ipmmu_mp1 1>,
> +                              <&ipmmu_mp1 2>, <&ipmmu_mp1 3>,
> +                              <&ipmmu_mp1 4>, <&ipmmu_mp1 5>,
> +                              <&ipmmu_mp1 6>, <&ipmmu_mp1 7>,
> +                              <&ipmmu_mp1 8>, <&ipmmu_mp1 9>,
> +                              <&ipmmu_mp1 10>, <&ipmmu_mp1 11>,
> +                              <&ipmmu_mp1 12>, <&ipmmu_mp1 13>,
> +                              <&ipmmu_mp1 14>, <&ipmmu_mp1 15>;

For consistency, you may want to add these line just below the power-domains
property (everywhere).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
