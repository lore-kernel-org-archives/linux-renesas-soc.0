Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA08442B3B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011768; cv=none; b=EmBffNSnVxtOHL+mQs2cLv23hcJefSPGkLzsVa1W2p/YyBUKpO8PvJsIeG/JlTxqaOimNg6XUda1y5eWhVPx8Gh2tjh7vGDqMIAZ74Eh0E0PV6pcURzHjIvwt+XGGS6KDY36rLhLx0L49Znk8CtnBnZu3wGrix+Q/qj+L2WQIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011768; c=relaxed/simple;
	bh=CpjGJjkO7jGU9XYFJYAFWAbpoiWMteRLkLL0VPfB/yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+gzTMGFjSX8MKbthRx+cUxatp5quGwtMkrynU4tMSTBVKDsz51apX/+3HlHxJMKB3kQ3Y0haVgurMHJU5MS0kGCkBdgmbyyMhUXFI3cxDmdIvDVRXJ06gMz1lsExpSlF/owHWLEmOcY5C03WfjmtMXFpxltx35/i5PvG92eAiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOvEEOIJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOvEEOIJ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso623443f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011765; x=1786616565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK9LWHF1p6qfBGmnjDoGNT+oihBS0Hqu0q6BfX3ivmY=;
        b=BOvEEOIJ2yMYrChRM2CcxLHTDU7qliSDBwd+PutS77CMub/e1T5A8OMIxOzqO6z022
         lfptLnJOIcf2IdBbfmaLDUk9KlhDWxmilEaQqZhbBC/fWh+TvOxjmU7PF7eeGb2qqHoH
         0BHMm4yRjmAQuf6LWg1ACZ/WBVSuH0bepScQc/uiGdvDZk42V+IBp/gb3bO505JdQw1D
         g4+TmRLk68/eJ6/qd5li6A0oYWSggfuPZzc2UEW5KPVxni3X1ET3PPguMEeTEI7NXtDM
         MoMF/kV9Fkn9HxWshrhQeZ20GGhATmAt9xOKwcBBJnUtOC4wM6WnTXZntwiSqBp8JPe9
         JMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011765; x=1786616565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK9LWHF1p6qfBGmnjDoGNT+oihBS0Hqu0q6BfX3ivmY=;
        b=aoSY5cYMPq8NTp4txdphKaouH0sdp8suGSqXm6yTwFTwAfPFV+D/jvfXeaCLNTxNEn
         CJSLJE+oznf3MFrudHKIsyrsUpyWkaREx772Bpm6yOf0aJTmjRtbPiXYSu2kVJ29/Lqz
         Lrl3vpJDo4Ltvr5B9ImUvyLwdSZ6DlUVx1pZvcIaLrnoeT/9eHJkbcEgZwrKkojTdZg5
         lExCO6W7C6+qyaRYRPcderGGTo2bEk6/2Jx1PZVne8EV/x6dyRkIf7MXB2UUsFrq5yXc
         +E0T69sUMppgfFT7GcY1PPxCPZc9jX9z871fziVhhi38SQjS1c+xJoeS74zDhRHDcX+z
         sbGw==
X-Forwarded-Encrypted: i=1; AHgh+RobQQdaQiizpUMpojgb5KSj1UD52dQexDErYyu43qe2LyChyx+aGrUX2U5IE01DpYeln+fSCghVoLo+KsSj2vZFzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0zujpn4AWm84sjoJv4ASU5grF9Dkw382Rhx9HbyTVEsrfHb+
	6QL115IX3CeVnpuc3Ezx8m6ypNm4PvMSDyIONMSECTS+Emvz5hiDua6D
X-Gm-Gg: AR+sD11qHzqF6Oq7KYuzRFMHl2MZv6QgayCMz6E/ore4oOlU4fA4ZJE+9Ac7XPngEJN
	aTmznD2oDult4EkcciMUMBK4kccO0K+PCRTMCK7W9F/kdgK+PHsJSY+eJnQtcB0JTGF0PJoCWwl
	JcHKP2dUSW6yB6tSLIo3tx/6aLD1jfGIFOwCXONictc368VwgaYRIyrGs+Ab3YnAzVMsGLeykp/
	JgSc4dW06ClC1oLlL/VrhAd6Rz4N4/ZXcH81Klol1HCLrnVZVTNshOxeI51tLcO8C8g/IB6E3Iz
	tW7ZxWSkSlDuoYxiYr29tduxqGGW3SXmcCrrRrhF3qgzlYZfj4HWsCTN3dn4DmisnUTbX2DhXUM
	yKXrX0npnzWDLGzr0fuy23AF1dvZgDgowAYkq6nTz1dAeVF1Cql/Z79F6llVh+AuiA6//MWFP9G
	EFHoOBDTajTvobnuDbsRedTJ8ZSFmTwMGft3MNmUWubcmRV7nUwdA0M9XleUFimIfe6eWPnMgBo
	smDme+ok4Oc
X-Received: by 2002:a05:6000:1844:b0:47f:9c6f:8844 with SMTP id ffacd0b85a97d-47fec4f8017mr19647350f8f.9.1786011765177;
        Thu, 06 Aug 2026 03:22:45 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:44 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 07/10] phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
Date: Thu,  6 Aug 2026 11:22:26 +0100
Message-ID: <20260806102236.149159-8-biju.das.jz@bp.renesas.com>
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

Add renesas,usb2-phy-r9a08g046 to the OF match table, reusing
rz_g3s_phy_usb2_data as the PHY configuration is shared with RZ/G3S.

While the PHY data is shared, RZ/G3L differs from RZ/G3S in that it has
two OTG controllers, OTG interrupts on port 2, and a controllable
OTG_PERI bit in COMMCTRL for host/device switching on the port 2 USB
controller, which is fixed to host-only on RZ/G3S.

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
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..d06fb52ed5f1 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -721,6 +721,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r9a08g045",
 		.data = &rz_g3s_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,usb2-phy-r9a08g046",
+		.data = &rz_g3s_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,usb2-phy-r9a09g057",
 		.data = &rz_v2h_phy_usb2_data,
-- 
2.43.0

