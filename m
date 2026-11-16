Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825141;
	b=QmO2E0WDXO8OyaZ1wIOgiy0RDZBYPqsFgq2USAYu+lm3950ptYXTcQf4oFdT/bGjCnK8
	 TVNjwt5JOq1VDf/inkAZr6k83O7RKeyPjPZE/ljSmklnFUsiEdrMXwB4gr+pgsKPh2AIg
	 ZgvWiNyVEl7CkYvZ+BBILHAEqmObbJmzeI4pnxBDcMkof4W/9ZYfb/IXUKQsrtTUhl/0s
	 H+W/Ey9gUE4b7eGfMWEvVfvsuHKag+NPujb2O4MA3ZwLKUzDu3FPgukgKs8ycNtYJszmx
	 bYkIdJ2YsGcyH7MhTLwOjMCyIEFiTb5ht74NvXd2oICRErTBXIJZwJ0LiFPfjGVjm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825141;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XAJwt4YfHM1QBg18GoEs/a6MkRO/9asrmTnjYHxU5q0=;
	b=L7WTu4KN3M6Ea2cucklEqy1f2Nf8x5AcesRVDuqmlw15xVvVUOFZv86RTh10cVOyIjub
	 WWe5+yJbYJIHwHcvOfIMOrj+TQ4efCpq71ExLE+Lnq5WeJp4XjJnlO9Ce/YRX4Zh7ONH/
	 O3F9YBc96vaSKbIFvPanlWHLaVkAERInrhmWZ+b+OrWJCJ+jlPLvTHidjqYmpVpND1Dog
	 IxjVIJEhI1mD+LXUxMvyUPlLcKHFddSU2e4/i7Stkj7O3z/4W6zBlSNXPT8JdVfrv1mxF
	 netLfNeVR+Qshs33uvC6ol6sT63SThB67EAnO6oDotwMGW4K8p/ExbEkXLlZ7+P1kkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRYDWBSa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C6606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRYDWBSa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A9E1F000C7;
	Mon, 16 Nov 2026 10:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825141;
	bh=XAJwt4YfHM1QBg18GoEs/a6MkRO/9asrmTnjYHxU5q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lRYDWBSaFqAdsQOZQPhNFdViFMnjIWXEOb6nB7ze0m85Lh4P4tXLKmVY9Pvp2tVN1
	 RkIx8B+Ynk3XM88hzzm3JaAnBXGq5Db1c14vsvMjft3Fsxaw6/0mDtfFwGzuEnCvIO
	 1cuO3PXM8q7Hs9DpzaxvmWbiQsplZJYjGqMjB4TFkup4FjmqjNtCPiCsWFHr/GL4rF
	 65eqS7bWw/wx8nOzQwPLftAsipNX7+xQTTPGxE7KJX/FHqM//wTiQ4+jYO7DBDu8SL
	 0MvpGN+yy4k9g0i0r5dBTe+WRFscrY1RDF4FuxqUYUFEkW8jy/sL+SUJFmr9a3FBW3
	 FaiRBqtQ7rOpw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:42 +0100
Subject: [PATCH v2 26/64] drm/rz-du: Switch to
 drm_mode_config_create_initial_state
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-drm-no-more-config-reset-v2-26-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3vL7MQtn8a2/F2wH/4VzddnIz5viJ05pIXR8WHpdLQs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bnv7LFsu9TJG9abyx7STNm5rNLc8a33QsbbrtFb+4
 wUJT/lXdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJLEtibPjdVbRDoOyHPAvj
 AqMT9fW1ek5JEumzt34J+O6UP3PhDesm3f/vvrpd0JvtfWRhWZvhOsY6tf7yO0WXvBSrpNuWPd6
 3Mr1+rf6P8h7tz/cYD1Q0SJsYMhl0vpH1OyJ38+6B58zsD4IB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 87f171145a23..07171f2f3052 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -469,11 +469,13 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 
 		encoder->possible_crtcs = route->possible_outputs;
 		encoder->possible_clones = (1 << num_encoders) - 1;
 	}
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		return ret;
 
 	drm_kms_helper_poll_init(dev);
 
 	return 0;
 }

-- 
2.56.1

