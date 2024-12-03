Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D231E2842
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223341; cv=none; b=O1+SA4e1T91EKKJ0WmPfKZPToHebwL+LDboLwJPNDlEOp1Lt9pPgnw1QKbBVoOoR8JAAxktM5NkaDVybgam5z/hSi7Yy7bKu/p0f+0ilMGlxu2M0AMcCKIBeouFxWg8V5HScDHDFmp3nNN3coeFW8YE5Xgkkv1OT+Giz4nVOlrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223341; c=relaxed/simple;
	bh=7igNhRGV/N7xzAJJl1ESRfzqC83aDTGC6g9/qty1qcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VE1uvXPhp0BAOY7j8/l4tFojTw4kurDdHeSvZ/txJJvxydlBDrVUXP2vAyqavvi2TA3SSPHu41/eDFlgyVGd+qiFTD4X3wQ20nROAF/YnlYCNaWZCT13twWoFKeVd65EuKDu8uWC4PjATg+IKTqZrdoO+uw+mSFQQHidrOeksuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: +/8uJEpPQ2eabPAcpyckRQ==
X-CSE-MsgGUID: vuYGDpL4SqiC34Y7EgDjMw==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754394"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:36 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E69E400753A;
	Tue,  3 Dec 2024 19:50:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 05/13] soc: renesas: Add RZ/G3E (R9A09G047) config option
Date: Tue,  3 Dec 2024 10:49:32 +0000
Message-ID: <20241203105005.103927-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration option for the RZ/G3E SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 9f7fe02310b9..6d2e135eed89 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -345,6 +345,11 @@ config ARCH_R9A09G011
 	help
 	  This enables support for the Renesas RZ/V2M SoC.
 
+config ARCH_R9A09G047
+	bool "ARM64 Platform support for RZ/G3E"
+	help
+	  This enables support for the Renesas RZ/G3E SoC variants.
+
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
 	select RENESAS_RZV2H_ICU
-- 
2.43.0

