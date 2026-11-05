Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887815;
	b=DbSG/U1Ib+3bWQS/XmLySZxK+y+Y2srOSHJV1P/kOHV/lCJxiOaha1chwsdjaqjI54on
	 +3QcpSQu9cVd1loBjJZ6HjCBe0ZVptsNLCeSCRmKDc01f2PAaxdk/2tdHpZdABq41Qyyt
	 iqzIRZVRwEujFtvWVDmqMSV1k2AEQNZ2kqYxUtEqPwbqvzBPQ5kbeNOZr3uByera3pW8Z
	 zXSJpaI0pSVsp2ru1aTH121uZhp6IzdkxW+rckIIKAFLiDN4ym0zB5uWrKlrdJRaEz1Mq
	 0Hlob2Wwr7p4lEt68JtacAhDrO5Gn8DePAuEzDlxj2cWrr6DxDjR3maL418PLXt0zPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887815;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=U4qTLL4GdrGy+i5Fi0inWkeQg5wg4Sk7QHXJit4B66M=;
	b=A0hY7VKrPsmPCWoxaAOJ/WsnKHWNZqLxWUS2BdeIeP4YMrXBxfFHQ1ibZ2c+LmviKh1t
	 cZN8A11L33pg1/C4oVsLd+y41o2LvBjD3eO+AI1jYrj1fRca2luzQL2N/LnpVxvP/tPzj
	 SrpywiAtsfYzxCB8N7EBO6NY65aq+8mzP0SQpgASBE1meNQDiFFpN0Wnc9TxiQ3lc2u19
	 0ro/zFUN2KLZXF8romaSlTvpobj/cxCADoZYDZR61DY+iZn48pzHUnIN0mAdjhPcjsA4k
	 8xxnpHYw9YOsU4YGkhUZJCvMjh4AlwBwVPUUNwnlWr1YH7fmGYaLEuuhrR1txgFwDmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X0FSl4G1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE80606D804
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X0FSl4G1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834CC1F00A18;
	Thu,  5 Nov 2026 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887815;
	bh=U4qTLL4GdrGy+i5Fi0inWkeQg5wg4Sk7QHXJit4B66M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=X0FSl4G1QCcwWlfAOon5sGZL2gMx53DOLPlkNfMNZ8/DGoktANz8LBu8ogNKbU3kb
	 PE7bAUkyXjYWJjV2J/UI5rk5r6i4pz39srROHG9mDmNs60IUFbVkHkFK/Gr8jU3tjy
	 Fa6sX6hmHagwFD+31oHYcbooh7aysbc04HNYVFPatd/JtIUTVpJZgXLey2iG9zgjlS
	 puM4LQKDqszAI3uO7EJt1Zlb5HhYbM5iE+P63v8dbQMIU877TFUCP6ye0eDPBhFeHS
	 a8iCn7Xhz6jknHk9e14OcrCH75ZoL1VxjNDMep+xCpKM6Rz6kA7XbW7eduaib4e82V
	 EL8qfYR5u0Lvw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 15:07:53 +0100
Subject: [PATCH 36/83] drm/rz-du: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-36-763560c2cc3f@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-763560c2cc3f@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Xx+LYaqASLs8iN4K0HiKC5Ge2XL3pVC8a3xfBXe+Ba4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvelcrLy6y05+99pSpcKNdnsu6o3uPlJ1IU29YP7OOY
 doqtqc3OqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE8sUZG/4qVtg+Eev9oLj8
 2q4ABcfoqzNquN60isYwOk+SEZj73+LC9o/StYzyCzQ0yuJWvRJdwdhw0H9q0BGniQqe6+4y/DL
 RsZL968r2OWTiC/b/PPMt0phLA3kK86R2F2aEL8uecd4g7hIA
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
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 87f171145a23..07171f2f3052 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -472,5 +472,7 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 	}
 
-	drm_mode_config_reset(dev);
+	ret = drm_mode_config_create_initial_state(dev);
+	if (ret)
+		return ret;
 
 	drm_kms_helper_poll_init(dev);

-- 
2.55.0

