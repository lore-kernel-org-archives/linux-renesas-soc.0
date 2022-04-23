Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628FBC433F5
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Apr 2022 16:44:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiDWQrv (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 23 Apr 2022 12:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236220AbiDWQrs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Apr 2022 12:47:48 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8B1D6CD65C
        for <linux-renesas-soc@vger.kernel.org>; Sat, 23 Apr 2022 09:44:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,284,1643641200"; 
   d="scan'208";a="118915064"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2022 01:44:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 96AAE40071E4;
        Sun, 24 Apr 2022 01:44:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: sh: Make SND_SOC_RZ depend on ARCH_RZG2L
Date:   Sat, 23 Apr 2022 17:44:43 +0100
Message-Id: <20220423164443.146299-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SSI block is identical on Renesas RZ/G2L, RZ/G2UL and RZ/V2L SoC's, so
instead of adding dependency for each SoC's add dependency on ARCH_RZG2L.
The ARCH_RZG2L config option is already selected by ARCH_R9A07G043,
ARCH_R9A07G044 and ARCH_R9A07G054.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/sh/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
index ae46f187cc2a..97916e3ca9dd 100644
--- a/sound/soc/sh/Kconfig
+++ b/sound/soc/sh/Kconfig
@@ -47,7 +47,7 @@ config SND_SOC_RCAR
 
 config SND_SOC_RZ
 	tristate "RZ/G2L series SSIF-2 support"
-	depends on ARCH_R9A07G044 || COMPILE_TEST
+	depends on ARCH_RZG2L || COMPILE_TEST
 	help
 	  This option enables RZ/G2L SSIF-2 sound support.
 
-- 
2.25.1

