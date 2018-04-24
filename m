Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:40705 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754147AbeDXJcK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:32:10 -0400
Received: by mail-ua0-f193.google.com with SMTP id c9so12120570uaf.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 02:32:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180424092659.23657-1-horms+renesas@verge.net.au>
References: <20180424092659.23657-1-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 11:32:08 +0200
Message-ID: <CAMuHMdXyfdt586hzMmL6LP8AOXFuDbtFs1u_vAf-oRj-+MeHog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795-es1: Enable IPMMU devices
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 24, 2018 at 11:26 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Remove 'status = "disabled"' to make sure all IPMMU devices are enabled
> in DT on the r8a7795 ES1.0 Soc.
>
> This is a follow up for a patch by Magnus Damm for the
> the r8a7795 ES2.0 and other R-Car Gen 3 SoCs.
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
