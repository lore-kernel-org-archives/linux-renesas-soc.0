Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433896;
	b=XntbqgfCo1y5bMFleg0bGA0IF5QN3gpJ3ElSpPgoDn3g/keziavgAx5GwXkgZtvKtOFc
	 TEbYHaJUCusSVGxWtRqibpEHRmpzisaSPpViFz2lVYkPZWrPF5taklW4q3k3rnYEOhARl
	 4Z0aEMvmtAMq4m/iBEOMtqUCLGX5gdf6r1Dz2JMIljyCVqgh2lIuoXbxDcvZIgJPlsQxU
	 hiuN5xSmZ+NL4tlg0Bh6QPt7PbFJzg2GiVRtGHEHse2LiEcSILuKW17XiK0EYZBOwac99
	 NEfbwhmeEDItj9FKHlMxCSe6Ee1i7Xg/7FSEgOJ37HF1zXBEo7Exqr81mYgJxYu0nMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NxNZWpxJZ312FfsXfTrSW/vQmMkh0MVWaFRbIlwW5IE=;
	b=MNT/CK3phYROZGUgq8QHCh3cTsTj/AdZbZlaQVH/k31yJmJW/Nlrc6spft9IFmilxI1S
	 xb36xj+sfF7IJETnUAM4u6LnF1el+/As8uWjJOuC0ErtbCaKW9ZsOe0LDeu/IMZ0ZG8UZ
	 5EdO6Xa4KGny3G1OlgHT4lMvOndnVk+vGekd6HwW5v1c+CbSC1AYEIdfv2PwAKnNXJUHq
	 F6nNy7Frrc4jUBxfYnPD6iLErJLkRWMPP8UAahxFj1W+3bZNcxa/ZOx2Gdmk1lm0Hl5Iu
	 JRWztcmciPKBPOlOK4XMFjmsyD/2eQmO7bsQo85jvP61HrE6/x1A7ty9yycX7pEPmNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fG+IFkil;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DF606A31E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 11:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 827DF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fG+IFkil
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so2241353b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Nov 2026 03:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795433896; x=1796038696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NxNZWpxJZ312FfsXfTrSW/vQmMkh0MVWaFRbIlwW5IE=;
        b=fG+IFkilVhSgMPY3zBEvk6ihKTl85EQl2ZoU6FNnB0nVWZwBnAgAbYWJUcSoAIYQoe
         sJHnIIj1eR2NNGVfRtmEOun93SG+SblUh8Y1Ukgzv0LnkSKOSC9mzRonEUq/T+atLWFb
         uOH077SZIKELKZDDTxL1JoWNR8oXur5dYHv70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433896; x=1796038696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NxNZWpxJZ312FfsXfTrSW/vQmMkh0MVWaFRbIlwW5IE=;
        b=zCPkMG+sVgqgjk4khEwF5BGmWv2x4/6EmP/KdTukG2HuIP9Y1fAJMzbZpxWzGSmtEf
         7TDgmDL8jegrbeAsHEi0msMQoj1M0AN+vur9xJxSVUiNuP8yDduu8PHaJVm7UHcyTxGO
         KMs+AV1bCwNeOJQoQoq325KXk353hBypbMQB2CU628TCrR0XH/+FIrf4PzFWIuzq0REP
         fbCKKhKrWxrMuJo97NWzagx/qtX9KbmF3JeYH+E0W/1SOOQVhhDPxDIVkSDYzeA54KaB
         WU6H/zWNUwWvCrK6So4uCSGp+s7hnact1EZDTrIS774xX5ma9FdNwbZF6Q5N3SGqk4UX
         QrDA==
X-Forwarded-Encrypted: i=1; AL+hErGCzdbNh7CYfvd0UnC7NFuMu8g3vdjxDlFM1prlMG/5TLGHcJfKVv1eRGNUivObx48CTgfatPti34GV885TimgQVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9U4O9o3B56fSZDGJSRnLLAIm4o5rKaW5vwsaIbAY3Kc2C+B0QC
	niWveP5axCjQm0SJ5p1ctpbgtHK1yXcB+fZYRlgWmC0PvEB2r4NM8xWHElTru36Q/w==
