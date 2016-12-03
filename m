Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33791 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750912AbcLCKbU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Dec 2016 05:31:20 -0500
Received: by mail-io0-f196.google.com with SMTP id j92so12843883ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 03 Dec 2016 02:30:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1480693434-9415-4-git-send-email-jacopo@jmondi.org>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org> <1480693434-9415-4-git-send-email-jacopo@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 3 Dec 2016 11:30:25 +0100
Message-ID: <CAMuHMdVyhNQjiJmS_Fr3TEBUz2H5dhySmeXesOFXokx+Wsn1=g@mail.gmail.com>
Subject: Re: [RFC 3/3] spidev: Add back "linux,spidev" as compatible
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Fri, Dec 2, 2016 at 4:43 PM, Jacopo Mondi <jacopo@jmondi.org> wrote:
> spidev is not meant to be configured directly from DTS anymore.
> Since we're prototyping, add the "linux,spidev" compatibility string
> back

I guess you needed this because you used "linux,spidev" in your DTS?
With "spidev", it should work out-of-the-box.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
