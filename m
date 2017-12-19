Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:36324 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759093AbdLSIj5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 03:39:57 -0500
Received: by mail-qk0-f172.google.com with SMTP id 8so21570391qkj.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Dec 2017 00:39:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171218213233.3373-3-horms+renesas@verge.net.au>
References: <20171218213233.3373-1-horms+renesas@verge.net.au> <20171218213233.3373-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Dec 2017 09:39:56 +0100
Message-ID: <CAMuHMdXRCvw3mMd4uWapin70_3h4F964qbD-xMkfF2MxgLafdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7792: move timer node out of bus
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 18, 2017 at 10:32 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> The timer node does not have any register properties and thus shouldn't be
> placed on the bus.
>
> This problem is flagged by the compiler as follows:
> $ make dtbs W=1
> ...
>   DTC     arch/arm/boot/dts/r8a7792-wheat.dtb
> arch/arm/boot/dts/r8a7792-blanche.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> arch/arm/boot/dts/r8a7792-wheat.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
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
