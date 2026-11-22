Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369473;
	b=wRcLtRAjGsp/417bz+J3S7bTY4c1XvdwDKhf9Vyw48TQi2z2j2u8PpaBtV5G4zgA28Qw
	 Bx0VLV0FZxnjQU5RFsDWoOpQ1TWSrZ2co03la34G+RribKsY4S+bL5erhstXTQVdXxcFy
	 n+XQWr1zwcyFKkmNGnh24F/DW6gTZdkIozlPsYt7uRfDA4XzkUumCiHf5j6s1BaFm9xtG
	 FbHFH9RxTifTsEtMhgGxmj+eM3Ev4AtWUPlGjI2d4AuKRQ5XLjCxEmkQ4Cd7V0Jb7+8kc
	 euwqSFeKRv2u3kVet+KgDMQAYOZDAniYYTZSzA817D+UHZUE9KmZ7EKkpkiZTHM2isA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
	b=NPJPqpKEGqJ0bkbevcce0R8LRIuIKZc1GjP+XEJVTmiqwX9k5LQ36ApCyHjtNmTa1vle
	 yomU3rZwBsno9NYATDrO67N9bz8Bo9xvFDjXGypYId4GcAgtO+yGgO/KLng7hPb7//En+
	 ZR1N4D6f1Xtgg2VqLm1Ci0NkjY8HWS9iCeYCd/jBDQSNmJ/jXsdeoNu1mWAYUsV3Oldgi
	 cDz7vE6TSDommHsJhqUs8lPQ/evZvtU9HRh0ke47Zlpb0POTsdUMYCBDOekavlKFtL6bn
	 JLO0RB78TDD0wBh+zEJz/Jx0gEvubTQ30LDrvqlibg1eYp42kXm5yE61MaGXZitzf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLeiBumj;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C5606A69D
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Nov 2026 17:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779C5606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLeiBumj
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1252886a12.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Nov 2026 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369472; x=1795974272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
        b=rLeiBumjk8TQGxJxb12x1jOoBNcpTTZuMgD5FoSJfFUr1x8u3IcRvBDV2aKGQ+EWLj
         CWgtnCaNl1IQzgFGpJEZ7w1GuGVfo/XjnJkSQgtGBwdSGwTvGx5PngJq4I8AohwPDdgQ
         ZdLAJ3Wic+Yl3yqokWFgkZeYNK9Qyh2I1AQ9GMJHWn/KC/BFELg9DvZ1elIhDEdJTEhm
         Bab8jDUt7R5Qtbk1LcHHuhzgnxIB7BDPwCH/ZYzkh/Xq1WZ38U2f/xBeqrcdrd+BhWta
         30U6TAWHv6yfzN2NTLWK6vRrIwNt3Nm2ydXoTmPbMgpOvOo40VaErfViSOU/JMbmEqmh
         N57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369472; x=1795974272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
        b=zhMrkpstDCEd9a5gzhtSoRCvOnv46u8mkBZFGcnXgotIIvP32wPiqaSuB+/P667tWA
         mvuoYKd9XJgW7IJB2IAPZ5v/35pmC8XYHgvE66y9Lo4YYdN8/QiTVfXyBq/eD7zjKeaq
         rN1evF8VNiqxz4v+Jdr0NUxTbdX2f7m9tp+QTXuXd9fZQRp8tVGgBP3ot1uNMDAliRBx
         vST0hEfpHgBEa3Vs743tAx4yiB/vae+TSSuySkhAdfw2GXXnEJF1JfjoL6Qo3ZEbZmDB
         d1MhL7Lu6/Ahwhi5VuFbL6TDB8j6t2RPs8K2UUzNZHujvbzq8U9BW/Wmrp6tBKDzyVke
         debw==
X-Forwarded-Encrypted: i=1; AL+hErHTpuAfffiKiSSLzKsl3vSlRn9cmgtwfP94rVewsEKA5FI+A+C9iJQMm6b3o9ILOOd6HVjdbnI9P75c5c65q+IC1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ii4T4nsh4OzPEiAQ+yvJzTWhPTXHD86kscquT4gvmaYEs/42Y
	nm645Pa+Crr09wAellnCFc85MHoD934p5agRbxiuH6Ml6PoTbVEOJRVe
X-Gm-Gg: AZFdTZdAUSADg1v2iYcaEMCBfEtTOvf6fMGYC7l+bY17ekLnfS4TMyVKiskqbNHheqL
	mHFURWS7yEX1XKVXZXpNEypmNqR1QV2qROLK5VQOzYvHgUa6bw1h9ICMlra1ftapoJRn0N0wEhZ
	pKf8/gQTrmK7+AGIB9/Bt+kqtSnvZwEocLscAfdIP4uprHCKhDqWRqP3BsmEyu4L2THwFRgw7ZE
	QRfLTMVFM0DIr8m3cY/drMrM5LsUzrCMsiS2zLxb1xCGn9ORIB22BujsHEkEjZYsdt/kBbOGnKH
	+apZ7VBQOQSL1AQWNKGtRRofZXmMo92+208feblRTCattTnB0YgWqkMkrlSRo26awf1lTUXmtSR
	H6n/vkdLMcQWZXUGIuc/q5UhDvGPHDIvzrpnBPKtPGMOBz1kmPmpTBw71eSy8NlDH8F+tL4/El3
	2kXy6vQYDGV30YJ7FViWDp2LUW9eR54kHBwB/lOgeTJGVSgk+3LzYL5O2unwZT70d8tpthSho4G
	2DyRxih1bhXhKMRPhOYpil0vnqWWh1SlvEtTNTOVV3K0HxGPSYa3oLYIXOijvDXG0HbDjQC3E7d
	gyomf36Sg5HAKRPOl8Jh/LkstDEoD8Vi9cfLYfCBIQkX497qQVTcvTSGSDsUEeqb/2tlEHWK
X-Received: by 2002:a05:6a20:a106:b0:3fa:53f1:abf2 with SMTP id adf61e73a8af0-4014de5db77mr6772027637.29.1795369471685;
        Sun, 22 Nov 2026 09:44:31 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm4060108b3a.21.2026.11.22.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:44:31 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: geert+renesas@glider.be
Cc: linusw@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] pinctrl: renesas: fix typo in RZ/A1 driver description
Date: Sun, 22 Nov 2026 11:44:27 -0600
Message-ID: <20261122174427.276446-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "Renesas" in the RZ/A1 pin
controller driver's module description.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 07afa4b3abae..7a2ea8add139 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1401,4 +1401,4 @@ static int __init rza1_pinctrl_init(void)
 core_initcall(rza1_pinctrl_init);
 
 MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
-MODULE_DESCRIPTION("Pin and gpio controller driver for Reneas RZ/A1 SoC");
+MODULE_DESCRIPTION("Pin and gpio controller driver for Renesas RZ/A1 SoC");
-- 
2.56.1

