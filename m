Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36772 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755634AbcHYIUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2016 04:20:03 -0400
MIME-Version: 1.0
In-Reply-To: <20160824093438.2478-1-wsa+renesas@sang-engineering.com>
References: <20160824093438.2478-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Aug 2016 10:20:02 +0200
Message-ID: <CAMuHMdVOWnr6c2tnEi1j1WAZKYuW-m1R0-OqiZpktJ4fJRJkDA@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: sh_mobile_sdhi: use SDR & card_busy only on Gen2+
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Aug 24, 2016 at 11:34 AM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This series hopefully fixes a performance regression for r8a73a4 (pre Gen2)
> caused by a not working card_busy. Because we don't have documentation for its
> SDHI (and I don't have the hardware), just enable card_busy and SDR only for
> machines known to have hardware support for it.

Thanks, ape6evm is much more rensponsive with your 2 patches applied.

> Geert, can you test, please?

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
