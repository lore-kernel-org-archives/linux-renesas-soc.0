Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35963 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751257AbdGQIJ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 04:09:29 -0400
Received: by mail-io0-f195.google.com with SMTP id h134so6944622iof.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2017 01:09:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1499777809-27492-3-git-send-email-horms+renesas@verge.net.au>
References: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au> <1499777809-27492-3-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 10:09:28 +0200
Message-ID: <CAMuHMdVrjsU8=1UmK-SNG316sDDpMehwFu+zJFBDjMFUptjjYA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: r8a7791: Use R-Car Gen 2 fallback binding
 for vin nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 11, 2017 at 2:56 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use R-Car Gen 2 fallback binding for vind nodes in DT for r8a7791 SoC.
>
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7791 and the
> fallback binding for R-Car Gen 2
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
