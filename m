Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8707234E743
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901937; cv=none; b=Dddiy12hjgkwAjqFmrJbd5dJJmQKEH2IkYaRqsjX37vUtBM5uyqo986Ptnz3QozW0Fd5RCB9ceLQmYaS6cctWnG+XnaUpWoMXnLSLVtaT8/kDaLIncJCYj6o58eG0cQSI/IrKjhqqyheqwaCuFyCPIbYBWdG0IbaAwi3CzBYlK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901937; c=relaxed/simple;
	bh=39pViTfWHlRI1L8NZdBLO9eYcuF2nnFsnTqF2Ujsqxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ft2HH+m7oUBgWK0Xfh9nIvZcjA9h7S1GPtVIWiRRuOLSRP6jHBSVz2cVdMijnmqRC5IQpqPZbreK6eALOW3LIiBuPXxNXb0a9re35xTx3/1sKTrpbAcJy9JQQCbCDqtr/Z3AqsXz87ITSCu/a2En0IqLt/YCkTTeq+b6LCzg1BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNTpC9bK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNTpC9bK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b41b545d9so597784f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 23:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773901934; x=1774506734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ9NiSIiQ1WJu3u1uHUgooQ8ToYMfuDrih6eaFZM5jk=;
        b=eNTpC9bK4Kh/typ8WlPpzY5i0jpMzXtD++ubBqvnreuoUSwIkcFdvnpE+0Ew39eVcl
         b4CcJTxgGpZMKlgKQIot69mJqp9OL+Ut7nY4Fnxk7IShkTVNcpqABpoX50OvOkfvHZlE
         NQjKVng71pAXsmzHcePX0fMHQOeuBJ0/7z4CbKd67ByM+gSqgIHyKKZ5ZSWS7ZD5Ns0v
         vjxlNigGAjSiI3oHau/YTmC7anRJCRcD3E9VVy2h5xT58cH56ZdzaEdxsDWEdCzLn/ZM
         tRrPp98lrbNcgzIZY2Lvk/WEOZDgI9wFxLoLrXupQ876aYT/D/rLnPFGOdqizZsa1R98
         TiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901934; x=1774506734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJ9NiSIiQ1WJu3u1uHUgooQ8ToYMfuDrih6eaFZM5jk=;
        b=WaJO80luXKdJieebp0Ah5Yunbw77Yc+fIda3XulXccKdfYJZN/HnVWD02BsxXCPbm8
         iHOipm40zP/8/XYOkow05ezv/O2XrV2O5Dz05FrhSyX/zVo3vVbmjgMGigiBmJv3T9qp
         qzhw6xu/v6QycoTUQ/70h/8Gua3Z+AYQ5FEHw7GdFfF6+YNpbPbyz/h7qcNJUqbWMoXO
         GUljryQ2XrXvZE4Eszh6rcsb8so+hLer7eI5EseJ9ExsuYALnvame9B+z2v7w1e2nh/Q
         PmFoRQDg1Iqacg6VsbuB/bHcKOnU//Wv6/6p0XSMK6UoUidyQHDL0cnCLWIt2h1tPlO4
         AKdg==
X-Forwarded-Encrypted: i=1; AJvYcCWipy9whU/Cx5Mi4ssZegTUeRX1ktyaQR+Z2dK/UlPGqFCf3AHwNh6UtP8bvnabd8ekC4h/y7OH6W3cHSMV9YQaDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZGH6oBVNyE/lRqpXCqY2TYw1nQ3uCF6xsZ0UwJRKjCg5BdLM
	irohfjuizfPn5P2GzxegpSVkvt51HTtg+KtpcSbUVd2qvFi9qcamMPIu
X-Gm-Gg: ATEYQzwLESHa9HEi2AJHcaLf2y8IPfaXlZfeUazAZ2lK2MMrr6NUD9ndUjYfMifGBFy
	L7Cxyh81bg4+Lg3pE0pCa7rv16fyvFQ16z/xPuMk+umVaMEybNxfcR9jXrVM/E9Jb3LVYoWqtMe
	QjRdwyAzTEU7VyL1e8XQviYPSqrXhWWT7L7/UoGcr0iullAWIZO99O0LTh1EQeuSWE2/L2kxi6t
	+qj5Tz2L7KVbXL2qWHYw0Rw+vIT1zNr/MC0LpLER9YHMsO+e6Y0pqtS5lDxj6srhq5pD5Dn/Et0
	bb4UjhqmCtfFLO2drLSTjlvt4iu72c5aUVImoWDuFWuzQxtm8E5AEIe0JYxXdDl7AC5x/q9W4gy
	R9zFt50bZsM2rJhYAiiveEWqEvH1/7ZMFnSGiW/HhJz08rQPgA9hJfySEH68pQtKL2SNw6m5Ytn
	9Xy5sNvCaEVAWqAMLcK7pcaFxE/evPv1U=
X-Received: by 2002:a5d:5d85:0:b0:43b:4a2c:ff4 with SMTP id ffacd0b85a97d-43b527c40a9mr10603805f8f.33.1773901933594;
        Wed, 18 Mar 2026 23:32:13 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189971asm13554499f8f.30.2026.03.18.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:32:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@nabladev.com>
Subject: [PATCH v2] phy: renesas: phy-rzg3e-usb3: Fix malformed MODULE_AUTHOR string
Date: Thu, 19 Mar 2026 06:32:07 +0000
Message-ID: <20260319063211.5056-1-biju.das.jz@bp.renesas.com>
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
Closes: https://lore.kernel.org/all/abp4KprlYyU+jMPu@duo.ucw.cz/
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated lore link to make it shorter
 * Collected tag
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

