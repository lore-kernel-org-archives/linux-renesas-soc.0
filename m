Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:34288 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbeHFRZX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 13:25:23 -0400
Received: by mail-ua0-f193.google.com with SMTP id r15-v6so4035992uao.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Aug 2018 08:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180804231114.21420-1-erosca@de.adit-jv.com> <20180804231114.21420-13-erosca@de.adit-jv.com>
In-Reply-To: <20180804231114.21420-13-erosca@de.adit-jv.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 17:15:37 +0200
Message-ID: <CAMuHMdV4g0uUKWSt-+iFfaPY-JywrOrRPK6MkEQe2B5AGMykOQ@mail.gmail.com>
Subject: Re: [PATCH 12/14] arm64: dts: renesas: r8a77965: add CAN support
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eugeniu,

On Sun, Aug 5, 2018 at 1:14 AM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> According to R-Car Gen3 HW manual rev0.55E, R-Car M3-N has two CAN
> interfaces, similar to H3, M3-W and other SoCs from the same family.
>
> Add CAN nodes to avoid below r8a77965-ulcb-kf.dtb build failure:
> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:19.1-6 Label or path can0 not found
> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:25.1-6 Label or path can1 not found
>
> CAN support is inspired from below commits:
>  - v4.7 commit 308b7e4ba62e ("arm64: dts: r8a7795: Add CAN support")
>  - v4.11 commit 909c16252415 ("arm64: dts: r8a7796: Add CAN support")
>  - v4.12 commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

Thanks for your patch!

Have you actually tested CAN operation, or were you just fixing the
build failure?
In case of the latter, please just add minimal placeholders, like were present
for other device nodes in early versions of r8a77965.dtsi.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
