Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:36342 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932765AbeFKLe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Jun 2018 07:34:29 -0400
Received: by mail-ua0-f194.google.com with SMTP id c23-v6so13279289uan.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Jun 2018 04:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180608122115.21138-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180608122115.21138-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Jun 2018 13:34:16 +0200
Message-ID: <CAMuHMdWO1rvi1G04hGPFEYBz=pXiK_amFwtseP-fHXMd1D+vVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Fix VSPD registers range
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Fri, Jun 8, 2018 at 2:22 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The VSPD and FCPVD nodes have overlapping register ranges, as the FCPVD
> devices are mapped in the memory range usually used by the VSP LUT and
> CLU, which are not present in the VSPD. Fix this by shortening the VSPD
> registers range to 0x5000.

Note that VSPBD (R-Car H3) and VSPBS (R-Car D3) also have no LUT or CLU,
so their register ranges could be shortened, too. But the're no (documented)
overlap with an FCP (or anything else).

> Fixes: 9f8573e38a0b ("arm64: dts: renesas: r8a7795: Add VSP instances")
> Fixes: 291e0c4994d0 ("arm64: dts: r8a7795: Add support for R-Car H3 ES2.0")
> Fixes: f06ffdfbdd90 ("arm64: dts: r8a7796: Add VSP instances")
> Fixes: b4f92030d5d3 ("arm64: dts: renesas: r8a77970: add VSPD support")
> Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
> Fixes: 85cb3229218a ("arm64: dts: renesas: r8a77965: Add VSP instances")
> Reported-by: Simon Horman <horms+renesas@verge.net.au>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
