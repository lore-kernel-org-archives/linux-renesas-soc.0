Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:29082 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751115AbcFSCeW (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 18 Jun 2016 22:34:22 -0400
Received: from relmlac3.idc.renesas.com (relmlac3.idc.renesas.com [10.200.69.23])
	by relmlir2.idc.renesas.com (Postfix) with ESMTP id 84BA442DDB
	for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Jun 2016 11:34:19 +0900 (JST)
Received: from relmlac3.idc.renesas.com (localhost [127.0.0.1])
	by relmlac3.idc.renesas.com (Postfix) with ESMTP id 6C1431800A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Jun 2016 11:34:19 +0900 (JST)
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
To: geert+renesas@glider.be
CC: "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
	"Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>,
	Toru Oishi <toru.oishi.zj@rvc.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] clk: renesas: r8a7795: Add THS/TSC clock
Message-ID: <576604AA.8020508@rvc.renesas.com>
Date: Sun, 19 Jun 2016 09:34:18 +0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index ad01b0b..371a795 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -143,6 +143,7 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("hscif2",		 518,	R8A7795_CLK_S3D1),
 	DEF_MOD("hscif1",		 519,	R8A7795_CLK_S3D1),
 	DEF_MOD("hscif0",		 520,	R8A7795_CLK_S3D1),
+	DEF_MOD("thermal",		 522,	R8A7795_CLK_CP),
 	DEF_MOD("pwm",			 523,	R8A7795_CLK_S3D4),
 	DEF_MOD("fcpvd3",		 600,	R8A7795_CLK_S2D1),
 	DEF_MOD("fcpvd2",		 601,	R8A7795_CLK_S2D1),
-- 
1.9.1
