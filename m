Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F138B15B;
	Thu, 20 Aug 2026 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252123; cv=none; b=YNVpfaC4yaLZxCvycZv7eHRCwujzidGLpAIEr86Uvuogq4EkED9Kk6KKpIbNZsxNCTCYHh7OXRExGEA+pw24rv4sRRPXabX4NEBHQYYE/pH6sLrW8c5fg2TVx/VVXox+cuzjEQHCE6WFeM81O7QUUouUwUxT5Z7A7Gox9mFVYZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252123; c=relaxed/simple;
	bh=UzRqzY+ExufpCR0dFJuPS3KkCJVhU//xNMfNJrsHVAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeYvrZOa6UMCr9V8KDmUwYaA86LHf9bMWWIRz+BSDq6V/SY7bC5WSkeL8PdLGwn0JJpQYVoSMljpmTOzqzjLdzflQKvYEfBPOjzkFa/kTUdpLvEkvlntgOrR8EV6neXyX2HsNZwRZWf024wYrkjMp0wQYfHVbMmOD/bcHxuJ7zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eQjG+YlQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ev4FQgVo; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eQjG+YlQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ev4FQgVo"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hQt134G84zMlMg;
	Thu, 20 Aug 2026 20:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787252119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+reXiT0rzt8xFZCHO3NQA98KDPjLx1lxQFhP2j3CQpM=;
	b=eQjG+YlQ8VFXlFQ9+Z+E5lmPEYnseEwyzv9F7l7R8LINu6duvrnnfGD3TsjBLFPd7A7e/J
	wL0/q8VJp/OfervnzBgm9qzhb48RuvFvAav+F3a0JqoWI48+7D6tbrNaAK1ZqQGY+NXWL4
	pxaE9OFEKda88eA/xD1+vpWwW/0mVam+OKVWkM9hiEx4ZeGqgDgvfAK8aWvBTsZFFum6Og
	DYf/5z/ENTz1KecKGYXV87IQ1hPbjRLfaJmDzNOazBJVrEE6c8swUuOa2WpfYRdWKLB9B+
	g+7NOGEOLe+iHjfpp7alx1LoKHGDy5QBHnLhKnyAKmIMioyFJuK8NvQfX3ebOA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787252118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+reXiT0rzt8xFZCHO3NQA98KDPjLx1lxQFhP2j3CQpM=;
	b=ev4FQgVou4TLp+JgC5kXO89ajabHCNDbMNS1nAq5/YasZsWWoWM6gi0vS4YG0Gbz4BqCUP
	OkO9vicAmICU3W4BQoFoM9te008xf+5ZAiLx8oZuUnwAD17s62eDZfDOfGZpmg8xVxfV2T
	2COImbBmbM7s5UoEkHGMShsJRJLLaNu9AJqKggT7+51DG4UC7tNI5E80VuedBJAAhAFr8y
	Idw3GGtgfyD7BE5B1AIx/I4hfMW3U4DhFT7yRqr2rSW/qtRd16KpyeZ6UyvD4C5Um4Or6S
	1mRO/9kBE0B9c6bcTBpcyXhi5wA+jZf3RCb8zsJrs3d2IAtMPzfC6jZ9b9vRHg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 2/4] drm/panel: ilitek-ili9882t: Make enable GPIO optional
Date: Thu, 20 Aug 2026 20:54:28 +0200
Message-ID: <20260820185506.84448-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260820185506.84448-1-marek.vasut+renesas@mailbox.org>
References: <20260820185506.84448-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 757953177c18bbc0a00
X-MBO-RS-META: 7ktnfkayybq9f4rma8yiupcbgho8an7w

The enable GPIO may not be accessible on the panel, make it optional.
This is the case on 10" Raspberry Pi Touch Display 2.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 6d07fe901357e..219d048cb883f 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -787,7 +787,7 @@ static int ili9882t_add(struct ili9882t *ili)
 	if (IS_ERR(ili->pp1800))
 		return PTR_ERR(ili->pp1800);
 
-	ili->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	ili->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(ili->enable_gpio)) {
 		dev_err(dev, "cannot get enable-gpios %ld\n",
 			PTR_ERR(ili->enable_gpio));
-- 
2.53.0

