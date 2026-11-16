Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818679;
	b=XTA1FuRW4VNF1jmE0sNNhlHBdOpMO8N6tyoRrQPAARsAkonSGK7EEn5EbhgthmtOYmWz
	 VwIzKWRe0VV6FfqQqvJoM6+PIe9kFdNlyNcbj/7M7JJZ93T8J/O+vnYl6xvJp+II29224
	 lTi3bDHOWUo9pb0Z/1BAcA3V9Kd/9fRqel0itSKoW4psL+M78CTb03FLMm1Tgz2JRnfFE
	 yZeMvi3LXl48rTDPhNNs2SNna/wsnHACW6KXkYt1KDTFoYAfriXSxhsvbGRi9RzHRN82O
	 39hNVRORz/BIe1Ayrzxb9P5sKGBTSC3lcXnhYdRe6ugCReiuVSm5EaOfAlh4mNqITUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K49lvORwZ3tfWzLK8WxEv6Dacr/ISoujBAt+GhYFFrE=;
	b=zaYiymKnjW9is8xzqokEzMRfmjHF9lPeiQC2ldSqLexMkkhfdieC9O4cUNyWl183eWcO
	 kBdM1TjpOmMgTsQLeu26/RfEUx4/37VuD1QNeYMG4gEV10yRCey93LZijay0PAIxmlkAV
	 cgZRMwVPAJqSrBmF2ZA94WIOYPDsdnOIVpdTubaHeCkvhKH3poL+paJjZkDtjgD8W4H45
	 46Hi0cTSWBDFI2CA79bOWiQBTevIRjCkDwX9NfLsrFUUtYcLfITXB8rb5b07tQ9Y00Uhg
	 lrQQ55jiTYvKHbjiLTjUqfOigsHDnU+WFyJDmG7RmhFSlnFijHxUdVjAesve0z/cXUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7bmb6Zy;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A69606A323
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 08:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A69606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7bmb6Zy
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ccca948203aso1380351a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 00:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818678; x=1795423478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K49lvORwZ3tfWzLK8WxEv6Dacr/ISoujBAt+GhYFFrE=;
        b=b7bmb6ZyPRsWwTGRTwE2A05+8O/Q7L0/p81BrFzG+oRk1IOyHpNykFwutQEmoUxtg7
         9T84xqBECJfsHrJbG6gYalRSTZ6tM3B+vxck/2M3jgVGc+Vl5FpEfBBJjEfC2UuqMmmB
         1ul8oAx4afNGI2GPFGfhhQPk8tLHUoeWWBNQRZ5KpI2fEs4xsLTh5k0LjNEyva1RXwcJ
         f0vVqmG//onwHIlUFUzu/++RutcdaEEV6xg5dU9P14FGIFx0rAN4fI7elkwrp4643Iac
         E655Q03SXJaXHenDgAB4X7uE/1DHLalRVL7aF47AWNU3T0u8PrXu2j/EUOYGEXUcqeVE
         QQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818678; x=1795423478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K49lvORwZ3tfWzLK8WxEv6Dacr/ISoujBAt+GhYFFrE=;
        b=CDgiQ8/27axpV5bjlxGQMaPK+yle2+eo7ItNtz4yDHrsNDptGPck0MasoGoUz8iyaD
         960yEZ25Xqk3E0P+uAMnujnCDGm65UhHrbGuH9eH6mrjHhjr+vlEM2woRvl5ZIMJCMXD
         vNrGheTQsO59yR5OqNXGqRhbxE/PKtyd5BCj/iZYwL9WTWQoJgNqwTKrmIxkxXZmWzeb
         OSh4kC34rI7QZ7H9IOC7zxGJAx09b0hbl5GFmHOKur6Xgc+75dvwdQLTdMDXvUg2UPwW
         YPaFAOXEeO7CkHe/C+DX3YbxxvQwXcG/nCjNtDWLOYykcybIDWwuw76ETujWxnRwoKPM
         329g==
