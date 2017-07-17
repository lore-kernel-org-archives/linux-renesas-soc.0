Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34242 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751276AbdGQIKP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 04:10:15 -0400
Received: by mail-it0-f68.google.com with SMTP id o202so17395312itc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2017 01:10:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1499777809-27492-4-git-send-email-horms+renesas@verge.net.au>
References: <1499777809-27492-1-git-send-email-horms+renesas@verge.net.au> <1499777809-27492-4-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 10:10:13 +0200
Message-ID: <CAMuHMdUcNzAf4bvnpXvaNDJoOieZV+gehhdNSviPQ6h3iOQ7eg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: r8a7794: Use R-Car Gen 2 fallback binding
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
> Use R-Car Gen 2 fallback binding for vind nodes in DT for r8a7794 SoC.
>
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7794 and the
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
