Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892744;
	b=ODTBYWZvqNSjJnDZ8bMD66nZAuO8IEbQTjpluXlCZqAySmipGrsLT4wqyG+ci5YosAu9
	 ZHAn1xWUoetvO0YKT9Bj40WyyfraFuU7m/Sr6IJBxPS/Bhw0YUbfF3T4vZwOjIBtiRYCg
	 koBxVGSteo36weOJX+OFW4ONHkR7lVduvqFQ1ktivFPCjgm8njuHr39epXLS5jrgda7JP
	 +1p7Z5ZEJBrWveUps1gWnUfY8g0HHQxrDRwfMpdbiLMjN9CYLyQY6oA7/ifkXK+NJSRmj
	 4bUceGUwRtVh/llN8OuNVSl3Sk7HNoO8FkLoDyI42x+iDjmbGRiZTmlzd8yk3n8jomg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892744;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=U4qTLL4GdrGy+i5Fi0inWkeQg5wg4Sk7QHXJit4B66M=;
	b=NdSOt/vA8f4lPLlV8/s+hYGS0MawWFs5pxg6asEjAI8OKAZGNarHoVQ7xIEMZeJufH9q
	 lIPcjI5i4hSRrd43HMG3Dg9+03I0QzYPQC5MZQlSJJS+ZvNDVG0B6SXfs9udczhSYA5wv
	 f7di6sCO5o3zwQQ8EgySwp61vL3g8rEP4cehFTbACgxfJyLyNsr92yT8zzIwnheDj22is
	 44NqrgIB79V+uwhH82oBz2YsJQCjjd1W27LCzG8aE5rtwZO30eGy27HqD0WVYEVAu53wG
	 4PTwKtySgn/0J56oAIiGSGMr50TkBRRRHzoP7N8zzbFDqW+AYfyUgke5lyXNOtdXz5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6aMFSMd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C70606EE80
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P6aMFSMd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9761F0093A;
	Thu,  5 Nov 2026 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892744;
	bh=U4qTLL4GdrGy+i5Fi0inWkeQg5wg4Sk7QHXJit4B66M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P6aMFSMd1QowdLiFdAqorhSeJvHqd7xNrYY0LXzlKk4LEP4A2P/VCplOI79JsH7o2
	 KgPIjwQXf7hHpu1CmsTeksYOUm/dHXkMQdY5J8yHQoYi/ZgD6CDxmSYS9nSWor0hc2
	 lYs3oOpBf7xn7meJJNktBcLqXbS+QJlaa0ZQ7/RQP4wx8Yc0gFhngXLGdt8KuE10xh
	 B+LnA4o3zygR0MmHCNB8LW5zVxrZWVcsqzFjYB7M8mPQDMzj35yUVaupXI0CPNSDeT
	 a9BDYXYuc6YBPHZIxiLWraJAezbdah36zja3YVD0Rth5N/oKhoSva5nuwO+64YuJ7P
	 SAXLETw41EkCg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:45 +0100
Subject: [PATCH RESEND 36/83] drm/rz-du: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-36-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Xx+LYaqASLs8iN4K0HiKC5Ge2XL3pVC8a3xfBXe+Ba4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFrxNE2rMs94iy1/79VjYpw+2US2KS/p1ptRMaNbXY
 /slJGPWMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbSvYGxYbKfRuzCnPszNRlM
 WOt9BJZ4n3X8uWJ37qny62XPzUvfJD4we77Q+HL4rIQX0qdv15wWY2y4x8M7y+scy8WG62bHPbp
 Sp/zMEXosahUjcCIlNXJC8pUwqwDv/d/bJXWmFJxjZ0rmWAkA
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

