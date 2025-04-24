Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E601B040B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Apr 2025 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485220; cv=none; b=s+3jP9zay7teposG/WhBQAVS6yoAmx/E4dxtUWFdCchOaMhoN5W/6vz64m40KFFloJW0qt4mDwSEiaRWCw2n9O8e5vEBSiSeONMNVFmdpvXQvQ9UfR+3lmuo5u+FeL21xOguxi9MRVKwEt5qBVAeMCYd/JLI+xgTG7WakMYfoyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485220; c=relaxed/simple;
	bh=ppQhnzMFE6cgLdxjgqYcg/282UEdXYSGxI21eGnoI/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HdyB4oVMpCY+k9d2nof/9kVCPAhUWHpezGySVNHIyM+kE59SoneVU44jLnCvJF1OkHHhIc7OvDfosq81do5X58cUWkv8WTQQWMA0LbhrlWII5E8BK+bi/vb1tUXlr5jFNugtHX2SbSfgNBZIjQUbNDyy2LzEzmwCozZJAsTHCsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 3V36vAeDR4yNfE/wP1b41w==
X-CSE-MsgGUID: 3ETUWFcPR2+LKjwj7H2kLA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2025 18:00:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C437E4005B3F;
	Thu, 24 Apr 2025 18:00:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 3/7] memory: renesas-rpc-if: Use devm_reset_control_array_get_exclusive()
Date: Thu, 24 Apr 2025 09:59:51 +0100
Message-ID: <20250424090000.136804-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace devm_*_get_exclusive()->devm_*_array_get_exclusive() to support
existing SoCs along with RZ/G3E as RZ/G3E has 2 resets.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected tag.
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 64618a2d09f7..9f3ac5cb9ff4 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -603,7 +603,7 @@ static int rpcif_probe(struct platform_device *pdev)
 
 	rpc->size = resource_size(res);
 	rpc->info = of_device_get_match_data(dev);
-	rpc->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	rpc->rstc = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(rpc->rstc))
 		return PTR_ERR(rpc->rstc);
 
-- 
2.43.0

