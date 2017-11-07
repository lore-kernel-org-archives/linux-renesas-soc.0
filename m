Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:43811 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933790AbdKGKCB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:02:01 -0500
Received: by mail-lf0-f52.google.com with SMTP id a16so13783746lfk.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:02:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103458.7582-4-horms+renesas@verge.net.au>
References: <20171101103458.7582-1-horms+renesas@verge.net.au> <20171101103458.7582-4-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:01:59 +0100
Message-ID: <CAMuHMdU1JtdJS87DcSuhx5COAZiJp58=9G2zQaFwfp+howRA0A@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm64: dts: renesas: r8a7796: Tie Audio-DMAC to IPMMU-MP
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hook up r8a7796 Audio-DMAC nodes to the IPMMU-MP.
>
> Based on work for the r8a7795 by Magnus Damm.
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
