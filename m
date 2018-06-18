Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:41917 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754876AbeFRHNX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jun 2018 03:13:23 -0400
Received: by mail-ua0-f196.google.com with SMTP id a5-v6so10018202uao.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Jun 2018 00:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <152923285268.19253.8187284565521042664.sendpatchset@little-apple>
In-Reply-To: <152923285268.19253.8187284565521042664.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Jun 2018 09:13:11 +0200
Message-ID: <CAMuHMdWdUXcjKZeS65u1VAJ3jtkO4y7TRreZTdsvFjGsn29wug@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: IPMMU deferred probe test prototype
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Sun, Jun 17, 2018 at 12:52 PM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Here's my local modification to test IPMMU with SYS-DMAC and the SCIF
> console on r8a7795 H3ULCB. The dmac1 and dmac2 devices together with
> audio dmacs are added to the IPMMU white list. The dmac0 device is
> disabled in DT to easily be able to associate the /proc/interrupt
> counters with the console activity.
>
> A quick test has been performed by checking the console boot log output
> (no errors and DMACs are assigned to the IPMMU) and also validating that
> SCIF console activity results in incrementing /proc/interrupts counters
> associated with the DMAC channels. Audio has not been tested.
>
> Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

Just wondering from the oneline-summary: where is the deferred probe (not)
supposed to happen?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
