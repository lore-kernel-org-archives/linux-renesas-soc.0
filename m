Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37146 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751497AbcKYLcy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 06:32:54 -0500
Received: by mail-wm0-f53.google.com with SMTP id t79so88604233wmt.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Nov 2016 03:32:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1480018514-31718-2-git-send-email-horms+renesas@verge.net.au>
References: <1480018514-31718-1-git-send-email-horms+renesas@verge.net.au> <1480018514-31718-2-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Nov 2016 09:58:40 +0100
Message-ID: <CAMuHMdVGXQMRU-tn2EtrSAZXMLhBMNkHsxOtvUJ9duxR_Tnsxg@mail.gmail.com>
Subject: Re: [PATCH renesas-next 1/3] ARM: dts: r8a73a4: Use SoC-specific
 compat string for mmcif
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 24, 2016 at 9:15 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use the SoC-specific compat string for mmcif in DT for the r8a73a4 SoC.
> This is in keeping with the use of compat strings for mmcif for other
> Renesas ARM based SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
