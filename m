Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB63D093F;
	Fri, 22 May 2026 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445156; cv=none; b=Xvtel6bxWFYjmaK41/HSg6jyKDlYWaRlCQftTzwnA6+DBk2wrNy/f0Ck55sTkpvaE7tqvpD36OqrKAp7bHlyCEj+Rmpu1WQaL+08kv1RxzzdFERd5+JlxEIOzrV/7A03f9fOiMgrCieuL0fsFD3oU6wchMOcnOeTgSWWeI7khqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445156; c=relaxed/simple;
	bh=b+kcs4+oMOM/Llc+Sa70fX2t0XYd5cyiRIv3Vjtmdlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKWc3p80gQqzSfsoSrCrSRJ2BDHnCzlR61GQLlLHsjp45g+DdlkbN7eGn9vY3kAjmQs1ek926QBdLxRIP3ngjtsWI4++rOBDQndTvoSkbK0zYFL7iRXimcg+e1CR1Irq85zi1o7IV2Jn/3T+59qbQg7ydUhz2Jgf/rruVimngjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKrzilp3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKrzilp3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C529C1F00A3D;
	Fri, 22 May 2026 10:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445153;
	bh=DsYiQHGyumygtMBJTB4arAhBm7bfD3isQprTj48F95g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dKrzilp3vQseph29uqh+gdL0lhzui08VFEISp1/cDsoJojVk0zB8yIp36SbbgSpMt
	 kMD6cxlFGFqeJhWIMI8gYY1dkKbpXKcDbkTasQi0dhvOHDZWEQYMBK7FtppkxfJhQ9
	 05hZlPcgUXqFvTSGdVD68MoLdNeNgcgezprlcY1NYqZrc290G97XjRpMbrTL4KssHU
	 +1tYOlB5Nrjogu97OHJgvIAWJ/aopmFkaWgW1C6EADm7a8ZRqmZ3gmEOEfKOzMEzij
	 CFdjZYSa2AxVB9Ah9L1EQ7fBAf6AzC7X5qauzPiFKziPygQeDesq/M4YmeHaH5kxEA
	 nKurnAW8GFjJg==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 16/17] i3c: renesas: Drop unnecessary tab
Date: Fri, 22 May 2026 13:18:14 +0300
Message-ID: <20260522101815.1722909-17-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove an unnecessary tab to make the code cleaner.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index e6e05ac03082..a070db4d2440 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -109,7 +109,7 @@
 #define  NCMDQP_DATA_LENGTH(x)	FIELD_PREP(GENMASK(31, 16), x)
 
 #define NRSPQP			0x154 /* Normal Respone Queue */
-#define  NRSPQP_NO_ERROR			0
+#define  NRSPQP_NO_ERROR		0
 #define  NRSPQP_ERROR_CRC		1
 #define  NRSPQP_ERROR_PARITY		2
 #define  NRSPQP_ERROR_FRAME		3
-- 
2.43.0

