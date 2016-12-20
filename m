Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35338 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752909AbcLTKn7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 05:43:59 -0500
Received: by mail-io0-f196.google.com with SMTP id f73so21956039ioe.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Dec 2016 02:43:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1482229959-25584-3-git-send-email-horms+renesas@verge.net.au>
References: <1482229959-25584-1-git-send-email-horms+renesas@verge.net.au> <1482229959-25584-3-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Dec 2016 11:43:58 +0100
Message-ID: <CAMuHMdXK_AQD4L2mVV7cYzFWV7+BKtcMmXr6FXTZhF6YPdOi9w@mail.gmail.com>
Subject: Re: [PATCH renesas/devel 2/4] ARM: dts: r8a7791: Use R-Car Gen 2
 fallback binding for msiof nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 20, 2016 at 11:32 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use recently added R-Car Gen 2 fallback binding for msiof nodes in
> DT for r8a7791 SoC.
>
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7791 and the
> fallback binding for R-Car Gen 2.
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
