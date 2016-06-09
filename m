Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
From: Kieran Bingham <kieran@bingham.xyz>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCHv2] clk: renesas: r8a7795: Provide FDP1 clocks
Date: Thu,  9 Jun 2016 17:12:25 +0100
Message-Id: <1465488747-26892-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Now that the  clock parents have been confirmed, and the clock names adjusted
the FDP1 clocks can be added to the cpg-mssr

Kieran Bingham (1):
  clk: renesas: r8a7795: Provide FDP1 clocks

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.7.4
