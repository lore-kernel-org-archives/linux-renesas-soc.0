Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:60899 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389903AbeKQBNX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 20:13:23 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-mips@linux-mips.org
Subject: [PATCH v6 4/6] MIPS: AR7: Add clk_get_optional() function
Date: Fri, 16 Nov 2018 14:59:35 +0000
Message-Id: <20181116145937.27660-5-phil.edworthy@renesas.com>
In-Reply-To: <20181116145937.27660-1-phil.edworthy@renesas.com>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

clk_get_optional() returns NULL if not found instead of -ENOENT,
otherwise the behaviour is the same as clk_get().

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 arch/mips/ar7/clock.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/ar7/clock.c b/arch/mips/ar7/clock.c
index 6b64fd96dba8..b13f763948b1 100644
--- a/arch/mips/ar7/clock.c
+++ b/arch/mips/ar7/clock.c
@@ -454,6 +454,17 @@ struct clk *clk_get(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL(clk_get);
 
+struct clk *clk_get_optional(struct device *dev, const char *id)
+{
+	struct clk *clk = clk_get(dev, id);
+
+	if (clk == ERR_PTR(-ENOENT))
+		clk = NULL;
+
+	return clk;
+}
+EXPORT_SYMBOL(clk_get_optional);
+
 void clk_put(struct clk *clk)
 {
 }
-- 
2.17.1
