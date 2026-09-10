Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B06B562609;
	Thu, 10 Sep 2026 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064381; cv=none; b=XLaa9rVZpzYOXI3D3/9CbmwY3J97W76IBQzRJVRim0XssIdYXu9CvanpDYg+yx7X03yn42VdthaQKLdRDn5pb3dfYwpZzFZR8SLsOAISVyEyRA644KWsXFAwNKD9lF7jGos2HtwzbloM3E4lzmS0LjcKyx1SvOScR95RUZyF40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064381; c=relaxed/simple;
	bh=wcp6dJ2XicUTGq00EhJeNWFW6GEF4OkdbW1uJd8YOCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mr2foau36Nscn1EkLkEIyLV320X/ZhbavZ1paFmpWbg2DAZga3RpEEuvFME/qPr98pmTJwCDWchi1sE7XUXxPHGBCIE4SYgXyBR9r/IyMP1TNrAYQPr9YGvCJ5gjGgM8V4Y8PVjzdOlYhWWVff+Zi9XK+mVqKimOgu7Xbg2FaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jF6h1Ov3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FaLKWKc7; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jF6h1Ov3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FaLKWKc7"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hgmD86RyyzKvsx;
	Thu, 10 Sep 2026 20:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789064376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnIyyiiW8hyuF7yK+Uh5/mSozW6Rqs+LJznv/lnCqNA=;
	b=jF6h1Ov3dUJNTsiq0rxgJD1D3DFak31BzEZjq3Nsq0j+v3xJLCeD7ksTbqfYkEdPa2JeLL
	gQHU43IF/N4b3T+8+6p9caKEzTYi2KkQMU0FTH2bYUPER+EhATCwBnO1fgAgoNDJfhAKEO
	xlUtfCXQJAoC+ehveSwWXMlBbvk7x/74g+zYLnKD7KSRPa4p5fD+0CpiAZIMgCMG8HWsYA
	sXFIuYk3ELgcxuYXUZR51tVzpuS/CYRL+00Jom+ulu1+NNkCwLu1/OOlbZjl3yDrh8MsR9
	lyk97NB547dme3kqnFP4fm1hMrUAp7FJ0MVx7EfyIRCQ1KngIM+zOM73fgF/OQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789064375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnIyyiiW8hyuF7yK+Uh5/mSozW6Rqs+LJznv/lnCqNA=;
	b=FaLKWKc72I8uSpIrGmbL8yF3q5h6KZgWp0624WKhga/ildKN6QpMhKrqeFf0hv2dDMeJcv
	wiGm/XSyrcrf/oxL70v9RyYyqbEiLFhnjr9ut4BPiYLcM6sEBkgFGQjzLnDyhEr5ZIqhJb
	xz2eN35jDDKkaegCgSxZBy7u+tDqDYNfKF34wpKqsKx2+o5W2mtQeEwTi2HyzGGxfyqNSH
	qkEky0LNnxdr7BrRXttXdnDMukxdVWAc06CX1XVtrBrC6EI8KjRlUXzS+ZmhNtV3QcOk3p
	pPoiFK3H57r0NTRGYzwems2v+yP9mVblHMcDvr5E0vaHsLstv4MmEKYqgs5ueQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/4] drm/panel: ilitek-ili9882t: Set prepare_prev_first
Date: Thu, 10 Sep 2026 20:18:44 +0200
Message-ID: <20260910181918.31551-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: zhgdtns599n4b7g7cnto4dd4rhken6f6
X-MBO-RS-ID: 60e6832b1607b446d57

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
V2: Add RB from Neil
V3: No change
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 69f6427bb4ffb..862b1c81a609b 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -808,6 +808,7 @@ static int ili9882t_add(struct ili9882t *ili)
 
 	ili->base.funcs = &ili9882t_funcs;
 	ili->base.dev = &ili->dsi->dev;
+	ili->base.prepare_prev_first = true;
 
 	return devm_drm_panel_add(dev, &ili->base);
 }
-- 
2.53.0

