Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:44538 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751249AbeFHLxk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jun 2018 07:53:40 -0400
Received: by mail-vk0-f67.google.com with SMTP id x4-v6so8039994vkx.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Jun 2018 04:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20180608111655.2725-1-laurent.pinchart+renesas@ideasonboard.com> <20180608111655.2725-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180608111655.2725-2-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Jun 2018 13:53:28 +0200
Message-ID: <CAMuHMdXk3EbgYLo0Y8jZcugGq3ud7ZZ_4K_qwhi2W6sP84J4aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: Fix VSP registers range
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thanks for your patch!

On Fri, Jun 8, 2018 at 1:18 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R8A77995 VSP and FCP nodes have overlapping register ranges, as the
> SoC integrates the FCP devices in the memory range usually used by the
> VSP LUT and CLUT, which are not present. Fix this by shortening the VSP
> registers range to 0x5000.

According to datasheet rev. 1.00, the CLUT is present on R-Car D3, the
LUT is not.

> Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Apart from my comment above:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
