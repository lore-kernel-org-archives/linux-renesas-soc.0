Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9923EBF2C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770881918; cv=none; b=R5B3CXF7s6/AQ85FlMUufg4oMXya1dF8407R29cwjdBYMN6XNBJV5wIueCSQ+L+so6bdo3GAXzJSXgM/eKs+D8XDgcWHbiV//yKWasnSZCuOTv0ScaZSKRJdcTTIDMmMNIIpqt+PbMHJBMsNC6E6UAJdkOmLrepnMALykzKeXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770881918; c=relaxed/simple;
	bh=NVIm1DndWJJJCTPF40Fql6DiXdWdfVFwl6oMJzoeDCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XzRY/vHw59dWlPIGqpmztxDsEac2okDZ+SBSuqaaYORwoJ6c07emQjCey8g8EuQZFzFoniguOyNWaWSrJEMzJ9jHvdjK3o0Bi4GrrA5wfesjYF6B47kbG9ZoYec25fdcUokYOlDXhN0x3A+CD/Sgf20yA1jEFq1bzdv1u1awjhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjqkT1ES; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjqkT1ES"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-824a9348603so437872b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 23:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770881916; x=1771486716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6yU/33Y2AIUO+BWTC38ZPK5L+/ZL/PnX+vS1d7hlyo=;
        b=UjqkT1ESRlpIqhYG+mUDiJdwWhsfIuMTmXGfz0KeYBOjRQppyyCUpW2ArseOMX9rUR
         4AxRjckgdE+MkEvCnzf+3qZVDKUxnF9P4ZoxHkB7T+z0FL8m3SygEQTbVdwvrdc39DNi
         yMBJXs+bVBG3ncAalSlnFOKKHz2AVU1z+2o0RZ11wkOVzFzjyySRLJ8BLkQfwAfxQmtY
         FZANR+PefNwgcJrYxQ3KBM2EP2AVryEaqqjjYm0WwsRHdM3IGmuZPUtbiGrddNlc2wYs
         cqVjnvq/bwH8uU04hhQrDFXJnTLoCMXCBMnkXZNkqPqnYvV1n7KmdsZbxN9y8klkf2Yz
         w9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770881916; x=1771486716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6yU/33Y2AIUO+BWTC38ZPK5L+/ZL/PnX+vS1d7hlyo=;
        b=lCzRfJfwjpemRdCMWVrIH2Sqc0G+//0EcGwlCv0XWB4JUakKxKPUNiemilPUh38Yss
         P831SbTVXBs/MPvF6gVz4lcHU+Ebyo9FbLQusPgwILksCS0zSi76lMG/oaXKeexuWh3B
         RPn6wgEK6u+k8zutoosoDCQcnuhO5WqcJGNIK00ddm+Ufgr50VE6+9WE+1fJXVORro6M
         VCRngB2cAbAR/St/w0sA0Eip+qJeuQYOU1MPGCY2U2qcOjm5U3Y0jbfKFl7D/SQ5T/WS
         hMkDG17B6OOOJBH4MipKQf1krxERuAuxoaAQvVa38Fm3T0Mu+cxVjH122OhokxXCleuL
         /ruA==
X-Forwarded-Encrypted: i=1; AJvYcCVEphfBH/lxsJWL7+m1Wv1gKDjJhRFxylfZO3yMtucG9vQvuBlcDln7MyYun/COcNfrOB46qroHbGlwQ4RBDyZ3kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3P+97RtN6WtWxOIKcVPTBvuobC8bCrD+CwoIuCQBtIk0E6PM
	W48qXj0r67efWa9rtFFIMQm2uRJ+RfpTfC9Ippka/lRdFoTxx0yksgp2
X-Gm-Gg: AZuq6aLNonbNoOAS2wjVDauUSJn28wxhky9A7joHrO9eO0FIV/wr8K3usTqr3VKXtxV
	PiQinSMq+8vImsUNldhzJ6OL0soZye1/WFGjLJc5skDvZTfz5ELfvdIZtTmr1Em6wL/+4LW/qQ9
	widHIWK5r4/m21unO6NHNmoBeqrHnp953/QHwWKRcD1qmLsuE/+0TaXQqHrulH/JMZWwRBN66R+
	9joTCafYvTl2oXgbjFP6uL6NgIpvP1Gc0gVq3WAK998UPZ7e75TXYMF9QxxLwNDUdIcFQSjl6EZ
	ZjBGkKgFMV5Zyff4fZv7JWeBERSVFG/pc+yhdmFGNN4rkzwZIwUUNpRe4N5SUwVhPi4Ub/Kcd1b
	KqYnRZqRJrwC/QYoutDqHFoqDA+HfLkViKRH8uhYdXoHKLWToNxgvn2AWnhZQ43+dUGUjExjVbP
	lOeD0MG+vCGvnpZikPhlt03lEeSw==
X-Received: by 2002:a05:6a00:a24b:b0:824:a0b3:775e with SMTP id d2e1a72fcca58-824b05ac3d8mr1782553b3a.68.1770881916526;
        Wed, 11 Feb 2026 23:38:36 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e8473fasm4295470b3a.55.2026.02.11.23.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 23:38:35 -0800 (PST)
From: phucduc.bui@gmail.com
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phucduc.bui@gmail.com
Subject: [PATCH] arm: dts: renesas: r8a7740-armadillo800eva: Enable SDHI1
Date: Thu, 12 Feb 2026 14:38:18 +0700
Message-ID: <20260212073819.41304-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The Armadillo800EVA board provides an SD card slot connected to
the SDHI1 interface, but it is currently disabled in the device tree.

Add a fixed 3.3V regulator, configure the required pinctrl groups,
and enable the SDHI1 controller in 4-bit mode.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../dts/renesas/r8a7740-armadillo800eva.dts   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 04d24b6d8056..4838b285bdd9 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -65,6 +65,17 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
 		enable-active-high;
 	};
 
+	vcc_sdhi1: regulator-vcc-sdhi1 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "SDHI1 Vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pfc 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_5p0v: regulator-5p0v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-5.0V";
@@ -285,6 +296,11 @@ sdhi0_pins: sd0 {
 		function = "sdhi0";
 	};
 
+	sdhi1_pins: sd1 {
+		groups = "sdhi1_data4", "sdhi1_ctrl", "sdhi1_cd", "sdhi1_wp";
+		function = "sdhi1";
+	};
+
 	fsia_pins: sounda {
 		groups = "fsia_sclk_in", "fsia_mclk_out",
 			 "fsia_data_in_1", "fsia_data_out_0";
@@ -336,6 +352,15 @@ &sdhi0 {
 	status = "okay";
 };
 
+&sdhi1 {
+	pinctrl-0 = <&sdhi1_pins>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vcc_sdhi1>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &sh_fsi2 {
 	pinctrl-0 = <&fsia_pins>;
 	pinctrl-names = "default";
-- 
2.43.0

