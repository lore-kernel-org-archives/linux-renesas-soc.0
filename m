Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:42258 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753003AbeDWH4H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 03:56:07 -0400
Received: by mail-ua0-f194.google.com with SMTP id f3so4036711uan.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Apr 2018 00:56:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Apr 2018 09:56:06 +0200
Message-ID: <CAMuHMdU3eye_jaYA1nb72swAhwZoYSYw3WQ0fpXVOUZumO1Qjw@mail.gmail.com>
Subject: Re: [PATCH 00/04] arm64: dts: renesas: Enable IPMMU devices
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Sun, Apr 22, 2018 at 12:08 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> arm64: dts: renesas: Enable IPMMU devices
>
> [PATCH 01/04] arm64: dts: renesas: r8a7795: Enable IPMMU devices
> [PATCH 02/04] arm64: dts: renesas: r8a7796: Enable IPMMU devices
> [PATCH 03/04] arm64: dts: renesas: r8a77970: Enable IPMMU devices
> [PATCH 04/04] arm64: dts: renesas: r8a77995: Enable IPMMU devices
>
> Following the policy of using DT to describe the hardware and not software
> support state, ...

Good policy! So "[PATCH 0/2] arm64: dts: renesas: r8a77970: Add SMP Support"
can be applied, too?

> ... this series makes sure all IPMMU devices are enabled in DT
> for SoCs such as r8a7795, r8a7796, r8a77970 and r8a77995.

BTW, do you plan to fix arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
