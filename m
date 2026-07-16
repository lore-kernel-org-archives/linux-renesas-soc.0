Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7989941F373
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205289; cv=none; b=HOgbmFt9+BtFNp14ip9YF6ybBydO3pbA0ePLX89fBnp2+vQpbbwbDfuV574mYAP1O1DJm1qxUcI9AmlZm7Gd1N0494bxo2WEbEjw8n4ilGjAPhUf10YHTdWQRbigNKtahL9vuQ6iIy7pLhAeMlBwmOXGUWB8v7SdJYwnSkF5OGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205289; c=relaxed/simple;
	bh=/0p5Q0W3edFmMR0JKwMJPCO5SfDsNlcFcXuWBH5t3OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=knc52RGuFt3gvcPJ+DNerhV6n6UWi4eGo8kD9+g6rr8ebkzKGFgIohdNyGpTFRFyp5gWU1ESQ8WPMLsFc9paBhOGrBLAFvgslDDodDcbRgesiTzRgbTh2ziiTOtvEILVQ+FEnGUDF8wW7aQ66Yxnq9j/651BqNUhd69YAZgqDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3/rc1Vg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3/rc1Vg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476d8e647e9so6090913f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205285; x=1784810085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioMyijQQOZNtEM+SPBByFUPmrnpXCyySvgec/gk8ZJY=;
        b=j3/rc1Vg+PKv/i/+kT9ydO37rv38Xd0xcVT8cswXKnNapgL/cyl1oJix/ITnMxJqSM
         Ss4vzfpinKoUE3KmpdYORorG7+LALKydRAU7DgFVwGcGyhtuApJPTPynjDniDbXTtj7o
         Zmq4Yp6m2zAE1LngZVbZtUagD+luOdWqtAaTNSRw8OGaHU493xM5bti7v8nfGx38nNZu
         VINDaV6SNbc0MSFZgohdSZQnngoXrZZcrgcdMl8rGGoscFKAw2xXfh+d5zEIR1/AOofI
         2MKJZ84m7E3LAW/HMxtGNK3So9kDhNjC7ai0UwQkhZCK8yuaPuAMPhQlyAqVz+mFPr1I
         pt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205285; x=1784810085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ioMyijQQOZNtEM+SPBByFUPmrnpXCyySvgec/gk8ZJY=;
        b=jvAyfj765Hl1wYlIaUo/gr65mq1mHKbOgqUiTqELJwffM19G6LMtg3vOBVHHUvEUIE
         i8LAEQ7fLUba7SNJCPLt0V7KpstqanUXSOzu09OJQIUXaAKuyjV8Ps0DSDMIaitf3w59
         bkq8ZnzCUaT8qWfH48MWi8eGyqmASHAaq9ufDEAydomxu9F3f423B0MqpcA0QiCVODtA
         3fckhMML0Im4lTNWBwdORA8CCDuiJSJKvO7FrtvzsqX/IQ87xb0TOFUJDiuWE8FEO4Cu
         4YzO51n3l/SGGNa6XkYz56pTDCH9V9K3nXFCedDh6/j3QJ5PRqLBxqXJc51jHKx2Og33
         7MDA==
X-Gm-Message-State: AOJu0YxpHIyeyBgOEU01UB1tngIDHZEWJyOxv+EyrvrqsDIW6CFTd83h
	Il2RKVts2JqtaA3IUAX37mZXbsHj/Pdtf5/GCZrUTBozVP6Yit+yeyES
X-Gm-Gg: AfdE7cmg3FCeyikUFaOgk2v1/kgMEL8N0MVCO5k2Id4wu7mHiFqQXChBcbFrA6Wobiu
	pGYoAUMb0vznRGOWTq5Qo2L+n/n4JWXCnkDo79Hy/DSejCQs8sCFSP8N0o4tC9DvDGIDMe8IqHf
	OIVeyqfQnUwBT3Qx5KIYKdTELnee58l+cedKvWMVlfWkw1W+J/eoFYdW79qnvG877R3JBr+WHFu
	2Fyfu3zqltnIPGtSKbTBW+uCcnLh3rpe8nN1eEe0tAvkHrqkXDl7iJe0LZnUjehxx9Rofs2fnoc
	l6Pj6QK/HYylB96hijI4lj4lvK+Qi7/vXR5ft83vn8TDWD42n/dzLPXAszQriCVmvq2ijfLcpZP
	qHSW7RiI5o9eH79wUljy+YTym/yg7ZqYIGtyCBhmGiLFqQl9z3o5zsg2agYLOZuh5STDjk897ha
	w+U3TawNQ2cuCSt7pvnPed3s3b5UnzctQ/1V8R0I//qR0vHmpsAn+3LhAy2QsNUSFd8bBulAtYC
	/6SUU8X+KWU2rvuBCwzLzM3QUk=
X-Received: by 2002:a05:600c:1d16:b0:495:3b2f:df04 with SMTP id 5b1f17b1804b1-4953b2fe00emr83467695e9.34.1784205285272;
        Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/8] arm64: dts: renesas: r9a09g087: Adjust CPG register region sizes
Date: Thu, 16 Jul 2026 13:34:30 +0100
Message-ID: <20260716123434.2576253-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the size of both CPG register regions from 64 KiB to 128 KiB.

On the RZ/N2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 1f995d636dc3..718e6c06b9ba 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1051,8 +1051,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g087-cpg-mssr";
-			reg = <0 0x80280000 0 0x10000>,
-			      <0 0x81280000 0 0x10000>;
+			reg = <0 0x80280000 0 0x20000>,
+			      <0 0x81280000 0 0x20000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.54.0

