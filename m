Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:45971 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933684AbdKGKGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Nov 2017 05:06:10 -0500
Received: by mail-qt0-f194.google.com with SMTP id p1so14503459qtg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Nov 2017 02:06:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171101103458.7582-7-horms+renesas@verge.net.au>
References: <20171101103458.7582-1-horms+renesas@verge.net.au> <20171101103458.7582-7-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Nov 2017 11:06:09 +0100
Message-ID: <CAMuHMdU+jqPUKynofovSZionWCaj0RD9GkoJsX24Lp-zbAre_g@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a7796: Connect Ethernet-AVB to IPMMU-DS0
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 1, 2017 at 11:34 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Add IPMMU-DS0 to the Ethernet-AVB device node.
>
> Based on work by Magnus Damm for the r8a7795.
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
