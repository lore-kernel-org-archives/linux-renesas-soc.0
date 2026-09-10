Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73631577E24;
	Thu, 10 Sep 2026 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789064383; cv=none; b=Ya3z40uX+hux7ynB3nhA1nXQnfzjTcI8aoYsMbkBCO2MQBzG16jaZIBVRPBga5TrFgjQr58iaQGFmrZScyIY/ProxsgqCNSVSsl3abNLDCFHGX5t+d1jKoMgrlej2kclXdPS2KT1WaUxoAHU+zOq8zNLDEEGzlGXnkhd9lMXJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789064383; c=relaxed/simple;
	bh=E/N/FPYb0ESF2MzDDlGsP7anFnIhLFEQyOUqsNQfPpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HauUShtdFCsxNsApFvDLBtcWWRX8PSVdAjs720C69aC28XreXAO5cco3mMRI8tI8yCpfjQ7E5XvwEVHuRzWmWRVpmDhVp8HGdMEQYNsNEUBUvHZvROw+4X/7rERAs2X7pY3WIciWem4axgE5/le9jLtc72+YtI4WMSpp9bb4+v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IcTs6KIp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xxm1W8QU; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IcTs6KIp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xxm1W8QU"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hgmD51kjgzMlDL;
	Thu, 10 Sep 2026 20:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789064373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cukDQ4/AqWL0h0kNx0qHDmUUrqvz77O8kkFgMAMMjhM=;
	b=IcTs6KIpbwR+cTRh4kuZTVJBfPZGPQfhO2aWxBwlLLaPQsXfv0aVEwxMLlux4odMhiY7Oa
	onHKRJUY6CRqZofcNvvwYSdEoMfwMkafGP0izjQzDqo0VkZBgfMvQ3kMOWZCJs3S7epg9g
	AMglvZGIEjILoJLJZCreoYr4eKfQqbX4sTfSBMrnEv6CkX9k1DyCP+Gpmph/7FmG4f5OVl
	R23HhdRdx72aIupghMrAUcbASH1AdkCNfftJ+QBLR8Xunq/2zBlBN6xWP6djgW5HCyCrwJ
	jcuaZD8d3qg8gfSq/RdHjE9IY42uTgEFR2qRGNUh0JE4pfq59e+FWRBxmlfbMw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789064371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cukDQ4/AqWL0h0kNx0qHDmUUrqvz77O8kkFgMAMMjhM=;
	b=xxm1W8QU2Vb9HlOEHPudOEGX4TYOMslLZI13qJmJPMMwVgiuYwwLcGWEfPwaRNTSuaECHQ
	7/Dsv5Qux5Je7Lp6MrEEOO298bF7pMSBIrL+9RWLqaMVbDQQQPa0Zjmp4ERzlMMGIArXwG
	H8w/bPEejrYwAcypJTrhQcg6+EshgrT4GNG0P5JJr2jqMewD6fKdjNt8HwmS9qT2ibTTxA
	SOjpAkgO3l1vQ8FQRBpA5kKyWNW8i6X6qwESt2BpJk0ZPlS0POMAtRFUmFeJqR7i7Q9ZMn
	yLcLKUwp9j4o3Ih7o7UtANJvDy7zJYmdQdlRK1aCkWYkZ/oiM9ptZr0UqoP/eg==
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
Subject: [PATCH v3 2/4] drm/panel: ilitek-ili9882t: Make enable GPIO optional
Date: Thu, 10 Sep 2026 20:18:43 +0200
Message-ID: <20260910181918.31551-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
References: <20260910181918.31551-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9wp15hx7g4kqt4h4fs99c4fynhxo1acd
X-MBO-RS-ID: 1c15d22bab3bd4a4aa1

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
V3: No change
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index d4b383138488a..69f6427bb4ffb 100644
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

