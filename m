Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37412 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750729AbdHRIY3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 04:24:29 -0400
Received: by mail-pg0-f67.google.com with SMTP id 83so13937013pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2017 01:24:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1502961153.git.horms+renesas@verge.net.au>
References: <cover.1502961153.git.horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Aug 2017 10:24:27 +0200
Message-ID: <CAMuHMdX5kH6n0hxfdNMQai+a+rVhpyKppZ1U+vVR8COwBtjoOg@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM64 Based SoC DT Updates for v4.14
To: Simon Horman <horms+renesas@verge.net.au>
Cc: "arm@kernel.org" <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Aug 18, 2017 at 10:19 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> * Add PFC device node to R-Car D3 (r8a77995)
>
>   This is a step towards enabling devices that use multiplexed pins
>   - including ethernet - on boards that use the r8a7796 SoC.

Note that so far no device pinctrl configuration (incl. ethernet ;-) is done...

r8a77995

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
