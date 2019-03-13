Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EAEC4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:58:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E2F4C20449
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 10:58:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="IkC6501T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbfCMK6j (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 06:58:39 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34899 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbfCMK6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 06:58:39 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9F64925BEF0;
        Wed, 13 Mar 2019 21:58:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552474714; bh=CP03E8/wWi16xe7s4XZgKZtXnI/6o5EmsITGBtRki18=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IkC6501T+gTlfFWAo4r9vpf2z20EFmKwslUxVkIIJZ8t9X0vJ/9XCuiz0rMMiria8
         SsHIHM9elozi2gRWgKtIA0yHNpqOqjH39OYnghDxkCECHChKyCHvZrczZCD2+9nGJr
         1rs1hiIjc5NvKM4Vh24vw3/uMAlse19foT91njDc=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EC5A3940D34; Wed, 13 Mar 2019 11:58:32 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: ebisu: Add PMIC DDR0 Backup Power config
Date:   Wed, 13 Mar 2019 11:58:16 +0100
Message-Id: <20190313105816.8592-3-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190313105816.8592-1-horms+renesas@verge.net.au>
References: <20190313105816.8592-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Ebisu the DDR0 power rail needs to be kept powered when backup mode is
enabled.  Reflect this in the "rohm,ddr-backup-power" property for the
BD9571MWV PMIC node.

The accessory power switch (SW23) is a toggle switch, hence specify
"rohm,rstbmode-level".

Based on advice from Geert Uytterhoeven.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 18a99d2e1ea5..0e873ccfd9e5 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -466,6 +466,8 @@
 		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		rohm,ddr-backup-power = <0x1>;
+		rohm,rstbmode-level;
 	};
 };
 
-- 
2.11.0

