Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5018938A70C
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998842; cv=none; b=CWy71kbkZTpNsOtMlxZ1wvb/CUC9Q6s9cHuKQu9dSZazdEvIJCeqpadqynzNl8LhBMp+mieSjMYAk6Af8inn6LZHCRM8aGFBM+Fu4st7h3loDGOvaTVyMi4OMPzJO7J6N2XvUdUEFlG6c/8EMIJ93zwiFljsvuDppWagNPeFmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998842; c=relaxed/simple;
	bh=rFVPwRmJXOuukbckyExOEqxhcMrI3l8VWIHz4onX7Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sNkvswp95cFssv5nQIrrAueQSP6Yfz/Pm0rhl6hLS7b2PNByvdaql6dQp9h6626qY/AInrbCddJjMp76W72IYZ33QvzYRkd1hEZrsHnsbJi5x/VpkMfdjCFlI+kBmhEX6BdMmFm0IojUNc4s4QT7ZdH7QcH13Ghh0MMPI7aKkko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122871F000E9;
	Thu,  2 Jul 2026 13:27:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] soc: renesas: Expand MFIS acronym in RCAR_MFIS help description
Date: Thu,  2 Jul 2026 15:27:16 +0200
Message-ID: <b92a4b39a18aec7cdffdfdfbc75de4ecadb0395d.1782998764.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

People not very familiar with Renesas R-Car SoCs may not know the
meaning of the MFIS acronym.  Hence expand it in the help text.

While at it, drop "core driver", as there is only a single driver,
unlike early development revisions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 2f2251d06457c9e3..8a625bc17091773f 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -490,9 +490,9 @@ config RCAR_MFIS
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on MAILBOX
 	help
-	  Select this option to enable the Renesas R-Car MFIS core driver for
-	  the MFIS device found on SoCs like R-Car. On families like Gen5, this
-	  is needed to communicate with the SCP.
+	  Select this option to enable support for the Renesas R-Car
+	  Multifunctional Interface (MFIS) device found on SoCs like R-Car.
+	  On families like Gen5, this is needed to communicate with the SCP.
 
 config PWC_RZV2M
 	bool "Renesas RZ/V2M PWC support" if COMPILE_TEST
-- 
2.43.0

