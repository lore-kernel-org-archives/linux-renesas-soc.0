Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:43832 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752079AbeAZKhg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jan 2018 05:37:36 -0500
Received: by mail-qt0-f195.google.com with SMTP id s3so116640qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2018 02:37:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180126093635.16945-4-horms+renesas@verge.net.au>
References: <20180126093635.16945-1-horms+renesas@verge.net.au> <20180126093635.16945-4-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jan 2018 11:37:35 +0100
Message-ID: <CAMuHMdWwu0WwGsLX_LGViV=SmpjT=YTg9Wyxp68WRQbCTtgcQA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: r8a7793: consistently use single space
 before =
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 26, 2018 at 10:36 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Consistently use a single space before a =.
>
> This patch fixes instances where a tab is used instead.
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
