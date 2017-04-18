Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:34410 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753042AbdDRRZa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 13:25:30 -0400
Received: by mail-io0-f172.google.com with SMTP id a103so4972013ioj.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2017 10:25:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1491899997-32210-9-git-send-email-mark.rutland@arm.com>
References: <1491899997-32210-1-git-send-email-mark.rutland@arm.com> <1491899997-32210-9-git-send-email-mark.rutland@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Apr 2017 19:25:28 +0200
Message-ID: <CAMuHMdVV4qMyYTYN92TE4fsrxo66WK-Gd001YbJZok2txOH4ig@mail.gmail.com>
Subject: Re: [PATCHv3 08/14] drivers/perf: arm_pmu: split cpu-local irq request/free
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

On Tue, Apr 11, 2017 at 10:39 AM, Mark Rutland <mark.rutland@arm.com> wrote:
> Currently we have functions to request/free all IRQs for a given PMU.
> While this works today, this won't work for ACPI, where we don't know
> the full set of IRQs up front, and need to request them separately.
>
> To enable supporting ACPI, this patch splits out the cpu-local
> request/free into new functions, allowing us to request/free individual
> IRQs.
>
> As this makes it possible/necessary to request a PPI once per cpu, an
> additional check is added to detect mismatched PPIs. This shouldn't
> matter for the DT / platform case, as we check this when parsing.
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Will Deacon <will.deacon@arm.com>

This patch causes warnings during PSCI system suspend on R-Car Gen3.

On R-Car M3-W (Dual CA57):

    Disabling non-boot CPUs ...
   +IRQ15 no longer affine to CPU1
    CPU1: shutdown
    psci: CPU1 killed.

On R-Car H3 (Quad CA57):

    Disabling non-boot CPUs ...
   +IRQ15 no longer affine to CPU1
    CPU1: shutdown
    psci: CPU1 killed.
   +IRQ16 no longer affine to CPU2
    CPU2: shutdown
    psci: CPU2 killed.
   +IRQ17 no longer affine to CPU3
    CPU3: shutdown
    psci: CPU3 killed.

Unfortunately it can't be reverted easily.

Do you have any clue?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
