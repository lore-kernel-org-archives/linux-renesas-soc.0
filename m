Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbeJBEeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Oct 2018 00:34:06 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180928084139.20016-1-geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20180928084139.20016-1-geert+renesas@glider.be>
Message-ID: <153843085275.119890.13438984066136473491@swboyd.mtv.corp.google.com>
Subject: Re: [git pull] clk: renesas: Updates for v4.20 (take two)
Date: Mon, 01 Oct 2018 14:54:12 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-09-28 01:41:39)
>         Hi Mike, Stephen,
> =

> The following changes since commit b30c862f2a72002c06df23d05c2ca6b49148c4=
d4:
> =

>   clk: renesas: r8a77990: Add missing I2C7 clock (2018-08-31 10:33:59 +02=
00)
> =

> are available in the Git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v4.20-tag2
> =

> for you to fetch changes up to a53a28dca4124048c90b4a8de457668ede57e67c:
> =

>   clk: renesas: r7s9210: Add SPI clocks (2018-09-28 09:57:09 +0200)
> =

> ----------------------------------------------------------------
> clk: renesas: Updates for v4.20 (take two)
> =

>   - Add support for CMT timer clocks on R-Car V3H,
>   - Add support for SHDI and various timer clocks on R-Car V3M,
>   - Add support for the new RZ/A2 (R7S9210) SoC, including early clock
>     support for the Renesas CPG/MSSR driver,
>   - Add support for the new RZ/G1N (R8A7744) and RZ/G2E (R8A774C0) SoCs,
>   - Convert DT binding includes to SPDX license identifiers,
>   - Small fixes and clean ups.
> =


Thanks. Pulled into clk-next.
