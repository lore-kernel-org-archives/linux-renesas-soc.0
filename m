Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:36545 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751774AbcLLNhQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 08:37:16 -0500
Received: by mail-io0-f196.google.com with SMTP id b194so21480000ioa.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2016 05:37:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481533902-14789-9-git-send-email-horms+renesas@verge.net.au>
References: <1481533902-14789-1-git-send-email-horms+renesas@verge.net.au> <1481533902-14789-9-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Dec 2016 14:37:15 +0100
Message-ID: <CAMuHMdU-Z_Bn46BQ1Qv+tHyzqMEFj87GvRWmpk-c5Non6L7A2w@mail.gmail.com>
Subject: Re: [PATCH renesas/devel 08/13] arm64: dts: r8a7795: Use R-Car Gen 3
 fallback binding for i2c nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 12, 2016 at 10:11 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use recently added R-Car Gen 3 fallback binding for i2c nodes in
> DT for r8a7795 SoC.
>
> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7795 and the
> fallback binding for R-Car Gen 3.
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
