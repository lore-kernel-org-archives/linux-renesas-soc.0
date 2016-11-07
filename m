Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:36895 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752250AbcKGLc7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 06:32:59 -0500
MIME-Version: 1.0
In-Reply-To: <1478480410-6320-1-git-send-email-cm-hiep@jinso.co.jp>
References: <1478480410-6320-1-git-send-email-cm-hiep@jinso.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Nov 2016 11:25:21 +0100
Message-ID: <CAMuHMdVMgsBO6ou4wYSp3pmBWDy_ZCoWaZFN+Zpq9dryRsSANw@mail.gmail.com>
Subject: Re: [PATCH] ARM: spi: rewrites the name of the function.
To: Cao Minh Hiep <cm-hiep@jinso.co.jp>
Cc: Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-spi <linux-spi@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Hiep,

On Mon, Nov 7, 2016 at 2:00 AM, Cao Minh Hiep <cm-hiep@jinso.co.jp> wrote:
> From: Hiep Cao Minh <cm-hiep@jinso.co.jp>
>
> This patch rewrites the name of rspi_pio_transfer_in_or_out
> function.
>
> Signed-off-by: Hiep Cao Minh <cm-hiep@jinso.co.jp>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

But you want to use proper prefixes matching the style of the subsystem,
to avoid Mark's canned message reply system.

Always use e.g. "git log --oneline drivers/spi/spi-rspi.c" to find out...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
