Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825144;
	b=XzkbvC2RRZNkVWKAVLVJRkQbaaTXWmeOOmc6UijbGMgggJkXDulMocNiMUILMp/3oS6y
	 yoaQSW/O8iSq/YJZwB8aAaUKzdCrpTKjg4kgKzKOYN3bZp8I5D9SGbciGuwTue+8/Th4V
	 zy5+GFRX9Fv5eA8v1QM0TCUlko3id5Ydab8ZsT5aGQ5BQ+evtGjONdYSJ7PpchSTbteud
	 DMin3sW0hHyIrZUhbUFqdzGnEVBUX8JXobPzf43El1tcoFS9DNkhGYqoDBDwLTs7MV1zW
	 CZdaCGpjr9wEK5CkHyEeIJdaromUv0i+m8WzbZ1tp5Vtlo+Svfw3xZvw3fsO/bYfB2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825144;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UiqA/72vV0eLt2JOrYnJjxfsQ9GQDGq4XgGDwaYkoQg=;
	b=Gf4bxWOXElwZwrcVtUsG1HxcY1zSa2N0I00ZOqFTnmxFgGDeILcIZF1fk8cE6F4xVR5F
	 ASkRHmYwSyVuoQ2tR4WohDZ3fNUXF+5CzWu3vgYxgJ5trt0cEbbvUC1H4Op3uqUHunHK2
	 U0d8MDyP4m7XJvtP9ogJPFa60zPy8lwQV1xwONTT241mOJBvYRtZx91TzzId4vQyaYBxl
	 s/TTplnz0yBbvinYmzaG9sNGcSQmDFNLx2oMDvzW6ct3P7yCpicsbThVWIPNt6zGA5HFZ
	 6uinXvlEtzhMuELVrEU+UPIle15RI0jlckLirzdrsD98rn3BjUi5zi5y7YuGx30yOUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUiwds9r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53ED606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUiwds9r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CE71F000C4;
	Mon, 16 Nov 2026 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794825144;
	bh=UiqA/72vV0eLt2JOrYnJjxfsQ9GQDGq4XgGDwaYkoQg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RUiwds9r3WJsvcDLyrkPX3yhjf/zMKSbelOl0Mbfg5JoOyVv4Ts1KwZRQl3IL9heC
	 6yzWGu2Tsx3Uhlu7ObCtxib/eNuMMrjOX+BSnCOS5ap+C0uew0NG4zzt3lWTlb0KvI
	 6HhE+01yAvkashPQph+IaSpngqFfdNreV1PhLjFw41TeBbU3NwhqIoEP0UdCxuPY8T
	 iLsKbBk2LyydBb6W56UkRKLuOJOZw7ivKnEUjk8Z0ag/ZjlyNSo7YzJwnUX7+A501F
	 bE2apvoxNM+El0YuFchNO5IMNaIcGyjso47VmKWShrZTj7n3F7KMpB8GBxMCUqmcvk
	 lIbg9fEzg6+YQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 16 Nov 2026 11:30:43 +0100
Subject: [PATCH v2 27/64] drm/shmobile: Switch to
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
Message-Id: <20261116-drm-no-more-config-reset-v2-27-0bb471f4d1e0@kernel.org>
References: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
In-Reply-To: <20261116-drm-no-more-config-reset-v2-0-0bb471f4d1e0@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417; i=mripard@kernel.org;
 h=from:subject:message-id; bh=EOEk9BgG10IJIz4F5/ozQl3/KFWIemPCQzKNXSqnGJY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm/bns/e1/HsnxpUNhcuTlPF8uxb2i1ceW2DlQ+7uixv
 HNeinJ/x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhI/TfGht6Q3gypldbr97od
 tSssuu6i+v6ZplD+8t7cmtVhwhOcOw+mhxfx/5ntdrQruHmVUEYtY51NZeRy4XtTHiVvM5xcrqq
 dlbTsq+eagIUZ/68IPdg720m4eK49z6O+P7+slFp+/b64aw4A
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

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
index fd9460da1789..4d3a714e255d 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
@@ -173,11 +173,13 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 
 	ret = shmob_drm_connector_create(sdev, &sdev->encoder);
 	if (ret < 0)
 		return ret;
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		return ret;
 
 	drm_kms_helper_poll_init(dev);
 
 	sdev->ddev.mode_config.min_width = 0;
 	sdev->ddev.mode_config.min_height = 0;

-- 
2.56.1

