Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:51620 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754013AbdKOOd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2017 09:33:26 -0500
Received: by mail-qt0-f195.google.com with SMTP id e19so29897797qte.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2017 06:33:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171110132532.1202-3-horms+renesas@verge.net.au>
References: <20171110132532.1202-1-horms+renesas@verge.net.au> <20171110132532.1202-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Nov 2017 15:33:24 +0100
Message-ID: <CAMuHMdXZQ1vpKVDqaZ8MOkaT2G264N2n+XV-x0KLWaQm+W5FWg@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] arm64: dts: renesas: r8a7795-es1: Add IPMMU
 device nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 10, 2017 at 2:25 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Add r8a7795 ES1.x IPMMU nodes and keep all disabled by default.
>
> This is a follow-up to a patch that adds IPMMU device nodes that
> are common to r8a7795 ES1.x and ES2.0
>
> Power domains are omitted as they appear to be undocumented.
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> v5 [Simon Horman]
> * Added reviewed-by tag from Geert Uytterhoeven

Nope, you didn't ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
