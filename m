Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:37242 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752856AbeFTNZc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jun 2018 09:25:32 -0400
Received: by mail-ua0-f195.google.com with SMTP id c2-v6so139067uae.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jun 2018 06:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <152923212426.18394.1638836062311758848.sendpatchset@little-apple> <152923215125.18394.10152095394019866712.sendpatchset@little-apple>
In-Reply-To: <152923215125.18394.10152095394019866712.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jun 2018 15:25:20 +0200
Message-ID: <CAMuHMdVrRJYdVQOt7eJ7tjhOoiX9PvaMmfXCxoaQMHCJjan7Pw@mail.gmail.com>
Subject: Re: [PATCH v2 03/03] arm64: dts: renesas: r8a77990: Add IPMMU devices nodes
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Jun 17, 2018 at 12:41 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add IPMMU device nodes for the R-Car E3 SoC aka r8a77990.
>
> The r8a77990 IPMMU is similar to r8a77995. Power domains are
> however different and the public documentation is still unclear.
>
> Based on preliminary information from the hardware team the R-Car E3
> SoC comes with an IPMMU-VP0 device in an Always-on power domain and
> the IPMMU-VC0 is placed as expected in the A3VC power domain.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