X-Forwarded-Encrypted: i=1; AL+hErH6rcbJYzrvN2lZre1QfdOtvIYRd5uzXKrG1EN+bEdfL8GqVdyH7o/vz0HQ5k+d9kKjushqjybo7Iw6srJIXXefNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z87DzOZ6CoVFBsPzCo8OBmbomAbB4YmeLNgVXfF3YB9QhnipTw0
	PVUU9gHCOJSU3kMdz06mldb6OTPMMnYuNYGDfr37PMVyJGLmwCSZA+8X
X-Gm-Gg: AZFdTZdUUVQA9tI5r2V7H0HHAx8aJ4X6EdM8JmRMQMgdec6kLc/sdn6qAfP6Lik1YGX
	4pSoPYIAW00IiUrZOtxfOtFaBMIP5ca9ZS1yn7OjOeD2Sj5TDMo2ePkSXeIfVG5HModHkO/GRpK
	Igks+oiDoF+gsFeuW+71Iheua19aI2fqk/LcbvS7hxRdT8uVIuZp70FIpG2IoJdZy+9LhoJqA5s
	i3f+fKlB07mu1WdbWnEHc/QaoTSNwlVdUHrER1EeY++FXQ0yc8dFn4DWZrTYEysfdIy4nlSrUAa
	ykAGxJXzToCTm5wHzNKUnoXp13+GGKtUM1tS9neDVbhZ7lms9eomL+oFQre73SNBbc316my3bzV
	QsO7AGjyJ+uuMBjr2YA5kW/X5QeXVuMD8WyqCjjh82YHZhzZV6KYCLwVGGunIeinyA6q69XPBCi
	vNd1LaNkiGyQjCeD3WhJqxjiUnNhYn/KXxGk1dDjB08HbxZsNWuLrEUaBVLTr0b7LFSjbPAoc/y
	AAK4nLhsFLLDkTPCNrEEAG0WDpgVq2nKZuFkJIVywrXrj4PMFPcAFBKrd969qhNmSTqifcMqwQY
	SA3DB7ebpkt0okx+jLDNeruY26frnvJwVcs/ev7vD+J/WBytaJBKNjphKSnNbBlQpBP3
X-Received: by 2002:a17:90b:3146:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b1b0a4513emr9104781a91.34.1794818678393;
        Mon, 16 Nov 2026 00:44:38 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm20973486a91.9.2026.11.16.00.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:44:38 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>
Subject: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module autoloading
Date: Mon, 16 Nov 2026 15:44:26 +0700
Message-Id: <20261116084426.103863-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The driver can be built as a module, and Kconfig makes it a module by
default when RESET_RZG2L_USBPHY_CTRL is a module. However the driver has
neither a platform_device_id table nor a MODULE_ALIAS(), so no module
alias is generated and udev never loads it.

The device is created by the rzg2l-usbphy-ctrl reset driver with
platform_device_set_of_node_from_dev(), which marks the OF node as
reused, so the uevent carries the platform modalias
"platform:rzg2l-usb-vbus-regulator" rather than an OF one.

Without the regulator, the USB0 PHY waits forever for its vbus supply,
and the whole USB0 port stays unusable. On an RZ/G2L SMARC EVK:

  # cat /sys/kernel/debug/devices_deferred
  11c50100.usb    platform: supplier 11c50200.usb-phy not ready
  11c50000.usb    platform: supplier 11c50200.usb-phy not ready
  11c60000.usb    platform: supplier 11c50200.usb-phy not ready
  11c50200.usb-phy

Loading the module by hand makes all of them probe.

Add a platform_device_id table and export it with MODULE_DEVICE_TABLE()
so that the module is loaded automatically.

Fixes: 84fbd6198766 ("regulator: Add Renesas RZ/G2L USB VBUS regulator driver")
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/regulator/renesas-usb-vbus-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..65a58bf5ffa4 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,12 +55,19 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
+	{ .name = "rzg2l-usb-vbus-regulator" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rzg2l_usb_vbus_regulator_ids);
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
 		.name = "rzg2l-usb-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.id_table = rzg2l_usb_vbus_regulator_ids,
 };
 module_platform_driver(rzg2l_usb_vbus_regulator_driver);
 
-- 
2.25.1

