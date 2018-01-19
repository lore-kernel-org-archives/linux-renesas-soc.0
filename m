Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f170.google.com ([209.85.216.170]:34643 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754070AbeASIzg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:55:36 -0500
Received: by mail-qt0-f170.google.com with SMTP id 33so2165509qtv.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:55:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180117161717.14589-12-horms+renesas@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au> <20180117161717.14589-12-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 09:55:35 +0100
Message-ID: <CAMuHMdWGS6g-vwFvxUs5sJLMOkg9S6tB-zZSP6Xv69TpKEwqyQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] ARM: dts: r8a7793: sort subnodes of soc node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 17, 2018 at 5:17 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Sort the subnodes of the soc node to improve maintainability.
> The sort key is the address on the bus with instances of the same
> IP block grouped together.
>
> This patch should not introduce any functional change.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Same comment for SCIF variant sort order.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
