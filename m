Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501993F0AB7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352631; cv=none; b=TxnElSCSOYAXVFC5x58suaE+XTYpk12304vcNYuMxCKte4T+/xOjtdjIUd91XTBDZdQGtBTwboGyiWjVSRIJWzjr17K0gfPbv7TFTkVxiI77Ftb1bX/RGPaQLvCjOtgjk8/uaEzzsE/VATqfxJVaJ4rvBAfrr00N3Rm7Ixc3Gw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352631; c=relaxed/simple;
	bh=WCsOz191eih0MXZ0OznFJ4IlSh5CQa4XbzsA9hxPo7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaUU2gzbyl/19dXBjIMskF7VJRegThFr/9yaFOHJOhWb1qCkWLgXSe8lH6/bqoC/Cul7PX4CCfxO3YtHq2R5zkW9bcVVKDBUiQFK6dD9EqCbIEBASyqZyc/6cC8t1ud/1ovRURunzLfLO/2GNMIZbbtbaT5saXMc34KNUs5UaE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH7zYCdl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH7zYCdl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fe655187so49208085e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352623; x=1774957423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNXpm+EocPv/pt5Oe0CQXzjdsdk5Us4vsSky/67Xf6w=;
        b=NH7zYCdlHsaE1baao25TcMDKmlAaUhHZlWV8SLly0LLaKintP+/vkT87LW1OOWHWrp
         uxTxYlTWELYPVWTLNhNl/ogul7yeV+1dbVWK+X2A9Qw9dZHI/z6zWrUzZt/W7jdtMbuD
         e2HI6jK26owEx5ckGZ3JPHiwPhL+MdvfDItRNXi0Z0l+iS8W/3u1wpSmcOtPCbHyGpIP
         SD/ys9Jzg2HIY5x/yMen0TllMRo8eqjhKFlmqBZeJ0Do/Lx2OYqiJ06sG89p9LEgpnq7
         S2/cxYwreaW5jTv5JrcslGsVymWGngUr7Js34HvXlh/xNh7vxe5qQ6WIHTr8YI9bqSlY
         THig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352623; x=1774957423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lNXpm+EocPv/pt5Oe0CQXzjdsdk5Us4vsSky/67Xf6w=;
        b=iezFbRd+dhOlK6Hxp3eNXqqbGfT0SZ3fO85nV9RlMmxIVD/4EyswFwBNL10eWOtlAf
         5S/otS19Av083Ex0J05PnNFjY8QB+cY5u8I++tHiuSADmAXEvTCeVjf9FsBnWBHXocJ1
         8KtYGun9cRhxJqA7OjS9gFcf72sG72iscpGAw3ytGMPYm1BFlNhyPgSEt4sqnOtH6q0K
         rTZ0ICiBsYbLvABl5Blyl6585qV/BOKA+6jeElcX0Dgx9MAn13HWpvv9DHGOLiVkEjsF
         WP0pkEKJkVC3FXhAywBU2K/oPccRPK0UARfPlg95jy6+rWrr5MT3FFCuy4nLKDe53Eya
         kHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhloTJfRJQ41QKU7wsPBPQ/15KJ7VAY13X7fwqRDiumiwdrfIfQB/w36pENr3PQ3CaiOfR1ayql6a08XEwq22+rQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy3tXKIhPuNw1x0MID+q5FCbB/A50nZuBgO+qrkjhaunvSJ9e4
	dmVkPilwurgZQ48/NxZwKMZ/rsApB6d8WQlsT+GBUt8Hb8Off08xUwmR
X-Gm-Gg: ATEYQzxVFlFUZUin4PcM4QsimTWr4Na0HoqIG2lrBaPNnzfczskooo2i4TwAGpHzIxt
	IIegoIkY/bSGsmNO3AH4trXIMxfHsmtri1u7eQltMyT+IJtZx2T7svLQLTCtXsqdvFsVQVD7tI0
	rurP6OI0FKRBNOInrZqz3RBSzzZfM5/DCSTvlZtNZrFXYIhb7kC9s284vqdb8Xsjb46tMNNKcap
	Syr/qb+nSf46uZBWUPyI9KfL2480l3KhDJlsC+zXZQKTEaJf/nszyCHyGlAh5y+x18aPGTB6Bs2
	G5xVQ4jng/QWY/MoGthmlzQtF98bLDVMae9CNQBvq9YsEF29C13f9k00LvM3gq48LYAI+DQuGbQ
	xmuDgS/wIIzFXLHRmIECZalnzPr4tolnWvBZHxA9SzScdb1nnBJBdR0dhf1xRiT4p0/mbQU3Vk8
	fbRAkLs8T3SIMHt5PNF4uuvgbDRKgmoKPQcZ6HgUnxbKqGPbMG
X-Received: by 2002:a05:600c:c173:b0:485:5981:1411 with SMTP id 5b1f17b1804b1-486fee1a26bmr200847485e9.23.1774352622882;
        Tue, 24 Mar 2026 04:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:42 -0700 (PDT)
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
Subject: [PATCH v8 10/11] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Tue, 24 Mar 2026 11:43:15 +0000
Message-ID: <20260324114329.268249-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
v6->v7:
 * No change
v5->v6:
 * No change
v4->v5:
 * No change
v3->v4:
 * Updated commit description
 * Collected the tag
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 30ffd458f188..9d16c3117cb9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -264,7 +264,13 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
 	pinctrl-names = "default";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index b607b5d6c259..69c0101ff7f5 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -107,11 +107,3 @@ &sdhi1 {
 
 	status = "okay";
 };
-
-&usb3_phy {
-	status = "okay";
-};
-
-&xhci {
-	status = "okay";
-};
-- 
2.43.0

