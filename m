Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F201396D1B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835269; cv=none; b=H1yOdoWFCMdtMcAVyA6dBkvZ1+0QJmGk7yTnlyI9NnTGZSz1ryZrabzgVZzFb21dTIuo7q+NYv65LuMdYpUv23aivJMI/KsTmTzTNTVdQxtra4rkHwBi4MF0JRni928F3NpY17krstci0E40OOLEGqvEyiJtH8eubd9trQxNMvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835269; c=relaxed/simple;
	bh=TDFRMbPmfIwRGRoxTCZK9I4Aq1zr+jI91ACQL4w7F+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W2LDzLLmAcLF1D0J7rHa19sfXD05hRVX8ywnTePG1Q3V9NqJ1Y8fWwKINkfuphx0Gbjs2Zy+zOJdj0dyIbuA1IK/EzcUbwLxs/a+jPIT3o6Es/0Hk/bh1sUPnzvu70QZZGswG2d+j3fDgeKiW+gIuQwryCbmfWD4kqwovj1Pisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFysop37; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFysop37"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b9b190easo4949791f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773835265; x=1774440065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZAj4fK5iSCV83/aQZvDuyGn6EJB/MCw9INg+1MusCE=;
        b=YFysop37TnNS3P/5V82mRngUnJ1E1tdC4paR4VZPEUXpOojbrhTsEsGmoE9yCGgTZE
         u/nIUCzwtGNb32L2JuZWwzN0gCZdn2ZnOXNWhBtW9MBkyE4vuCSMr8GwEn3UvukPUrJQ
         mNANOLXaUy4QFqGfpBR4eOiRjCPcmsyIlqJV9lmvMQd6jC5SCDo3cWmN5YOzd3ahwF1K
         1mg5m3AHWnng92tw6zUfxJAc12fCk9Ospcjmv/G/ts+TCe41V6kaELHb1rTqY9rYhkQl
         r/x/y8nQwrwYHcXEirXGx+us/s85l4IJ92qQW+7iczR5miQ5CSDpxvM3/PU5iHlVUFCT
         ymUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835265; x=1774440065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZAj4fK5iSCV83/aQZvDuyGn6EJB/MCw9INg+1MusCE=;
        b=LUQdJH4/vZJHS0XQvCpZ/Raxx1MEzybkM8n1Cl1NTCeeP4Yst/ISWxy2wPoxxh/A6o
         8RhbQP5aZp/dW18SWi9OteLoQNM05yE5GcrUeAB/oh4i1AZAqlSZHzxueExiVDui0y6M
         Ro/N3rXwePcvEIZp0qljSBU7nGHXmZ/fHesVipsvJelgO2QvGmbZAIxnQQGd1+KzeiNz
         yDWL5jHHUPNIPDhTLqcx138Ef68swJmdYoy75c214hI1Wy5PBhv7vab0PE4wGkxfpQ8V
         0ahpkzs3LKAH4wPmTCa+si2opwC17m8tqo8rlVB9z2rJmjZLdx/tY4H5TNoq/TjXuyfs
         zR7g==
X-Forwarded-Encrypted: i=1; AJvYcCUKPyyFtUN+Yiny9eMxgzRtbhcg9y6qQdg54IMcTapP5+A4xqHwtN8KZPaFARfX7DDhDQ+u+LRt0IYK17rp2kkCRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzgeSt4b7QWa/TSCiZvwmXD9wMhmKlMSE6zEdTjyX/m8JtqiEK
	C009HFCXfzM3dm+tgxas7Ud90D4U5ErWkri3OAlPqXZVdgeAa3+bJCpm
X-Gm-Gg: ATEYQzzgWWuiCl2RKkx6DbTWAzvOto6zTBJ3mLJkw6k1dSdUuiNinwekJC5RMFyWVf3
	TyIHjCzws0CToiqMic1in0nWD7j8tVg6P92mUDySzbl9ANN1CdofHM3L/pM7wSVy+Vd4uoUnuMm
	qLzygRLxyyM4mO3kCBJqP31269LZv739XZV6Ps/vFT0aHkhNo7buj2v2FLR8ZZbVFOcFwGGvgED
	pxfBdtkNtYTgSI/VSySdGTSoV3uQJ5gFqk0vZM7+Vos3DJw52LZNLUap9UHT+WoYA6D35ylkp5Z
	xXf3qrF8gk4utxQefMa/CyW87V9SiAXQJGHuDNeVqhWrlWrgwSEuyNFwaTVnLbbJSdQYHbPBvVD
	VyWVyR0SjSwexJP57M+3u5LlWQRxfJ5CfDMU+6F/aCq/sAJ5vHPhRAEWDont5uE3Y0QYNBfVfgu
	sbwL9WI7ujiUK5DTXZTnP8GufBYXAZojKFQqj/eV84EhGMDo/0
X-Received: by 2002:a05:6000:2381:b0:43b:48e3:fbee with SMTP id ffacd0b85a97d-43b527c7b5dmr4745860f8f.37.1773835265018;
        Wed, 18 Mar 2026 05:01:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm7849309f8f.21.2026.03.18.05.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:01:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@nabladev.com>
Subject: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix malformed MODULE_AUTHOR string
Date: Wed, 18 Mar 2026 12:00:45 +0000
Message-ID: <20260318120102.226118-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the RZ/G3E USB3.0 PHY driver where
the author's name and opening angle bracket were missing, leaving only the
email address with a stray closing >. Correct it to the standard Name
<email> format.

Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/cip-dev/abp4Y2FVspUgEpCT@duo.ucw.cz/T/#ma80454df129c8cfcbe48d75f3b4abe697925c6f8
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/phy/renesas/phy-rzg3e-usb3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
index 6b3453ea0004..030c600a53e6 100644
--- a/drivers/phy/renesas/phy-rzg3e-usb3.c
+++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
@@ -256,4 +256,4 @@ module_platform_driver(rzg3e_phy_usb3_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Renesas RZ/G3E USB3.0 PHY Driver");
-MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
-- 
2.43.0

