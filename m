Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:43172 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752401AbeCTJIR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 05:08:17 -0400
Received: by mail-qk0-f195.google.com with SMTP id g184so809753qkd.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 02:08:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <152153403134.8610.16591493940845260718.sendpatchset@little-apple>
References: <152153402203.8610.10666108438721508284.sendpatchset@little-apple> <152153403134.8610.16591493940845260718.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Mar 2018 10:08:16 +0100
Message-ID: <CAMuHMdUAfWi+zgyBywkca5T_Txiw3bMUeCecKMigMN_F90eBxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: dts: r8a7778 Bock-W Ethernet has busted IRQs
To: Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus, Uli,

On Tue, Mar 20, 2018 at 9:20 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> The on-board ethernet on r8a7778 Bock-W does not work out of the
> box. Booting with initramfs and trying to do ifconfig up/down will
> show that something is busted.
>
> Judging by the board schematics the IRQ signal from the LAN89218
> chip gets routed to some magic board-specific FPGA and if the stars
> happen to be aligned this signal may also reach the r8a7778 SoC.
>
> This temporary hack tries to use the on-chip GPIO device in r8a7778 for
> interrupts however on r8a7778 all the GPIO devices share the same interrupt
> line in the GIC but I wonder if this really has been tested. I recall
> writing the GPIO driver on r8a7779 and r8a73a4 and then extending to
> R-Car Gen2 and Gen3. Not sure if it will work on r8a7778 or not.
>
> Most likely the PFC needs to be configured to configure the IRQ0 signal
> to use the irqpin driver, or the GPIO device may be used in a similar
> fashion as this patch.
>
> Unfortunately more effort is needed to track this down. A perhaps related
> issue on Bock-W is that it sometimes hangs on boot without output on
> the serial console. Yum.
>
> Not for upstream merge.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Is this the issue "[PATCH v3 0/5] r8a7778/bockw: fix SMSC Ethernet for MP"
(https://marc.info/?l=linux-sh&m=144172695421685&w=2) was meant to fix?

  irqchip: renesas-intc-irqpin: r8a7778 IRLM setup support
  ARM: shmobile: r8a7778: enable IRLM setup via DT
  ARM: shmobile: bockw dts: enable SMSC interrupt
  ARM: shmobile_defconfig: enable PINCTRL_SINGLE
  ARM: multi_v7_defconfig: enable PINCTRL_SINGLE

Seems like only the first patch in that series ever made it upstream.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
