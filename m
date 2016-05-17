Return-Path: <kieranbingham@gmail.com>
From: Kieran Bingham <kieran@bingham.xyz>
To: linux-renesas-soc@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com,
	Kieran Bingham <kieran@bingham.xyz>
Subject: [PATCH] Provide r8a7795 FDP1 clocks
Date: Tue, 17 May 2016 11:03:30 +0100
Message-Id: <1463479411-10817-1-git-send-email-kieran@bingham.xyz>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi All,

I've now got the FDP1 powered up and reading registers, and the cpg-mssr
is updated to support this. However, we did not have a mapping to identify
the correct clock parent. For now I have used the R8A7795_CLK_S2D1, but
does anyone have a clock tree diagram to verify this, or identify the
correct parent please?

Kieran Bingham (1):
  clk: renesas: Provide r8a7795 FDP1 clocks

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.5.0
