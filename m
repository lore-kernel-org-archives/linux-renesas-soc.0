Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:40667 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754719AbeASI3e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:29:34 -0500
Received: by mail-qt0-f178.google.com with SMTP id s39so2019157qth.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:29:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180117161717.14589-5-horms+renesas@verge.net.au>
References: <20180117161717.14589-1-horms+renesas@verge.net.au> <20180117161717.14589-5-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jan 2018 09:29:33 +0100
Message-ID: <CAMuHMdVUK0CGyYChqMOTtBHysEkUAiregu+pRwt_mFHEvgiJZQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] ARM: dts: r8a7790: sort subnodes of root node
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 17, 2018 at 5:17 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Sort subnodes of root node to aid maintenance.
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
