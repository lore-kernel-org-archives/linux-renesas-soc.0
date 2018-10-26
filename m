Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:49793 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbeJ0Ef4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 27 Oct 2018 00:35:56 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] MAINTAINERS: add maintainer for Renesas I2C driver
Date: Fri, 26 Oct 2018 14:57:10 -0500
Message-Id: <20181026195710.27690-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The RIIC I2C controller is used in Renesas RZ/A SoCs.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e20d9af09573..c261135cd00c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12599,6 +12599,11 @@ S:	Supported
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
 
+RENESAS RIIC DRIVER
+M:	Chris Brandt <chris.brandt@renesas.com>
+S:	Supported
+F:	drivers/i2c/busses/i2c-riic.c
+
 RENESAS USB PHY DRIVER
 M:	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.16.1
