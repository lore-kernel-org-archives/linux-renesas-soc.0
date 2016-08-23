Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:34922 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752999AbcHWMcy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Aug 2016 08:32:54 -0400
Received: by mail-it0-f68.google.com with SMTP id f6so7832266ith.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Aug 2016 05:32:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471938590-10650-5-git-send-email-horms+renesas@verge.net.au>
References: <1471938590-10650-1-git-send-email-horms+renesas@verge.net.au> <1471938590-10650-5-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Aug 2016 10:28:59 +0200
Message-ID: <CAMuHMdWWPwpUuCcT_PXRk69t6myCViauzp_LHcn+bi9pn8uuVw@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 4/8] gpio: rcar: Add r8a7796 (R-Car M3-W) support
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 23, 2016 at 9:49 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> R-Car Gen3's GPIO blocks are identical to Gen2's in every respect.
>
> Based on work for the r8a7795 (R-Car H3) by Ulrich Hecht.
>
> Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
