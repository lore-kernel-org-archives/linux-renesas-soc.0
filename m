Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:43343 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751824AbeCMQO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 12:14:27 -0400
Received: by mail-qt0-f173.google.com with SMTP id s48so154718qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Mar 2018 09:14:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1520954300-15884-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1520954300-15884-1-git-send-email-jacopo+renesas@jmondi.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Mar 2018 17:14:26 +0100
Message-ID: <CAMuHMdWxnKZtaAEP66qP8m5xc_XhuBhBkq7CVaeRWV8CGjfToQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: r8a77965: Replace DU2 clock
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tue, Mar 13, 2018 at 4:18 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> R-Car M3-N does not have DU2 unit but DU3 instead. Fix the module clocks
> definition to reflect that.
>
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thank you!

Fixes: 7ce36da900c0a2ff ("clk: renesas: cpg-mssr: Add support for R-Car M3-N")

Queued in clk-renesas-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
