Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:38346 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750749AbeDXOvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 10:51:52 -0400
Received: by mail-ua0-f194.google.com with SMTP id q38so12754262uad.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 07:51:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180423104635.18129-1-horms+renesas@verge.net.au>
References: <20180423104635.18129-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 16:51:50 +0200
Message-ID: <CAMuHMdXMZ3bb6qFSeQhb5tmqHXwJQt8Pni4=aHYtYTRDXGZgHQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: renesas_defconfig: enable R8A77980 SoC
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 23, 2018 at 12:46 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Enable the Renesas R-Car V3H (R8A77980) SoC in the ARM64 renesas_defconfig.

"E3 (R8A77990)", also in the one-line summary.

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
