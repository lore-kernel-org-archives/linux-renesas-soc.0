Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:56852 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933863AbdKPIlY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 03:41:24 -0500
Received: by mail-qt0-f193.google.com with SMTP id r39so24438502qtr.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2017 00:41:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510759510-30295-2-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510759510-30295-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1510759510-30295-2-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Nov 2017 09:41:23 +0100
Message-ID: <CAMuHMdUWuoddZLyDF6AXcygHvcUEW5j4U7k-jood076aS1JWqw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: r8a77995: add SYS-DMAC nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 15, 2017 at 4:25 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Differs from other Gen3 SoCs in that each controller only supports eight
> channels.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
