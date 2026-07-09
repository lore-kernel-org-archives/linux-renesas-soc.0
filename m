Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930A240B6FB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594074; cv=none; b=YpmitS05FwRSfBG+B6S5PUIYBwFGUa+edpKb7t0UWlt0FVeDpiXkAKkWXYhellNGDNR4ViSlSPCyEoiUlh9SnrgL/BM7VjH8Qg4vzCDHYhdV+9S03nRpYaktCL5Bk7Bw/ij0e5GEvMsgncfn2JgGblKwRQ1O+3gf91jz3jgbAtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594074; c=relaxed/simple;
	bh=P7O7uTgJ7QBwbiJv4Jh9UynbJw5EB+rMsE7tohvbjRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0apjdW0Z8x0vPIrrKsT6dH8MIdFvPGOoV+gX0JCq9DN4j5zK7xdFXBpta+sVYV08z5t6vrdvQY/51YXKahyrkINkFdKvCkkCx0bXGXVde6ndZ0OI94PNMRJ2lCqqu67l2Mhsb3/9tG97XA2gAnOEs4KMR7YTiXgzS88UpfQRxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862141F000E9;
	Thu,  9 Jul 2026 10:47:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Huy Bui <huy.bui.wm@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marek Vasut <marek.vasut@mailbox.org>
Subject: [PATCH] soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"
Date: Thu,  9 Jul 2026 12:47:44 +0200
Message-ID: <64de6e95719a6dec7412cf7e917a42749e738b99.1783593775.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Kconfig entry for ARCH_R8A78000 contains both "default y if
ARCH_RENESAS" and "default ARCH_RENESAS", which are sort-of duplicates.

Drop the latter, to restore consistency with the other ARM64 entries.

Fixes: 5284d0b09d1bdc69 ("soc: renesas: Identify R-Car X5H")
Reported-by: Marek Vasut <marek.vasut@mailbox.org>
Closes: https://lore.kernel.org/a069d50d-030d-4189-ae9d-37f989829da4@mailbox.org
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.3.

 drivers/soc/renesas/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 8a625bc17091773f..e0ce51a9912beabe 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -356,7 +356,6 @@ config ARCH_R8A779H0
 config ARCH_R8A78000
 	bool "ARM64 Platform support for R8A78000 (R-Car X5H)"
 	default y if ARCH_RENESAS
-	default ARCH_RENESAS
 	select ARCH_RCAR_GEN5
 	help
 	  This enables support for the Renesas R-Car X5H SoC.
-- 
2.43.0

