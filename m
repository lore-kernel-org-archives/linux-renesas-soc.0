Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4FD4E56E3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775197; cv=none; b=LUdVAB/d+uqX87Kofor4ImuV03YsO/tE7plCakOOhVFiUovZZDSDG3jsr1j35j9oe4HZadmnYUrDge0R0WyGB3DbuwrlroPD1RoNVOKhQpomKsrD4EIhslUMuisZtu4g+XUWbFRxRLtYSr6xnl393kH7pcPZgLGJ6N7nFJ0mDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775197; c=relaxed/simple;
	bh=UxWntyqEKLykIVeSFH35LRX0sm3hVNeSusnj4m4o7bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxZEOJ62IuFTHBivr3diexgJ1jYcweq4WwTXgcApOcyd131c3fRyrPL+/ggBOyl0K7LJqgi3mgOiL+J6irqE623GzK8LRy0B1yCuP2fKVpNXiclxCCQVS0hL/EDcgogHbKWnbJSL4rU9Rr3dqzB/hZJPPjEvub5TxyZrLfDDS1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HecGFTQr; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HecGFTQr"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so3136852f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775185; x=1791379985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T8gMBX5SXPAGkoLIA5GhKIYAcxw/XWcrRzadX1Y9sM=;
        b=HecGFTQrNNk/FPUdQKTusA2v5XR9vXWbyd4bUkqt7kZr043aoLavltnADlLKnTgIBt
         QrLr5AK4YkusA+odSIsLwhW2Ki+pF7saC0pSoTX77KzSW7THBVJkORgVr7hgctSxV4he
         BI9Ggb5MxmLOFhOiMf8sXenuuEFJ4dDjkqWjUe4a+bbbD+TSCegmEE1asEqzhJSNlDws
         t0vh8Ov0RTvRNAa/OuJk6PaDSIisbfRGh8CeQKJbWQ8IEGW5Qk+9kpz1wPDHZ20UgvOB
         gjvW+mDRPdCzKnyV8WmbWj52LO6lB+XRHXK4c4QJMLPnTAVHyctcR1m3RZq6ohUFN5cC
         vmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775185; x=1791379985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T8gMBX5SXPAGkoLIA5GhKIYAcxw/XWcrRzadX1Y9sM=;
        b=pzBgyZ+x1/gyWDPHZE2YgTkKr80UoNrzrdSwIRLi3bdxDfFgShxOi/ZGh7NcZSY/rI
         Mv0/FALMhbI/RBbuHCe09XIcNhoSP6imT3iOBwINl2ZKxmDUU/3nr9ryEOFs5jSSGSvy
         +UWSCtHTNxEGfwuFp1EW+LI9T8L8bTZbybEjnriuG76U5bNCxTOFDBx9kp2TydoyLwvV
         JUPvV29dtRaePoCVyuNzhIqiS2AWyR4Cc8lYUcUfZSnWyOKKP13RpDwL2ssVdIdXQUba
         m33hnQ9evPBiM0ok4XILYo9Q0CfPLqIpfv55H9VAryqDZKtsoatOuXxh8VNPMDVjn5nY
         TJ5g==
X-Forwarded-Encrypted: i=1; AKwUvBy5ACVFWtcz1Kb9qyNWaJBbcIkkV1bvOtCGmQPVY3x42IfuFW40+bBxkPg7JphnLo3PaQtW5q2FdZl7lVWJ/Q9oXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJugR0ud6ydMWJ1EnB9QW+WIjePc1YfgL673fI+o4v0lYb2x6Mt
	aNioGmWgtmo1k0S6l5mHeUgEqf0f3aBxab6GQ7HV0lnXtHmkzNm4cmbO
X-Gm-Gg: AYBFou2oOPt28wzaTIv4a8S6KT8DozMh6rl35k7jOcXxFU+OmP10qQDTRP3wh6lY4pQ
	JNs9p5VexWXUK0NjfQEU8P1ljpiEx9x5aYmGm5buiDp/ySyM3ghJX55dvqGuv2l1Zuj/acjaz+B
	WeBgjinmj+PeN+YgPC6QjcikOIkJMpgfZQFmv0GH9p0uLnOsUqjaUsUa6GcOfBy+6jv6waaLJDe
	Ytz7ufb3guKF6rt6in2sj0loBPR+ZmlWjvrbC6lRSf112RoBJOgToRc3TnvrF1mAvgHv1SXOdOz
	xLVZyOTO1YeSz15Tn4FfawP9gRp/KD11bFklTUntBUyWVGKQcGHMtkIF9+8ohWpY4/HtV6ypDdW
	88ILxgIyoc+SOKFR+HKcOC2B1+VywpCT/Vbmw8cMdCI7gEOlTOHDQMBgKxSGaW2CcI+LKveuk2Y
	0RyrLCIHEaxn6aP9lxdnvW0lZQYeIF5eCij68Z0ZhjzM4oOhaaddCzTfQ+IVgdPOujnqrqwTzyb
	Ps+rNOfsBo2+C0uOdwLvEI=
X-Received: by 2002:a05:6000:605:b0:486:f46d:bb02 with SMTP id ffacd0b85a97d-48b02585d75mr2843621f8f.57.1790775185199;
        Wed, 30 Sep 2026 06:33:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 2/9] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Wed, 30 Sep 2026 14:32:44 +0100
Message-ID: <20260930133257.23210-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the post-reset activation delay into the hw_info structure as
activation_dly, allowing SoC-specific values to be defined per
compatible. This prepares the driver for supporting SoCs that require a
different delay after reset deassertion.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2128fd16ebc9..1538eeece2b5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -59,6 +59,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u16 activation_dly;
 	u8 features;
 };
 
@@ -806,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 		if (ret < 0)
 			goto err_phy;
 
-		fsleep(1000);
+		fsleep(dsi->info->activation_dly);
 	}
 
 	return 0;
@@ -1534,6 +1535,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.activation_dly = 1000,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0

