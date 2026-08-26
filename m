Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA794570E3
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 17:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766553; cv=none; b=mggtYGgrE0tM20kb/JBdV/z5hD9EL6HZhksiSPCQZPu/UWEscBPD9IF44IHbyg+YztZnrnd3wf8C9CjiDBvoPwoETddXq3NUlvqbmoB5g5Wl67OzMeJQ5UidE3JlFWU6r4ofG+K3XwVwNc7ktihFeoAFw/Slu4sn2gya9d1qMOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766553; c=relaxed/simple;
	bh=1x7y3a5AUOrcn5z5HBEAF5L92PCFAuoRpuOs3YWC738=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giKyn6orOyPuMc5lLQ6X0nniIOkrqxsXcDiIeGFuRGc1zFxhXYlDizAaMT2v2cL1jKQzaSLubjJ5vPsXShALiCO1wsLLxRlmwfVwwxqweNhIjbQ+KiNGIgbOpZgTXzAtXN4FPHlIK1KuYRTrY0PZ1v0h5Om1dUi0C3F3SnF4ThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Th8va5Tt; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th8va5Tt"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c207cb16cf5so191744066b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766540; x=1788371340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2YMeD7dLZisixXOJMrSKSkr6GLMkfgvOUyr+kt9XhqQ=;
        b=Th8va5Tt9tGgoeWxjzTjKguQ0kv7N5UIp7a7C+VQK6dRYv/RJ9OPNK2dEIO+FhUDF1
         ni+S6VbL5qwYEGSMhgVPRH22qM5E7cmiTi03Z+ChV9aBKK8K+/KsNFfSyOEKCUrAzIvC
         cR1dlwndEIFuLI24esSJLKY0K2S4g8u+gTCSyGY5CfVxEIptwkZA83QpAvxO8P756eEK
         XTHXfDSmrV+U/Il4vJiigLd3C9tJBquCuJ2AukTgBg5Z/Dlsw8s4sWhgZ2aCr2UgpPfR
         NaPtcPBDT8vTjRUGTvARw0SGywqL6tQYove77+FXCqZudfs5Fz+KT4wHEpEVfJdGzCIw
         7ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766540; x=1788371340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2YMeD7dLZisixXOJMrSKSkr6GLMkfgvOUyr+kt9XhqQ=;
        b=R5YK+CqQ8XXj6XROq5aSO0mRfeQs4RIL7rWcdOMR6lBxu3dRqDzAZDUeynn2B9EbRJ
         1j6S4mfcGHSCbwozmSXAt9Ar6QoRpXtlJeebGfKbv1TBsXuxqGxyYH3w/bC5yVFebtyf
         fHhRJURWwt536sHisXf7q/8Q3/fOy689U18TL6NtFWv2StfIw/kdff+mmHsv7fPd21TK
         e474dNYWfR8QQ0V6BmQzfdNcl8IGLhjriZ3asvTeaQCliC3NUX+Co0p0SsNjiviG/JjA
         Y6dxfizN3mxxxGeqNGCp3/Wln+rfp8iABpU4S55GceMmBfgupR6wcEFKKPVPshMw+jYC
         Zkmg==
X-Forwarded-Encrypted: i=1; AHgh+RqAzyeIxihGNww5dCmFeWRo3kBKk0iEj1unNQIylk/YWyEHCzyaXMEMahlLgyAUlyW9AGAYcMxjJqFNxS9nazmElg==@vger.kernel.org
X-Gm-Message-State: AFuF++kpt2kK4PDSVX1S7s4UBvqnN4W2WFQHFqsPTIksJGZoKO+2VhGD
	+nRv5AFIPLD+e8gdA6Lw7jBtKL3TJegDo1hSWxeuIJhBZYqSj/er6fFr
X-Gm-Gg: AR+sD11HWSCTjTDCViVo3sH3jhJUBJ5rRMewwl4TvbnUjFUborEF9kIF+wlexN1xxhl
	1M3RHgQO3u0MDuN5IkQDRA9U0lFSDh4AS1+n+fUwz3hz/rQwo/PzBEXSGPm4wZfc3SGYGPON8YC
	SdRZe7J+JHn+EPcOxqHWrcjRaWRCbtm9eTk+xvXZv0sis1wsacAwAsnWmOyGRHzxpgxfcue2rPo
	5bC+bwPfYDI8aY1DmNe431flnyrOH6PTqThcec2SuJ7v8QTuhONFGCZPnXDA31bgz5AytlxDcA5
	/LvdNC6gpiht8wEFfIIbSC+Zm8xETvCaLyeWWvxi48Xv+TSXqRjB2r0fll18ZFbv9F/bJZ0iDjq
	VpR9L9Y98lnnZncpU4nx+xuN2VkxQ9B7+xvQc/iJpDP7nudGE5JxBmqWoxgnJEE2eFM1pM0vp5S
	q5yIxflPR+9ame5KGGBLWjX3XV7YC2e0Jk8POlRiSUd9qZWSgWlOgGJWDbBYrrS8X33uXJc3R2M
	yH+qLaNBgvsfg==
X-Received: by 2002:a17:907:c22:b0:c21:4393:c41a with SMTP id a640c23a62f3a-c250c312bbbmr1016918466b.11.1787766539831;
        Wed, 26 Aug 2026 10:48:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:48:59 -0700 (PDT)
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
Subject: [PATCH v3 02/13] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Wed, 26 Aug 2026 18:48:36 +0100
Message-ID: <20260826174854.199139-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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

