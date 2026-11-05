Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892748;
	b=YVE22qJ6v3BNJUyc+e3zhqCcaEnd2J0jQzPn9oKzP5o8O0ZhLHOmqJ9RWKYJIsvJVsQa
	 LKgmnHnG80jZ7GJs2I+9Lw1mQh7/aA4BQoGqf4d8GeDSpvsOl+xD+4UOU68JeLq2cNITm
	 Nuezhwj9MvQ6ms6rkduE8c74RWFPW28qKS6Q3mnfDQR8Lt1E0ICn9pWrR1mBjiI5Ai6Mv
	 ILM//rMqaugROq4+KXRrhRBY5XEaXYbiOqlPVdvjFsdyelU5m4avz4qrwOHwI3ZmFFVK7
	 m+Q6gx8Mz3fOMlrRL32IUE5kquBq6yfdmuuA8j7o8wq27DxlUbxlCwlh9lcF9B5K6Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892748;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=oEwFU8kxGNootWbanLckfnHabmnx6wi8GHXlgZkhggc=;
	b=bkAVvGNBCnsih/RcD/rzAGrrNxc+JdZwJ2BI4Y+oxxNvN0c9xw4jksZ4Z3hpSSoTA4d1
	 Gu0QBt0URfymK/KVTk4XOw+wr+rvMTBE241nQYYDXVGaPXbxNg5ix8i05BaJIKw8BUD/C
	 SHIVviPnW0ackFBZWolzNKMxtC9Nw07hcuoLnFm7x5iKeWGwoKxygb277XLAEXlzeMV9I
	 kMgVYD1WWMg3yqL7IgzKiKmViPWhB8aUH+Hx05tBoj1W9mLOKu+HyEbWHG49tnHKpnmtM
	 SqOYUlQYeLJu53WxL1RD+3CZP8HI9XTtJVJzPONjpDoPh3XcD00/EseSiFmIy1z201g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MnSr4U/w";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B7606A326
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Nov 2026 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnSr4U/w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593221F00919;
	Thu,  5 Nov 2026 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892747;
	bh=oEwFU8kxGNootWbanLckfnHabmnx6wi8GHXlgZkhggc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MnSr4U/wt5dQXEBlE6k5NouHUv7UDgSS7NOfc1aUrXforJ8VYdkdYlBSrakMkj3MQ
	 1JNneSDggTVzLsKyzONW0raE7ujyW52rjQuVcv9oLOEvmH6u5gq8ai4AaI2C2kcwSy
	 JWH81ZVOcXW4Bsbwf7NIguWhb0qgzH1k7ziiQ64GkUnUAkpdUsj7cvpqNaoHzV5bqF
	 BZ3+MXIKg97WO+Y9kLVVVIbINSJo/Ejn3f3gY9ojdghCfd299hQsevH8ob48si1S51
	 EeFQaJbEcsEdO98LdXt7kvVYVxFoNqn5+fDJWLSocSSC/x3HKpSUmWPWPbb0/gtf3R
	 +Dbd4Oko38QYQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:46 +0100
Subject: [PATCH RESEND 37/83] drm/shmobile: Switch to
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
Message-Id: <20261105-drm-no-more-config-reset-v1-37-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MPnP1Fdgr/1ZHUd5Tng6g/AyYwiboeB5nV/LUg9cRvE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFrzd72Zm11LUqj9xfYvf3pJKycQPDp8f8C0I4/w5u
 VzUUUemYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExkwwzGhv5XxnsUP3Jf+7i8
 6Kjl57w5or1L96joK1pnebyLrz+i02nbvlyy0fCNaIz/kyXPIh8JMdYXhzrw16qwLA0w4Hy6c7L
 eosR7d9vMDgi/FXhZvf3xTYtHwj2hMV3VEv99fbdOsam3vA0A
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

