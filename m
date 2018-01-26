Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:35793 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752185AbeAZKgZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Jan 2018 05:36:25 -0500
Received: by mail-qt0-f196.google.com with SMTP id g14so163705qti.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Jan 2018 02:36:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180126093635.16945-3-horms+renesas@verge.net.au>
References: <20180126093635.16945-1-horms+renesas@verge.net.au> <20180126093635.16945-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jan 2018 11:36:23 +0100
Message-ID: <CAMuHMdX=UBau32kA=injSSHNJh=MWgXxWvA3-RpnpeeaYq1B3A@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: r8a7791: consistently use single space
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
