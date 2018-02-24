Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:37250 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751364AbeBXR2W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 24 Feb 2018 12:28:22 -0500
Received: by mail-lf0-f65.google.com with SMTP id y19so16668648lfd.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2018 09:28:21 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH net-next] sh_eth: TSU_QTAG0/1 registers the same as
 TSU_QTAGM0/1
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <7b64c7c2-b51b-7526-e65e-3648f98fef5c@cogentembedded.com>
Date: Sat, 24 Feb 2018 20:28:16 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The TSU_QTAG0/1 registers found in the Gigabit Ether controllers actually
have the same long name  as the TSU_QTAGM0/1 registers in the early Ether
controllers:  Qtag Addition/Deletion Set Register (Port 0/1 to 1/0); thus
there's no need to make a difference in sh_eth_tsu_init() between those
controllers. Unfortunately, we can't just remove TSU_QTAG0/1 from the
register *enum* because that would break the ethtool register dump...

Fixes: b0ca2a21f769 ("sh_eth: Add support of SH7763 to sh_eth")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/net/ethernet/renesas/sh_eth.c |   15 ++++-----------
 drivers/net/ethernet/renesas/sh_eth.h |    4 ++--
 2 files changed, 6 insertions(+), 13 deletions(-)

Index: net-next/drivers/net/ethernet/renesas/sh_eth.c
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.c
+++ net-next/drivers/net/ethernet/renesas/sh_eth.c
@@ -123,8 +123,8 @@ static const u16 sh_eth_offset_gigabit[S
 	[TSU_FWSL0]	= 0x0030,
 	[TSU_FWSL1]	= 0x0034,
 	[TSU_FWSLC]	= 0x0038,
-	[TSU_QTAG0]	= 0x0040,
-	[TSU_QTAG1]	= 0x0044,
+	[TSU_QTAGM0]	= 0x0040,
+	[TSU_QTAGM1]	= 0x0044,
 	[TSU_FWSR]	= 0x0050,
 	[TSU_FWINMK]	= 0x0054,
 	[TSU_ADQT0]	= 0x0048,
@@ -2097,8 +2097,6 @@ static size_t __sh_eth_get_regs(struct n
 		add_tsu_reg(TSU_FWSL0);
 		add_tsu_reg(TSU_FWSL1);
 		add_tsu_reg(TSU_FWSLC);
-		add_tsu_reg(TSU_QTAG0);
-		add_tsu_reg(TSU_QTAG1);
 		add_tsu_reg(TSU_QTAGM0);
 		add_tsu_reg(TSU_QTAGM1);
 		add_tsu_reg(TSU_FWSR);
@@ -2934,13 +2932,8 @@ static void sh_eth_tsu_init(struct sh_et
 	sh_eth_tsu_write(mdp, 0, TSU_FWSL0);
 	sh_eth_tsu_write(mdp, 0, TSU_FWSL1);
 	sh_eth_tsu_write(mdp, TSU_FWSLC_POSTENU | TSU_FWSLC_POSTENL, TSU_FWSLC);
-	if (sh_eth_is_gether(mdp)) {
-		sh_eth_tsu_write(mdp, 0, TSU_QTAG0);	/* Disable QTAG(0->1) */
-		sh_eth_tsu_write(mdp, 0, TSU_QTAG1);	/* Disable QTAG(1->0) */
-	} else {
-		sh_eth_tsu_write(mdp, 0, TSU_QTAGM0);	/* Disable QTAG(0->1) */
-		sh_eth_tsu_write(mdp, 0, TSU_QTAGM1);	/* Disable QTAG(1->0) */
-	}
+	sh_eth_tsu_write(mdp, 0, TSU_QTAGM0);	/* Disable QTAG(0->1) */
+	sh_eth_tsu_write(mdp, 0, TSU_QTAGM1);	/* Disable QTAG(1->0) */
 	sh_eth_tsu_write(mdp, 0, TSU_FWSR);	/* all interrupt status clear */
 	sh_eth_tsu_write(mdp, 0, TSU_FWINMK);	/* Disable all interrupt */
 	sh_eth_tsu_write(mdp, 0, TSU_TEN);	/* Disable all CAM entry */
Index: net-next/drivers/net/ethernet/renesas/sh_eth.h
===================================================================
--- net-next.orig/drivers/net/ethernet/renesas/sh_eth.h
+++ net-next/drivers/net/ethernet/renesas/sh_eth.h
@@ -118,8 +118,8 @@ enum {
 	TSU_FWSL0,
 	TSU_FWSL1,
 	TSU_FWSLC,
-	TSU_QTAG0,
-	TSU_QTAG1,
+	TSU_QTAG0,			/* Same as TSU_QTAGM0 */
+	TSU_QTAG1,			/* Same as TSU_QTAGM1 */
 	TSU_QTAGM0,
 	TSU_QTAGM1,
 	TSU_FWSR,
