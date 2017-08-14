Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35611 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751569AbdHNNxy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 09:53:54 -0400
Received: by mail-pg0-f67.google.com with SMTP id l64so10818073pge.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2017 06:53:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502181568-12299-10-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au> <1502181568-12299-10-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 15:53:53 +0200
Message-ID: <CAMuHMdUFJaaj_vNnv=0TakXQnV2=fw-ofGB5Zj8sVw9+ukWRnQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] arm64: dts: r8a7795: Use R-Car GPIO Gen3 fallback
 compat string
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 8, 2017 at 10:39 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use newly added R-Car GPIO Gen3 fallback compat string
> in place of now deprecated non-generation specific
> R-Car GPIO fallback compat string in the DT of the r8a7795 SoC.
>
> This should have no run-time effect as the driver matches against
> the per-SoC compat string before considering the fallback compat string.
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
