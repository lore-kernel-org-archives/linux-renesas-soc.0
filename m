Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:41905 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751548AbeASING (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:13:06 -0500
Received: by mail-qt0-f194.google.com with SMTP id i1so1935132qtj.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:13:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180117161717.14589-2-horms+renesas@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au> <20180117161717.14589-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 09:13:05 +0100
Message-ID: <CAMuHMdVFxpBEm6JqrK+GsevWxqT1PGqr7-9NdKWsM=yx=G=9NA@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] ARM: dts: r8a7790: consistently use single space
 after =
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 17, 2018 at 5:17 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Consistently use a single space after a =.
>
> This patch removes instances where a tab or multiple spaces are used
> instead.  It also avoids running over 80 columns in width in one of the
> lines where whitespace is updated.
>
> This patch should not introduce any functional change.
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
