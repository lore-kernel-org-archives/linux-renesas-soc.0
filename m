Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:23377 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728425AbeKQBNe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 20:13:34 -0500
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@linux-mips.org
Subject: [PATCH v6 5/6] MIPS: Loongson 2F: Add clk_get_optional() function
Date: Fri, 16 Nov 2018 14:59:36 +0000
Message-Id: <20181116145937.27660-6-phil.edworthy@renesas.com>
In-Reply-To: <20181116145937.27660-1-phil.edworthy@renesas.com>
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

clk_get_optional() returns NULL if not found instead of -ENOENT,
otherwise the behaviour is the same as clk_get().

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 arch/mips/loongson64/lemote-2f/clock.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/loongson64/lemote-2f/clock.c b/arch/mips/loongson64/lemote-2f/clock.c
index 8281334df9c8..abbade58b635 100644
--- a/arch/mips/loongson64/lemote-2f/clock.c
+++ b/arch/mips/loongson64/lemote-2f/clock.c
@@ -53,6 +53,17 @@ struct clk *clk_get(struct device *dev, const char *id)
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
 static void propagate_rate(struct clk *clk)
 {
 	struct clk *clkp;
-- 
2.17.1
