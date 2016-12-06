Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:34157 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbcLFM61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Dec 2016 07:58:27 -0500
Received: by mail-io0-f195.google.com with SMTP id r94so6252262ioe.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Dec 2016 04:58:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161206123854.GA10942@verge.net.au>
References: <1480934381-32126-1-git-send-email-geert+renesas@glider.be> <20161206123854.GA10942@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Dec 2016 13:41:41 +0100
Message-ID: <CAMuHMdUTDqFz_5JuGHEC5ZF+j95puaPDJ+A8yVmu9dgNLGXhJQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: shmobile: R-Car Gen2: Allow booting secondary
 CPU cores in debug mode
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Tue, Dec 6, 2016 at 1:39 PM, Simon Horman <horms@verge.net.au> wrote:
> On Mon, Dec 05, 2016 at 11:39:36AM +0100, Geert Uytterhoeven wrote:
>> This patch series allows booting secondary CPU cores on R-Car Gen2 when
>> hardware debug mode is enabled. In this mode, reset requests derived

> Thanks, I have tentatively queued this up for v4.11.
>
> I have pulled in the rcar-rst dependency with the expectation ttha
> it will disappear when I rebase on v4.10-rc1 once it has been released.

Thank you very much!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
