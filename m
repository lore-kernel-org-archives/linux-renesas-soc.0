Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A1230C60E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705732; cv=none; b=lOTUsrDi1LaiEYnNGVEdZw8RMp0UiLVn8ZAsMB/kDpS8m1gs3SNN7V53IErCGM35dbVixm5W6PfAFyjHrIMeVYRh23UeMQX4UdVdLRrDURugr56Ah78PNaGpzjkHWCDlv5z031XNGJWadMgaKGfgFd8IFOnadJFSza9rlkeDpEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705732; c=relaxed/simple;
	bh=SHgJNv0OmMogUnHRmFjbJRm7UQdoyy+xzb1e6HAHXtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uxZ+ISq26IXqzY2hWz0WY78xCijHxRTAQJpL7YrtKhehE1CfE1bQjTlWmR0xvHDFF7MaZ4dSNFqbhWugb2786pytdsrrrGln0xM36jL44Y7WFBcx0kh4Up3SXSYVGKpqT77DXnOgHUQqgiokOqBvY96PGq8iPSVRx4ayg3jUz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB08C116C6;
	Thu,  5 Mar 2026 10:15:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] phy: renesas: rzg3e-usb3: Convert to FIELD_MODIFY()
Date: Thu,  5 Mar 2026 11:15:28 +0100
Message-ID: <a52020ba597e2e213b161eee21239f10e6057d9d.1772705690.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the FIELD_MODIFY() helper instead of open-coding the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No changes in generated code.
---
 drivers/phy/renesas/phy-rzg3e-usb3.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
index 6b3453ea0004cf59..7f809ef1bb5135ec 100644
--- a/drivers/phy/renesas/phy-rzg3e-usb3.c
+++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
@@ -78,13 +78,11 @@ static void rzg3e_phy_usb2test_phy_init(void __iomem *base)
 	writel(val, base + USB3_TEST_UTMICTRL2);
 
 	val = readl(base + USB3_TEST_PRMCTRL5_R);
-	val &= ~USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK;
-	val |= FIELD_PREP(USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK, 2);
+	FIELD_MODIFY(USB3_TEST_PRMCTRL5_R_TXPREEMPAMPTUNE0_MASK, &val, 2);
 	writel(val, base + USB3_TEST_PRMCTRL5_R);
 
 	val = readl(base + USB3_TEST_PRMCTRL6_R);
-	val &= ~USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK;
-	val |= FIELD_PREP(USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK, 7);
+	FIELD_MODIFY(USB3_TEST_PRMCTRL6_R_OTGTUNE0_MASK, &val, 7);
 	writel(val, base + USB3_TEST_PRMCTRL6_R);
 
 	val = readl(base + USB3_TEST_RESET);
-- 
2.43.0

