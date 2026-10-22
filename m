Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672517;
	b=t4oX3FxJPURnX8A81MKAqfA1P99/+tZdMift6s1VV43Rb1Oh9x9Ex0SRR46kYKPIexpX
	 Iy7/+W2fmC7sC8lRLEkN289I3SUZ+ju3scRwjNexNinRVi2CQP3FRTgzc8Me+wylwLRqA
	 DoH0wOBEg8GIhQo693BrB/CsdxbxQqnUj6culGw5aRlY4h940vqYuV7QAym/2csWniQPJ
	 W4NgOo/l8JJSFnyxDHQ3qU0zke1gRqmh+cAPwehbYM0tZ67lRAUG9Hb7zMX8Nnp9ixG6f
	 RHbySfW3H8BHHY/rLOXUg02LiR5Dk8MAXKyfctT2MQpePndHXj4+WViBGv8j5iAcO9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672517;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pqRaDNkqe8f9DtVE2NaN+rUHO44z9/zJgN4TZ+ld/iM=;
	b=a0kd+B0sO493j+GMiq+bMY/CSbItgKIZeyoU2i5UJabTKL1fLogRRzEeGIpWHAyQVcNW
	 hkkjSpT5VnLSL8cpwgCp9HJge9Ux/QL1bIVoqzie34xul7NfgsGsTUmpyI7qaosjykXEk
	 YB19JWCMRWhXREzqGB+gYQyBMRfcOMX30k71OT8/723afdR+352e6iTFVm5jdAgy5i0Cp
	 03y6u/W+C4SI/8bCsvSpLRJV8yulEAn73nDbSG/YKYJuShQ1VltmxR4oXEByjdU59gJfV
	 GOSCmXII0ftwZU0HIQK3EDuHoFYXQicT5zFBErWXMQvDhxA/Guy+6mWTP/GkA4V+21Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUtaZIbn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3BA606A31B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eUtaZIbn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F821F000C3;
	Thu, 22 Oct 2026 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792672516;
	bh=pqRaDNkqe8f9DtVE2NaN+rUHO44z9/zJgN4TZ+ld/iM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eUtaZIbnkUXhnVC4Ws7ez0/YxKJiImmGRJtU9091SUhxEc5k+vLvl7Bk3zedUEPK+
	 AUtZokcpgolPvJNPuKYqbSyQ2sZfyzt807Exmu9y8lx0fdqanXQeX4b5tkb/WgUfPY
	 FRtCdhekuH2nIgog24D7DORIxg6tyG5BUG0PZYphwiTAMSUyslADYp922j+gX3bC+v
	 9Dx59HWyNRAg+IVX2B1zlkRew9qjvX/+ZEbpW7LA/GsaZ/oqBK7Hbm1uKvR7VuztSi
	 LXUcO3nnFr19JuL9YLP8hYEWs8T6vl3ndp0OctOyUfJVoPcFoWEwwf5PGn/QelrKuZ
	 YHyWufcrW0Hnw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 22 Oct 2026 14:31:24 +0200
Subject: [PATCH v2 25/59] drm/renesas: shmobile: Switch to
 drm_atomic_helper_connector_create_state
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
Message-Id: <20261022-drm-no-more-connector-reset-v2-25-0b7e4e85b1e8@kernel.org>
References: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
In-Reply-To: <20261022-drm-no-more-connector-reset-v2-0-0b7e4e85b1e8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NR1FxXJ00EdI29wZavF73nbKd5XofyB0ipeWrDAqHjQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3mGZ4qs0VX7no/xnlw+c7Pd693Vq+5aCXo9LmopVHF
 9uF3ilr7pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATUfFhbOgz5O4K7kvkfVbZ
 o569Ocn76Tl9tUtd6VNWRj1x+av0Z3Nb/PfObdNb9fg+sqVUN0wtZqzPWOrzYXePqplteNWPnAI
 /7xu7sxPmX2jX+/powVr1t7KcCiJnL4nyKbZJcmafKbHOfAsA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The renesas: shmobile connector implementation uses the deprecated
drm_atomic_helper_connector_reset() as its reset hook.

Switch to drm_atomic_helper_connector_create_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 51bae2008cc6..d1a3e17f5bb1 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -528,7 +528,7 @@ static void shmob_drm_connector_destroy(struct drm_connector *connector)
 
 static const struct drm_connector_funcs connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = shmob_drm_connector_destroy,
+	.atomic_create_state = drm_atomic_helper_connector_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.55.0

