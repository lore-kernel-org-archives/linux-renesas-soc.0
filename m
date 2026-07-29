Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2299D47ACC4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325835; cv=none; b=MTxKE8jvE8ycP/YmTTP5uQ5Syzb/+cjHSaDFLxPXeGNz0QY4l6bcPm17ZC73gzm6OWLvcnxeIXApT3I7/JKqDJf3V9lcbsk7Feh3UVLNJHrSTDx4XYo2GamfkH7hj6lVpImw1o1OwuLKV0H8YnOIjJyEv/rEdXKxh7WyZMNRWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325835; c=relaxed/simple;
	bh=IDDSrKuujVY3fkmqR47OUob/FeaMtYQ4ODZOULR+AdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vjg0ieeyFSCcxuSHxmT68GXx4Vm6sWIVsK9/onF9W3jCI2yMmy75EMuP7kSOKO8+O44MBsIt7stGuOHTkt81MUdwIzhgTNfZY+gyTTPvDKT9DzcO5rxfFBNPj2N3mx5zIXSLW2b6OHQAFRli35gs+VtJ3npQgSAgnjNnrv6lZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xsrrk6a7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xsrrk6a7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49550ec592cso12891175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jul 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325831; x=1785930631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyuAS9gVtut3TJKB/a3Pc/Pz60FPBcuwsFJASj9N1Ic=;
        b=Xsrrk6a7qLnUKrdhl+ZMgZhO7shbGUlEzth5IllYF2DoZNu0Fob/NKMGBMmKzaQYKB
         8IdLaFMzyMcWuJppY4FkAr49DpL4c9x04UPfSoQxjb7PTsHukgF0+WgzUdfRbgWtX2CU
         AJf3rD/YCKaXyaPAwBEa+damXkQl9R5W1onydvSAFsleDE5eM430JUjMVcgHpSvp4nZH
         TWZMyXaNuQNB5EIRmjfjdqJiC/iSQEZotMzx9mgZmqa+fPSN4Gov5n+TjoIcvn2QF/k1
         nlJihvS9AhXURVK9oOBX9/0tymSDt2hr3mTuCPr8IEK6diz+TzkKM7VJO7YnXoHAiN7F
         8QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325831; x=1785930631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyuAS9gVtut3TJKB/a3Pc/Pz60FPBcuwsFJASj9N1Ic=;
        b=orcV4mSQFJXMrngRqvxxYrL42n1D0TOuuLcXnjKse7bmdry+s2RYJOZmKWdT0UQGBA
         qgQ2ybLu0cQomE6aSSzGiPbpsdy6CXndMrb1Bz4YAG43ueTwr7CrdqzQ+iCiFsZfFDLb
         1xy7mXwo0QyoLdz90/HWP0hCGg5CVI7VfXrUxR0WBGHmSY6TZgwXQN1+SVek4pczH4kB
         2Qne4L+Ae9U2DTLKYl1xnB9X+w6WsFv6CY2I39+l7exyKwn57OIK46KYZKoTas8vKJHs
         QpNINQ6GAvG9fTia5+MPzdY4WThrmspWYbhqH1OWdRpNIutudEwb42VM+rPFR9rMq2y6
         L0Jg==
X-Forwarded-Encrypted: i=1; AHgh+RqP0mCHAHUTEOkXKdt+SvHDkMFKlEQL8syV0rhSbA/B9Jg3cz/vNikGkwEJvBQAEBiX036pyDGlRwIuQthAM+gbvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYqneqBwCTKAtui9V4omoV4iKu7FABWt6BYbjw9FdHtzQE7glK
	QMGG+7b1CwbhUNCCEo3AP9fRxrQpJDMLHJZtdhIJwSJ6FWZGfMb/K05H
X-Gm-Gg: AR+sD10FIwUwlZ7lClheU7yQ2yCjrj9sdM8fU0yTJiC06jWEKbJpwa05XwAnlsRde4O
	BP0R+NATNBtfRfQrP/DqVI5NclHeuI8viX31SJh349L8LW1vNdRngqW2Qp74kEIuB7FlmLhq9tt
	mkBV4swRxIibpfB2+BcgPPL3/r6oeoWfF147wXsw6qPz2Mss+euP+6jEdqbQq4+wDE9HwD2IFLg
	J0IzslUpN5lcGoiiWW/bjwJvb9gXtTo4eBymUxT2qpYt/OhTZY8AdLAofIdD4BOWhcfi7J7l+r6
	CdzVK4CGTUIQvjVnJHASfXBg5PpxmnJ83JZht0lcuik6a3t736fpiWttljrINWdkv/dXTSDkajL
	nDrl1I8Vkjf2azpQwATYrcmbUwmnw4CthaKgzTKOpPcQBfkHZY7J+2mnDtBLuWy3nhvqxbhEjOA
	SX9kG0l6FKWj2qGT6gACQFUa/pvEaC2si/70Y4MZciYtGoWUzJDcAJM/uuEkY5J8ctsKnN8HuVf
	sTIc0vyFs8wuw==
X-Received: by 2002:a05:600c:358e:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-497fd2f5086mr20130455e9.2.1785325831270;
        Wed, 29 Jul 2026 04:50:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:31 -0700 (PDT)
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
Subject: [PATCH v5 7/9] phy: renesas: phy-rcar-gen3-usb2: Fix devm action registration for disabled VBUS regulator
Date: Wed, 29 Jul 2026 12:50:15 +0100
Message-ID: <20260729115022.222340-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
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

