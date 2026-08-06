Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2698448CF6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011770; cv=none; b=S4VOSn5DoIaGJBJp0i6i3rBnLvg/Pm8CjXyJxHUsnjGhRlThUoU4EqTkYwHhwyBhGP/xs8tb+54YsXyeCPGUpU7hv0P+FGXJ+jqjqNhxGST45h8z+WipG4Yilk+jD9pexndE8lurb11rHTWQfYN+HMbOSWekq1N9J9fkh3Hnck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011770; c=relaxed/simple;
	bh=9zrffylo8jvqTayCDjjN90RWF+HfDIBw5zjL1pOp9mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnCA1gmRZ74Uu3AqKgQH/MUb+rP+Y1mJLILwm0pRDbXuTrlWUHUEsP5fqzhVq3KgSG4mItRxcJirmwiqPSR8grVrNuc+UU3muW3LCuWFDUxdZXpuUFw3Cgzkb6lCzHpnQEMx49ZSuP9UpkvgdrLh0mDFw6fECCf0pFR074qgqmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSNw2yR6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSNw2yR6"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fdd674e17so1254134f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011766; x=1786616566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwgSPPFxW8r6f/Mf04pgxVIGLx/CCmkzEAjLQ+ITnU8=;
        b=GSNw2yR6wqHACp0lr9Kr42caByEqhs4CQmqvr97UvOWMk+a2/t8DV2bTEPtrxZJ84N
         NTkH6XiOk0S/v0bB8BBudYD10OuoaSOdJGzYhCmfRfoxhbv5Rs4mmScgbuGNxV1VRocb
         DNHBLMDcQZk6M0d5gSAh8hJiSJp+CfpO4EJel03SDdGGudb2FVko07FV5sQTSGdekGEN
         YPnD/z02De4WJCNGzZizwMJZB4zX+WPIdFoaBoc12EiHZZSUy8Rpl0LMg/7RdcVdxuAe
         U830qnjmg5RmSrcJF50bpwz+VCPlIK7qAkHpDpWjPZFGRXqN4VdiqVxqLbJHxFWeb5XX
         A0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011766; x=1786616566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwgSPPFxW8r6f/Mf04pgxVIGLx/CCmkzEAjLQ+ITnU8=;
        b=OKiza6n3TA4lZy4Da45CiS8gDbp6zsiZL4WACkchk5P91Hetss8uKxPHlkyfcbN8SB
         3NHe39GBTD9qgRR/nAbjDl3SeCTLQqjpGyfBF5Wyy8tZc8O9GS+K0rbiErEcSM7v3ahP
         W5rqO96CYwG4xWIb9/KckNr+j62qIjRPZJr89IOSkRA/8+0QYPo7OlwjEPA2eJaKIGCC
         cuFnCxIm2TVuWr++sOJSaXi3XqjVf00auv4cxasof49YOYH4Gs9KfpU4mJ8w/GwHPfKb
         46XRBdOGQ9uE/3uuMCKWKT9yb8BzfwyJPrDrkcHZl631rihK2n984NrYZ1dRSPhECY5k
         kKzQ==
X-Forwarded-Encrypted: i=1; AHgh+RoTMRT+sAyLZluF/m0jyxHAk97DDmIyTZlekxwEiFCMlfelPUYok0rRum2yiNPd+Ir2K4VeBtQypyKq/O3f134WYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypvmaJIPy8Jqib/Av1Q+6wm8n1/yLKcW0yjr1SGwx/vQnkD0e2
	2zN4G0PSWUWbmW/nCvjyzKQcpOqt2PfWRqqD1Zwhm8pqItQa9M7p9Uq8
X-Gm-Gg: AR+sD114faqmOtWaYAHSMoS4yilUnse2METDYw89SRLpif/7hcrF+4DOdSBrJTX9naD
	9Ynd77GS5fwB7WxydmmeMAaSWOZhkhJUnLoLD84MOholPevFqrfcnNly0wwBLfT2Enx7aTpsiJ7
	HYTWQ8UegDXlovXMVNnSBYLOpehWMx9LbtN8w80iO/mrRtMz9B3Z4GvKIB+pohc3KuWP87vERnR
	1jHS+hytbF0sfnavQxB1bYUGKDHEOwbjguCcfI+F7rrp0zoAaf4RVVZY7zBFLnTE8Euv7hZeV3b
	buYQQmmCuyLLVZaI8ot7sU3AxWtzieJx/dMurMm4M6HAAQAKvfKLvwEKe1hjcP/G1GFJfKGNs/D
	N/1/wMNqVIKAStoTBkHEwIr3J2ytDLcuijfo5lLteUCxrhgvWss6cuIWIuzZfUiX6enuYJrS8ow
	dQ8Opmo1KwuzIm5VAspvKv9+op6W8LjnPIi2/iSoced1LirpunArYLoJrXcpHgMcTlxEsZvSxE2
	mtOklZOeTI1
X-Received: by 2002:a5d:5e08:0:b0:47f:826c:7422 with SMTP id ffacd0b85a97d-47fec532920mr22349820f8f.17.1786011766127;
        Thu, 06 Aug 2026 03:22:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:45 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 08/10] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
Date: Thu,  6 Aug 2026 11:22:27 +0100
Message-ID: <20260806102236.149159-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

devm_regulator_get_exclusive() initialises the regulator with
enable_count = 1, requiring the consumer to disable it before release.

The devm disable action was previously only registered when the caller
explicitly requested enable, so when the regulator was left in its initial
enabled state without an explicit enable call, the cleanup path skipped
decrementing enable_count, triggering a WARN_ON during regulator
release on device removal.

Fix this by always registering the devm disable action based on the actual
enabled state via regulator_is_enabled(), regardless of whether the
caller requested an explicit enable. This covers both the explicitly
enabled case and the initial state set by devm_regulator_get_exclusive().

Fixes: 24843404efe4 ("phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d06fb52ed5f1..ef38c3b365d4 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -905,15 +905,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 	if (IS_ERR(channel->vbus))
 		return PTR_ERR(channel->vbus);
 
-	if (!enable)
-		return 0;
+	if (enable) {
+		ret = regulator_enable(channel->vbus);
+		if (ret)
+			return ret;
+	}
 
-	ret = regulator_enable(channel->vbus);
-	if (ret)
-		return ret;
+	if (regulator_is_enabled(channel->vbus))
+		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+						channel->vbus);
 
-	return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
-					channel->vbus);
+	return 0;
 }
 
 static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
-- 
2.43.0

