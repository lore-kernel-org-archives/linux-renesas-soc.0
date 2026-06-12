Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DE63BB117
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274663; cv=none; b=lXEeZsJH9qJto6aWkovGGJsIKVvJnLwTQIUbj/xGGnIEc+bEpySfSkR5SwafbNd4cD5owSbX4uq0KQfSoBD76Sbgk/y8fxuKQPdWuIA3soH80ZGhQnB087HQvpBQpx50LZKXvw76siGDMd/RENq1XsqYJ0cRjhH+7rpBBFshMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274663; c=relaxed/simple;
	bh=72eGwrRmAN9yFzSvXWaIpYv0xF7W3qLJnLdq9nhGBns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxENJBCzr0m0t12bmZ0yM9RnRwuhXMjDMos15qO/VQ2HXl9K/peGrXE/3/aNlji4Btz3OqGsrV9r949d/Ym25aLnYC3jm3YDRZWqy+/nXB0ztNNDTLCk2SOjgEOqliw0dzvIWWHltZxCiY6i4RPf86oyMpqNG8tNp2LcVN2Gek0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbdMcVWj; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbdMcVWj"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso9015305e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274661; x=1781879461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMdyexsnk9vzJ+WoVc+Ut0/kOTtTWH91CWtJGBzMv6s=;
        b=SbdMcVWj9+kZDcA2sOE9uTk7WbG8aF1dApHrQpecw4vjWwdEXJEoTaLpOZTFJwOCRm
         MahmipgW8cWSlf1zmqP0DiBKj67dmb++Ys8OYLTn73p6f+/pxsL/i7D0a9hUu/zAid8m
         nk9Pm531un3pW0t1Y3T51JNJ9JgswiEVvYtKOV4Jz3WRtuAaJqMVQJFqmTUtW+hNkmFZ
         7he9V/FgMBWJOi7v8mDVWu2fmHt/BTLLDuQkFieQqzNur5IzRHWy4CYHcsUsQZ/jC5lJ
         ECZro3F0fjmTCP9UOt375FoXaoqO53Rhp17sjLm8ta/jTFs/W075THMtbpAzo5EK3xEx
         /RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274661; x=1781879461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cMdyexsnk9vzJ+WoVc+Ut0/kOTtTWH91CWtJGBzMv6s=;
        b=qkExAP+5uPcu2tiC3qY1AabSrG7xbvmbhU54D+0o/klKr5wtMxKEyhcH3GLNeEIehT
         YLXJjvmn+LdmxJhnzxjNgDR1l3HjpnkK4v7/cAz+bzKiRgPhH5Lzp09iWZZ5ACSisCxK
         EQSpnuw6RiSbOaxhtu1w8of+C0GqBk0p/tq6+Vs35nkT7NlibVoW+tVPhADhc1b9bd/X
         0SivSm5FL1A9TicZL/LjQ1YUCIT1EA9OR5hwZPi2iDMHjwvguS4Nd68omyMf9Yljo9XM
         nzy02B8RCVzn7V7bBAAY4Nyxz0cXDFvuSRaRIlbF3pOB0xz/OMZ57iqWkJGXQ9a6iZN1
         ppIg==
X-Forwarded-Encrypted: i=1; AFNElJ/UEO+Lq0uQparsnWb3ehKAC0wnCxo9XdWeBKXvynI3ccHSWSeGKXsN367ShH/NtjFYC5Pp/QLlrrbSSrbGSTZ43g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnHhgjzn6ZY+wHqc2gWM3nv374IQdecTs3qdVNr6hjkxngK52
	BPMPeIy9F+fK3GCA1b/pU9k24rARhRcnMZZOeK/MJpwlrn+5qyC5VR60
X-Gm-Gg: Acq92OErObQf+Oe2bbhQMBVTB0zEo4SDoQ+IXpsLZ2G/lKxFZuOtDm/H3oc3uuK4AZ3
	fbzKEi3RtnDY9iGaz5QqdXjT2utcbUSMsrqDKaWrnBYlErwro174eSoaMBgsOBVAVSneuZMAgXV
	gizJTr/cr772xDCZu9kRvX287WatrOTCZDgxXlIHPYSwifaAHTF2YBV5GjdvjJtjUvaa+QydyqG
	J0IghcEFgDRMD5k3K5iuTHoWuRqb5Ng24fu2GEBPSazUnhvA0vUajkMwfQ1tJMAvubK1p2B50JV
	B9xT5wpxTHkn+WqDBC8htani0qU6SanV67yIg38Biu+jTjGaTCUHLHVL6s8mQXQ1HdTUWR/T+If
	tKUjQvc4nPK/lKGpZ89vTXHLnHSnzl0Dtsn+iJ82zMa0WewvbC3dTSLjExmaQLoWVFFRYNtdWp2
	0aC7zlTsXmRhfCAeQv8IgBXcZ4ABgYzZoqZ/9Yacp/g12c7k+C
X-Received: by 2002:a05:600c:3586:b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-490ec339ec0mr49640985e9.0.1781274659660;
        Fri, 12 Jun 2026 07:30:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:59 -0700 (PDT)
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
Subject: [PATCH 09/11] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
Date: Fri, 12 Jun 2026 15:30:37 +0100
Message-ID: <20260612143048.317907-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
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

Previously, the devm disable action was only registered when the
regulator was explicitly enabled, causing the cleanup path to skip
decrementing enable_count on device removal when the regulator was
left disabled.

Fix this by always registering the devm disable action when the regulator
is enabled (checked via regulator_is_enabled()), covering both the
explicitly-enabled case and the initial state set by
devm_regulator_get_exclusive().

This fixes WARN_ON enable count during regulator release.

Fixes: 24843404efe4 ("phy: renesas: phy-rcar-gen3-usb2: Control VBUS for RZ/G2L SoCs")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

