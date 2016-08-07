Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:35351 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbcHGR71 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 7 Aug 2016 13:59:27 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFC 0/2] clk: renesas: r8a7795: improve z clock rate
Date: Mon,  8 Aug 2016 02:58:10 +0900
Message-Id: <1470592692-3486-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

These patches improve the calculated value of Z clock.

This series is based on the clk-next branch.

Dien Pham (2):
  clk: renesas: r8a7795: Improve the calculated value of Clock.
  clk: renesas: r8a7795: Do rounding for calculated frequency value

 drivers/clk/renesas/clk-rcar-gen2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
1.9.1
