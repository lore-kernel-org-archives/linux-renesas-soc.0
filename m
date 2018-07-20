Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:41925 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbeGTL63 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 07:58:29 -0400
Received: by mail-ua0-f194.google.com with SMTP id t14-v6so7204054uao.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jul 2018 04:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <153199952510.10548.10726518369494565858.sendpatchset@little-apple>
In-Reply-To: <153199952510.10548.10726518369494565858.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jul 2018 13:10:32 +0200
Message-ID: <CAMuHMdUAFcdKgr7yfH3-pUjqSddV0JyR_brOs2iepN+Opa99hQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: Attach the SYS-DMAC to the IPMMU
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 19, 2018 at 1:23 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Hook up SYS-DMAC0, SYS-DMAC1 and SYS-DMAC2 to IPMMU-DS0 and IPMMU-DS1
> following the R-Car Gen3 Rev.1.00 (April 2018) datasheet.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
