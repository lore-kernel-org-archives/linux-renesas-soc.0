Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5442F37F72E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 09:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677879; cv=none; b=EgNfeLpgKJFszdxzvOjaMNDIeot+yIR3wKqw/lGXBgY3aMEPamrm144YFRBJlfEMyRXOR9rSyzvdRXNktDPyR4g5iFc15bMrBu9jJKUip38cmTYQ4uCwtxVamsW1QpMIAEPrdfSzUikceFU8uy3Fs9sU8KdMsKLOWaf58slH1Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677879; c=relaxed/simple;
	bh=l53JAl1A5TRe2s7pqTepmBMNLndaNxM1i2f8fJ+CJTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mr7MlTblLWKWVTtGJPiOSm00HAUa9g0j6YMK9KhIcjAQHYQ3432NtXp7BLAT1Nrey740mbfWYvzXVs7rrm8mTZbwOjUWATqBTcraO2Pq0h9u6QDCA84m3vNCP3HSz934DRPz2mxXKVJ7GLen1ZzGp+taqP5BiQtax+qxhOwXQm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtpTDgsS; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtpTDgsS"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801bc32725so5188455e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 01:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769677875; x=1770282675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=NtpTDgsSJA3amImCWdi16FNcBLuT4nXqexsIOau2mz+lUE0lkUWIJg9Qg3UO65gQez
         kBI9n4JYAYb/EcpvmKBOS+I57U39vREl5P3sFGCJNVk2npi5dNyaF5RWW6L86CUxe0eR
         uc44wYMLjIhdQ7WZUr2jZaI3td9cg2VlxnXl59l1+s/RtCrkSimWCRiMUpiFqAhjJbbf
         IX0mqQWEMvYIeudyerdZmQkGMpUpKft0WeVSHSEGzYV9+mfDX7iSEV9U0GisybnvBv2u
         v7Y4SzTsxqP1ytvbA9S/UYWnRlZYxLRkG59POsWee/AWsNjX4AoeOSUtH9fZluPVNLgy
         tocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769677875; x=1770282675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt7uEiXTlV6e7nA3ca7sq5Y8eWxdpRVOenYUuxl1aik=;
        b=ix+VG1lX6h/GZEesmqm9XbVrpx8HZIpjq9Bwni3ZxqgJge6cx8keGZ7peZqYfB/n+F
         KEPRT/k6bKOn41qn2auyH5S1f5CsEQGlizkvTrvTkhR9BKLqF7RO19R3m+DtHubCg5XR
         HBAjiEB3K0hcxvFRav0vvK6yFv0meZ0dQXEUifxOVvh8o2cWuRRinFaiE3rDtJaHrDIS
         XnP0mzUadJH/A1XJg+ohqy+Ky4H78E5WFJLMkEALDjUqghW7TfXN2mXRMLgPGAfg1Cai
         9iXG2VuHTID3SljhRbsvfhwelYsM7CaItgB9HDwjuFf+oyoYfF6G+Gk5NzE8UMv1ONwM
         tXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy5sIrH0fU1EGpR+j6HAnOoovsnPYOUjqZEGzGJw9UjF0VOn8+FjO6Yh2FqcUPQTeYx9mhqLOPX3e4t9AAxvQ/3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/QyVM3/zi4wZT/EK5ojGYf27v1HKjieMvJ4TsW9Ohvqvfy8F
	GJQEUTTzbwe/ABB2IvGiMehmjiyQj+hWqqWu6uIY+l5xGftPf07rdg61
X-Gm-Gg: AZuq6aI6pIbpaD38wJGzCzpQp4sYdK9P4umcxsBt5vgmgR4Ts6YrpnWTJedoRY47HIb
	O9l6vQ9/82/fOUKbjnmlh1AQNBNCSsBOFxFraQ/vRqB7424p4R3n1YIHHrJOxmXJFoB7GmMonRP
	sY/vJ8siU6RVCx0XI6eGKVsf2VmJBvnI2r/FaGXSJrcudey1noeUS8PcGU44LAVCwTyNVkI3EVP
	qkfHftMKLTxICpik9Pq2XfgbKLcYpLTh+j9a9MaqcF2pETQdc/qwCDvo5VW1aNkVPkHCcwdmYA1
	x5d844ad+beCAO+u2JHFpt7ZN85/a83G5AfBmrlMYr4ihfQuVukac2Tqz3iXBihdbfeMKMYZxb2
	opbLbLOhpudwaVC6H8R6iB8CqIKitApq1WDVvOW6qghZSsMALvoFizRcSOi7X51WYOzz13Dx+LP
	IrueoO7Dyxdd1oDXQ4
X-Received: by 2002:a05:600c:4fd4:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-48069c98d9fmr93495945e9.33.1769677875090;
        Thu, 29 Jan 2026 01:11:15 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:14 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 8/9] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
Date: Thu, 29 Jan 2026 09:10:59 +0000
Message-ID: <20260129091108.95277-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
References: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device node for SCIF0 pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 86db86335d5e..2f918830b8f1 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -35,3 +35,15 @@ &keys {
 	/delete-node/ key-2;
 	/delete-node/ key-3;
 };
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pins = "SCIF_TXD", "SCIF_RXD";
+		power-source = <1800>;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0

