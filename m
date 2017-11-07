Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:43336 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933369AbdKGKFt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:05:49 -0500
Received: by mail-qk0-f179.google.com with SMTP id 78so7547763qkz.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:05:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103458.7582-6-horms+renesas@verge.net.au>
References: <20171101103458.7582-1-horms+renesas@verge.net.au> <20171101103458.7582-6-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:05:47 +0100
Message-ID: <CAMuHMdWEkwK=9YgYwKbH5y=9oy7+5dZ2Z3k-+jd0yJzgKshavg@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: renesas: r8a7796: Point VSPI via FCPVI to IPMMU-VC0
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
> Hook up the FCPVI devices to allow use of VSPI with IPMMU-VC0.
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
