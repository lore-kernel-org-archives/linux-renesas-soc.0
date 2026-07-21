Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C683909A9;
	Tue, 21 Jul 2026 14:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642974; cv=none; b=GMTdW/7RRD/9KLAI1sTLJqbsibZWQxL1jgz1bj9n9RhbrK6DtGfzYbl822DRiF6GK253ko7MbeH5U9qI9bfpDPiX2+a5Eufag8ag53ocUUgodCjys3HRay8OcTcA1l5sRdW6QAMJE9xLdLKIwH6T+8uejd9ehLHrJY2/0a+t3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642974; c=relaxed/simple;
	bh=D8QwM0uilcapCYahebYxbxQR0Fg3P3JXmx6E08wEthY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LL9nNUwSwQFLFOpX75E5QrQajMrZTxvVU8WAQC7aJ/+szQfksZJU8W35sGS8GYMbIv1PRVzbQ4uOF3Gv20EUtnsTBmAUxWXijcl77bh7VCS4CAkxBNoPvW3zJdxK2tS22tbg2AOM2HZTwYzWryhxiec3vBqB8ERC5rjyAJQ0qOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2A01F00A3D;
	Tue, 21 Jul 2026 14:09:30 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com
Cc: claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] i3c: renesas: Drop unused structure member
Date: Tue, 21 Jul 2026 17:09:28 +0300
Message-ID: <20260721140928.1618736-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The struct renesas_i3c::resuming is a leftover from a rebase. It is not
used anywhere within the driver. Drop it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

 drivers/i3c/master/renesas-i3c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 2b501f31e874..ff1a243a802e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -262,7 +262,6 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	unsigned long rate;
 	enum i3c_internal_state internal_state;
-	bool resuming;
 	u32 free_pos;
 	u32 dyn_addr;
 	u32 i2c_STDBR;
-- 
2.43.0

