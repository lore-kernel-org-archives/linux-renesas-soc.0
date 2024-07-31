Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC64450E2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722413338; cv=none; b=I+Jdf3e8G/znvc1JIkNle30B+9YbW7mTPI5mKUzxma6ndFiObUAjcf1h/dRSXPcO9iaIMuy4hcGFD6gGmXOfYrwEqg0JAOwcKoQ3kLwUyNXBOjKzq02b68vGe36utpi5UaP30VWQ5eDVLveL3hPZh+C9nL0vHmFVYLLodwG7fKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722413338; c=relaxed/simple;
	bh=ZLmc1I/4nmA/pdv74JsJLf7oTQpxDGaWhd5UBMIOhyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEtw64uE8VBvJ6nhd+Wrg66u9q64ICGV1x64gUL/f7k2Zs0BoqHJu/ylHY0OU2DukBjjYyq1goR/QKRXucATnLKawDIySvSgZTX4QcnTNrjz9DxjqshMJ6aAp6kc9ll/WkrA8U4aq2UdX6ezGs2Dc7SRmN9TtPKBIn1l0rhjTQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,250,1716217200"; 
   d="scan'208";a="214210295"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Jul 2024 17:08:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.39])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B6E4041BF42C;
	Wed, 31 Jul 2024 17:08:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
Date: Wed, 31 Jul 2024 09:08:40 +0100
Message-ID: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rpc-if-hyperflash driver can be compiled as a module, but lacks
MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
Fix this.

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 Only compile tested. Changes are similar to [1]
 [1] https://lore.kernel.org/all/20240731072955.224125-1-biju.das.jz@bp.renesas.com/
---
 drivers/mtd/hyperbus/rpc-if.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index b22aa57119f2..e7a28f3316c3 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -163,9 +163,16 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	pm_runtime_disable(hyperbus->rpc.dev);
 }
 
+static const struct platform_device_id rpc_if_hyperflash_id_table[] = {
+	{ .name = "rpc-if-hyperflash" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rpc_if_hyperflash_id_table);
+
 static struct platform_driver rpcif_platform_driver = {
 	.probe	= rpcif_hb_probe,
 	.remove_new = rpcif_hb_remove,
+	.id_table = rpc_if_hyperflash_id_table,
 	.driver	= {
 		.name	= "rpc-if-hyperflash",
 	},
-- 
2.43.0

