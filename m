Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3F648B399
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997145; cv=none; b=useSRHUxVjyW+u9murPkjIA9Lp9BthxkdCuMAP/UB08VU0KWqM3kDtj9rbZ2SPqIvJaWszPtag5pj2mS7kg4swHrFtBY3w6465w++ZBK2Q4WCUmL9d/0efb0+C/MNpGCdrn+NTDCyT30JLGO0p7KkQRKvw3ueRTgQMMKmARzbBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997145; c=relaxed/simple;
	bh=oV1CCVg3eH8TSkPu/DJlUsaUIVBn2K1qyEcAW7O/yMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mtm+qZ/TUDQfk0jYCtslFqLar0JUiehOEtxUaHNQwQoACpKZRVaR701YhC1eSJxKBEavEDSUAOWpSC7aUbbJVSIkAfBC6St5W8Cf7OiXq5Y24xpX2DfYjRvwlplxfzzQY6aRzG2UJDvIYj2CfvC+StDVhqwOf5FcbiP7p7tMZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4FfClzM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4FfClzM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1176227f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 05:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782997142; x=1783601942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmLDi1XgEV0nw8Bvz62Dym/abqNF+kJy2cP0AFA24gY=;
        b=l4FfClzMZc+owBG7gesuFftgDGui+q9WiVIR1PnJW/xfi9GR+YMbglIFKOn5oxvykm
         UfeUMXq7lGTPDB5ttsKOVktd+oO8BP8X2kdv/EdXltehLLo+nP1TAa24cIzfPqvQk4r8
         D1BmSs/NMRdOztAXvPJgWGlIZIaSCX6fWcj+yF6YP6LWxTW/+Bg0EStL2/DLYlHdiTWi
         mGpZCOypGTMtVvEby+8L/Ol9tCixEHKIcenEkx0t7oXUUNdmD2UnbtKbw02jtNm7NPKV
         i71Kt6Ud33KM6Xt+RgjTKxNufZARyEHj9NdJKhL4qGT/9E0hRUweDR9esrCAdKejA/va
         EviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997142; x=1783601942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmLDi1XgEV0nw8Bvz62Dym/abqNF+kJy2cP0AFA24gY=;
        b=ZRnjBMOg/FCRXQABVGpaqb9YMb9jkVzOdLOtQMc6iuOKKOplWaZhzDgD8BrYYIK0DM
         Rd8rQorF5c+yZrI9s3+gE7zaZijSN8K7LN+rZ7YYTAhW+tZRLoEyO9wChwB0IHgajcbp
         QqhjUT7qbQMhQXOuLPLGtHZKuCeVh3RQrnzSuJI1P9yezyjzx3285GSsvkkJzIFczGUh
         NpUm0RgrWCSPJe4785Caoazzjaegb2dPWqynzGaEN0IInp/95Qbzp2YeMLzGK0cCTs2L
         1xuziSZbs4RaEzqX5EZprSFvNxCHZPN5aoHzHSNuV3fimrk3kSteSICJZ50N1d6pVJQf
         Q2Ng==
X-Gm-Message-State: AOJu0YyYCFmKJTI+ZG7SMUtGJjn9VZ5l+vB7RNcrysedLwR831Tg9Q35
	lC9t6TVyqt320MjxOjOyhcHifB5+Eu7ZUa15zNmpMp2tOPxSUbDU2kG4
X-Gm-Gg: AfdE7cnii1Cexw6SIHVaSAF/g9WoO0d0K4k828Mn9Gn/EeJThRs0L995C792Ew1FFin
	ejjC4V8oR51PiUhdpt/DitS5eB/6A0duN5rvH35xgn+jK0Wq7X5LsopdQ9PsT1rWkUt4hvuShgK
	BtC4a0WAIH3pxVvHcUywgEdPNfMZGuTfCHvsavjSejJVIRORdtW8Y9HE3po5Bu60BO8iX8BP7B0
	HHpYG426BFHh1YsPo5eLU/2vxSUdhG+JpRC/TExLHcgVkS8KKAwGePHAq3tA3sB4Qjz71olQcLW
	UyyfoEluMp9N9sVQ3ngWgH5J2rlwpxPPPimTKhUzEl9n9fOoKmdj9GAPQQv9DaDp73IJ46Kxdib
	XcRs13QfW5PFLpiF9na00Q/n2z4hFF20b4j6GAt3DAbOqxQtOxOtse6sEA1aoZY6GhCLecf/mNn
	G3/WB4GJ496zD1eYHVre3fQul0vV0+iGuEdIRF4cuVoOq4JPSHP+Q410Gth4PEF1ctWph9bsmfk
	jZN5zJMmI6GCEy5EBwi65XFSgw=
X-Received: by 2002:a05:6000:2505:b0:46f:7d90:8127 with SMTP id ffacd0b85a97d-477b3889474mr7327706f8f.13.1782997141864;
        Thu, 02 Jul 2026 05:59:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a44d7sm8312273f8f.9.2026.07.02.05.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:59:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Ignore missing VBUS regulator
Date: Thu,  2 Jul 2026 13:58:55 +0100
Message-ID: <20260702125855.3157253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Commit b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for
OTG VBUS control") introduced support for controlling OTG VBUS through
the regulator framework.

As part of this change, the driver started requesting an exclusive "vbus"
regulator for OTG-capable PHYs with no_adp_ctrl set. The lookup failure
was propagated unconditionally, causing probe to fail on platforms where
no VBUS regulator is described.

On RZ/V2H and RZ/V2N, which do not use a VBUS regulator, this results
in the following error:

    phy_rcar_gen3_usb2 15800200.usb-phy:
    dummy supplies not allowed for exclusive requests (id=vbus)

This failure completely prevents the USB 2.0 interface from initializing.

Fix this by allowing the probe to continue if an external VBUS regulator
is missing. Only propagate the error if the internal vbus-regulator node
is explicitly present, or if the lookup returns -EPROBE_DEFER. For all
other missing regulator errors, gracefully assume no external VBUS
regulator is available and return 0.

Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index ef38c3b365d4..9ae9975d3255 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -902,8 +902,17 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 	int ret;
 
 	channel->vbus = devm_regulator_get_exclusive(dev, "vbus");
-	if (IS_ERR(channel->vbus))
-		return PTR_ERR(channel->vbus);
+	if (IS_ERR(channel->vbus)) {
+		ret = PTR_ERR(channel->vbus);
+		/* If vbus-regulator node was present vbus regulator should be available */
+		if (channel->otg_internal_reg)
+			return ret;
+
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		return 0;
+	}
 
 	if (enable) {
 		ret = regulator_enable(channel->vbus);
-- 
2.54.0

