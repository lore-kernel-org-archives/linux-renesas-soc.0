Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:40271 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728425AbeKQBNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 20:13:45 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Guan Xuetao <gxt@pku.edu.cn>
Subject: [PATCH v6 6/6] arch/unicore32/kernel/clock.c: Add clk_get_optional() function
Date: Fri, 16 Nov 2018 14:59:37 +0000
Message-Id: <20181116145937.27660-7-phil.edworthy@renesas.com>
In-Reply-To: <20181116145937.27660-1-phil.edworthy@renesas.com>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
To: unlisted-recipients:; (no To-header on input)
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

clk_get_optional() returns NULL if not found instead of -ENOENT,
otherwise the behaviour is the same as clk_get().

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 arch/unicore32/kernel/clock.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/unicore32/kernel/clock.c b/arch/unicore32/kernel/clock.c
index b1ca775f6f6e..03def0b43192 100644
--- a/arch/unicore32/kernel/clock.c
+++ b/arch/unicore32/kernel/clock.c
@@ -74,6 +74,17 @@ struct clk *clk_get(struct device *dev, const char *id)
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
