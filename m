Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:35054 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750794AbcIOSdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 14:33:40 -0400
Received: by mail-it0-f68.google.com with SMTP id e20so5243604itc.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2016 11:33:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914164648.31403-3-ulrich.hecht+renesas@gmail.com>
References: <20160914164648.31403-1-ulrich.hecht+renesas@gmail.com> <20160914164648.31403-3-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 20:33:38 +0200
Message-ID: <CAMuHMdU4+Q8QZeHs8DqXDZABHwVOvW=rdjFkLBO=0DyEr39vpw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: renesas: r8a7796: Add all SCIF nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 14, 2016 at 6:46 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Add the device nodes for all R-Car H3 SCIF serial ports, incl. clocks
> and clock domain.
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
