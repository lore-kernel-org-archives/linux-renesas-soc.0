Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:32900 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753180AbcIOS6B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 14:58:01 -0400
Received: by mail-io0-f196.google.com with SMTP id r145so69678ior.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Sep 2016 11:58:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160914164716.31512-4-ulrich.hecht+renesas@gmail.com>
References: <20160914164716.31512-1-ulrich.hecht+renesas@gmail.com> <20160914164716.31512-4-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 20:58:00 +0200
Message-ID: <CAMuHMdVywuHjQBwNqJQPHuMUOuDFzm-H6y8RSXQqYUGYPM--Zg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: renesas: r8a7796 dtsi: Add all HSCIF nodes
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 14, 2016 at 6:47 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Add the device nodes for all HSCIF serial ports, incl. clocks, and
> clock domain.
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
