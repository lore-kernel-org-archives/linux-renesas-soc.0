Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbeK2Fg2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 00:36:28 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181123085635.31067-1-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181123085635.31067-1-geert+renesas@glider.be>
Message-ID: <154343003340.88331.9888843680619389201@swboyd.mtv.corp.google.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.21
Date: Wed, 28 Nov 2018 10:33:53 -0800
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-11-23 00:56:35)
>         Hi Mike, Stephen,
> =

> The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d=
2a:
> =

>   Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)
> =

> are available in the Git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v4.21-tag1
> =

> for you to fetch changes up to eb38c119dd91c61de26f67050671a84064554f7d:
> =

>   clk: renesas: r7s9210: Add USB clocks (2018-11-13 09:58:51 +0100)
> =

> ----------------------------------------------------------------
> clk: renesas: Updates for v4.21
> =

>   - Add support for SDHI and USB clocks on RZ/A2,
>   - Add support for RPC (SPI Multi I/O Bus Controller) clocks on R-Car
>     V3M.
> =

> Thanks for pulling!
> =


Thanks. Pulled into clk-next. Plus I threw a sparse warning fix into the
pile.
