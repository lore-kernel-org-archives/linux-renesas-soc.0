Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36634 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbdEBKVE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 06:21:04 -0400
MIME-Version: 1.0
In-Reply-To: <20170501090346.10801-4-wsa+renesas@sang-engineering.com>
References: <20170501090346.10801-1-wsa+renesas@sang-engineering.com> <20170501090346.10801-4-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 May 2017 12:21:02 +0200
Message-ID: <CAMuHMdVsd_ebqCV02Ri9NkU5Vrvb4N89bn+5KFL+rWHEcxPQnA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] mmc: tmio: remove outdated comment
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 1, 2017 at 11:03 AM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The obviously wrong comment was added in 2011 with commit df3ef2d3c92c0a
> ("mmc: protect the tmio_mmc driver against a theoretical race") but
> already obsoleted half a year later with commit b9269fdd4f61aa ("mmc:
> tmio: fix recursive spinlock, don't schedule with interrupts disabled").

Fixes: b9269fdd4f61aa ("mmc: tmio: fix recursive spinlock, don't
schedule with interrupts disabled")

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
