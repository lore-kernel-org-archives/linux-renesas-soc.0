Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887819;
	b=p7vzWQsJthLTxutBYHo7utPgrBjykkVkx/BK4CygNAV7lMuLJvricIMzzEogRtVE19T7
	 OqRt0651WS5KG0KRwQRJV4Iliq4x+v4uDa/jV6S8nMV/PNGIT4DAKJZOpm3jKyZN4Upcc
	 7UprKZKLWeM4extyq7H7RXpw67nUP7DNRQ0F3dEzoO3vU+QW41AnpIs7Atfgec91GjL+7
	 WBXQ87PTzG4buO3hTDCFbWq4MGnd/WPLQfnDW9KsFb6NqWmd5CnMRustDF9VmQAKBEMxU
	 BH6p8QHj1ZYXx4hNkpmsNoLSjplP2H3HUMVFqAsVvmhaGOQ7gwJkUXoXmDMN3IOG6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887819;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oEwFU8kxGNootWbanLckfnHabmnx6wi8GHXlgZkhggc=;
	b=B6XGmc5RuBTd4AlJYUYXFEfHmLOtZ9VmtL44DaC3sL7GDVQiXhCg5Ej2EwYCP3u582Oy
	 lB4X1WNiKUoUNatcvIvBr0186jKg5ANkA+SYoO/6pKoeOO8DJjXf4GHciW6oNwQIwGyl7
	 35C3h6IIcRGfY0arUz5buXdbB2GUsFOQ2/uctejf6RGxDdjz2V4PGTNTi3zIYDDdrl5+u
	 ilyOhlDEtJpaPmWQ4yEWjE56KLWfAxoAsyl0SUIWySlK41YiQ4ILAiIqoF4Jk/wZh/lyP
	 zdKKR4hIhBea7YOVqOBk7ya/ExDDQ9veOmA6wceIyNXmqRZZeTL4MCdVsvfcZQm6pJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEDgJOM+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3232606D809
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEDgJOM+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF9A1F00A16;
	Thu,  5 Nov 2026 14:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887818;
	bh=oEwFU8kxGNootWbanLckfnHabmnx6wi8GHXlgZkhggc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EEDgJOM+yAxLKTWXLjtFbhEkI7QmS/OzO3wIr0QSiZmPW8ad99YuGybVo1c+K29ZV
	 QyKiUJc2s51K+pNrbaSIzB9eWGo0I+NZC9eId863Azcj0/2+M6jXkZ9gBNG7zvuFrW
	 +tH0VMueoDWyKfWwWsieYvoT56/4ohqxebHCVWp8CDKDs/czmXwRmTcjiMudjbaifd
	 p1H5ZcS/e+GwaJLR6f6mDkilzFvyM3ArvGY3CHe1HzJNLbp4rf7MvAuDr11e05m1nG
	 l9BKmkuomoL/TX+jxiDrdm9DUwh71bQN6Jb2ZnAc+FodSTZc/B46yJtqIY0SQCfm5l
	 x+MfYJFEZ7r5w==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:54 +0100
Subject: [PATCH 37/83] drm/shmobile: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-37-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MPnP1Fdgr/1ZHUd5Tng6g/AyYwiboeB5nV/LUg9cRvE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvetdslZS4sK12xwSrLD/p/hbnv0nSf252bfqrX1L8q
 Md43j6xjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRTY8Z6yzlDv9Y5bH/W8+8
 iEt3VVp2Tn3AWR7C6xJ1VKSvcMqdKD6tw8vml3c/TFqov/rd85tGSxnry5uzNbKV2Tb8Nbj37ng
 /y6SZ6++Z3SqdfyXpmnPXglh2vuwTTavYgmwtz+79u8PzzjMtAA==
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
@@ -176,5 +176,7 @@ int shmob_drm_modeset_init(struct shmob_drm_device *sdev)
 		return ret;
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		return ret;
 
 	drm_kms_helper_poll_init(dev);

-- 
2.55.0

