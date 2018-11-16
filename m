Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:5643 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728079AbeKQBMf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 20:12:35 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Guan Xuetao <gxt@pku.edu.cn>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>, linux-m68k@lists.linux-m68k.org,
        linux-mips@linux-mips.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/6] clk: Add functions to get optional clocks
Date: Fri, 16 Nov 2018 14:59:31 +0000
Message-Id: <20181116145937.27660-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quite a few drivers get an optional clock, e.g. a bus clock required to 
access peripheral's registers that is always enabled on some devices. This
series adds of_clk_get_by_name_optional(), clk_get_optional() and
devm_clk_get_optional() functions for this purpose.

The functions behave the same as of_clk_get_by_name(), clk_get() and
devm_clk_get() except that they will return NULL instead of -ENOENT. This
allows for simpler error handling in the callers.

*Note*
This changes the return values for of_clk_get_by_name() in some cases, see
[PATCH 1/6] clk: Add of_clk_get_by_name_optional() function.

v6:
 - Rework the __of_clk_get_by_name() logic so as to avoid duplicate tests.
 - Add doxygen style comment for devm_clk_get_optional() args
 - Add clk_get_optional() to archs that don't use the commom clk framework.

Phil Edworthy (6):
  clk: Add of_clk_get_by_name_optional() function
  clk: Add functions to get optional clocks
  m68k: coldfire: Add clk_get_optional() function
  MIPS: AR7: Add clk_get_optional() function
  MIPS: Loongson 2F: Add clk_get_optional() function
  arch/unicore32/kernel/clock.c: Add clk_get_optional() function

 arch/m68k/coldfire/clk.c               | 11 ++++
 arch/mips/ar7/clock.c                  | 11 ++++
 arch/mips/loongson64/lemote-2f/clock.c | 11 ++++
 arch/unicore32/kernel/clock.c          | 11 ++++
 drivers/clk/clk-devres.c               | 18 ++++-
 drivers/clk/clkdev.c                   | 91 ++++++++++++++++++++++----
 include/linux/clk.h                    | 38 +++++++++++
 7 files changed, 175 insertions(+), 16 deletions(-)

-- 
2.17.1
