Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35547 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755231AbcLTKma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 05:42:30 -0500
Received: by mail-it0-f67.google.com with SMTP id b123so13479377itb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Dec 2016 02:42:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1482229959-25584-2-git-send-email-horms+renesas@verge.net.au>
References: <1482229959-25584-1-git-send-email-horms+renesas@verge.net.au> <1482229959-25584-2-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Dec 2016 11:42:29 +0100
Message-ID: <CAMuHMdXpN9x5YH0tiSRxme0yySS1NpaF41_DaePzuWd+3QD=AQ@mail.gmail.com>
Subject: Re: [PATCH renesas/devel 1/4] arm64: dts: r8a7796: Use R-Car Gen 3
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
> Use recently added R-Car Gen 3 fallback binding for msiof nodes in
> DT for r8a7796 SoC.
>
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7796 and the
> fallback binding for R-Car Gen 3.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