X-Gm-Gg: AZFdTZeGUKllNk3MEWAhPMdRcCFFD2jsqyzd49zGHH9YOPhU1EH6O1/3s6vxJVlndlZ
	vnDKSTt086BmtkBuOsk4ZThfMsWhdybK5u0KU810ORDC+qmIoy5V7LJ4E5cahNmiOUgANFppw1o
	hGvPCnEUyxJwA30VQO4geGyhdsCCFUMWy8vZbioQ0Y76Lgmn/NG3ntTPpotNm6VxQk0wETJTMpy
	+gtYD62BUBC+sAUBTatuYyYIErtJxP6p4u/ojnO7X8QbkNBfkkZkA9BPjSIaau2L9JwVSa5uscP
	CsYvp94c8FtrQMBetVcoTvxaE9Dirw+AHhQltE5rnpXIWLZN4ZkY/3z/qUf89xlYfwlZH9TSn0B
	Pk7ghqFHzykzfd0tbRO+cEBVoRY1bxb6EE2/3FQvj2UpTiO0vSau2AjLLuRuvl36GJQRX9QI8Z0
	a8my6iRnHNsAp7k04MGcI3z3+MGW6ybolrk1V2drnuRSaMZ4l2fcXGH/DSIsVv5S4ZtfIXMYoFw
	IUC5rLlEs7PwGXb9Rf1DsAdP3PgR8yVaKfKMS5W3Aj5ylSHrnqABqL1Sr6tCnTEIvM1JMk1jNod
	Fq0Zqb2mHB+wfvmMDEOOy6qOC4KBd3B4UFoKGr4hJ4ifqBvZmF9s28mP80Qy
X-Received: by 2002:a05:6a20:748b:b0:3f8:c7b1:688b with SMTP id adf61e73a8af0-4014d4579b7mr11406956637.34.1795433896023;
        Mon, 23 Nov 2026 03:38:16 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:ceb5:5e59:832f:d16b])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde6cea770asm5097982a12.3.2026.11.23.03.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:38:15 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] iio: adc: rzt2h: depend on POWER_SEQUENCING instead of selecting it
Date: Mon, 23 Nov 2026 19:37:54 +0800
Message-ID: <20261123113755.3033436-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123113755.3033436-1-wenst@chromium.org>
References: <20261123113755.3033436-1-wenst@chromium.org>
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

Commit bdfc454e8567 ("iio: adc: rzt2h: Add support for RZ/V2H(P) SoC")
recently added usage of the power sequencing API to the rzt2h_adc
driver, and directly selects POWER_SEQUENCING.

This new Kconfig select causes a recursive dependency when combined with
the in-flight power sequencing integration into the USB core:

	error: recursive dependency detected!
		symbol USB depends on POWER_SEQUENCING
		symbol POWER_SEQUENCING is selected by RZT2H_ADC
		symbol RZT2H_ADC depends on IIO
		symbol IIO is implied by HID_MCP2221
		symbol HID_MCP2221 depends on USB_HID
		symbol USB_HID depends on USB

Power sequencing is not needed for RZ/T2H and RZ/N2H, whereas RZ/V2H(P)
and RZ/V2N do need it. But it is not a strict build time requirement
for the driver. Change it to an optional depends on.

This also requires a change to the pwrseq stub functions so that the
pwrseq_{enable,disable}() calls in the driver still work without a
power sequencing descriptor with POWER_SEQUENCING=n.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 1d6ed49041ab..7874d0e78e9e 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1631,7 +1631,7 @@ config RZT2H_ADC
 	select IIO_ADC_HELPER
 	select IIO_BUFFER
 	select IIO_KFIFO_BUF
-	select POWER_SEQUENCING
+	depends on POWER_SEQUENCING if POWER_SEQUENCING
 	help
 	  Say yes here to build support for the ADC found in Renesas SoCs:
 	  - RZ/N2H
-- 
2.56.1.831.g720f3f5937-goog

