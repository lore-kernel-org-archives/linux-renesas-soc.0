Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:37405 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbeJJUBb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 16:01:31 -0400
Received: by mail-vs1-f67.google.com with SMTP id r83so4852039vsc.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Oct 2018 05:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <1539070730-20349-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1539070730-20349-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 14:39:18 +0200
Message-ID: <CAMuHMdUhEt87dggNbZHjsDu0ZVjOSxbaZBDbA4nND+e_3o40tQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add DMA properties to
 MSIOF nodes
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 9, 2018 at 9:39 AM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> This patch adds DMA properties to the MSIOF device nodes of R8A77990 SoC.
>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
on Ebisu using a 25LC040 EEPROM
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tree/arch/arm64/boot/dts/renesas/r8a77990-ebisu-cn41-msiof0-25lc040.dtso?h=topic/renesas-overlays

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
