Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4463446AEF0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544403; cv=none; b=IbtCOsD2a2FlIDm/eVZ/BaBwzNpEGxTEf0n2Wv711tCaJxHgxOshxYnyYlNIB4tJk0oeJ/EHBDftJtABmE+/buwEMGl1P7xYk55XUah9K0E7rg3tA3jtB7xCF8tf6lJWCePgvg6wWsN8+GDyYzPTwi6rKM76i65hGNrHopP1DCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544403; c=relaxed/simple;
	bh=FzQdI41LsYXGgDVc9k9yPu0jzMl08cpB4+kHkxb+1DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e7fyl+UxOtyQ5mmllJqprYMzVUA3W1HMo0tbSyWEvg2U6cnjY/G5cM3yQVSNsW4HWETCS0giSX5cXyJWZldwJfgxbMhN/5nNh5bJGfvojtfJIAds2rOS7wOOb9UmFYZ4e4B7OuzC5kfTpmSj1yjSXi1aDorOw2k5zsrhVMrmB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsWHbuPT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsWHbuPT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so6565915e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Aug 2026 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544400; x=1787149200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMZSBq3TM9KrtGynI6DWaERDoo3umOgfLHwY8OUCPPY=;
        b=CsWHbuPTa/dyYRbT1qJTjSFxna/V9sFQgdM1Kw6CxhUy/gukEZMi8m0TK9nDUPUJEg
         kqVW2234ADCV1uTXh07Na4Jl/u2dnwURhALy6lxlz7z/K+VfGo9gk5VTHPZAhmQjXrUx
         oP6SrBGgbb4cbdLWcv3CKFPfUdsEhIritzSXRKB/j5S0Ak6iXrLC9miIT/h7K9V4abBH
         fHx5vK58iuIDIxw00NIPZFKYecv4QS/TPMkDRTKfdGCE6DW8nnAK5TbGbZgP6j5AgLXO
         FmAUCeTxmEOsrImhefT3QPaXRlvbsrd56TGYVCMZsD74YEacRqNQ5rO8iGTomURTZ6jU
         L9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544400; x=1787149200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EMZSBq3TM9KrtGynI6DWaERDoo3umOgfLHwY8OUCPPY=;
        b=CltcZKfa1eAo9o0MAiSZTr8+muLILuFhd2Ptx3ByLjOVd8YvSzxeFjozJPhdjlJ/7E
         REhNX9v5FsXc1zWmT6gOHdwxCv26o0W6d/up0lwCpCBdRdyzrIuJbCdAVACxTKxjzYmW
         jhaM2peU0rV+ML/NlrAohHUF1TKbYp/mg7NbWXmOtRJc2vKARMpMuCeVecc0/o7upZlc
         iYjob6whThI6RCGSbO9zhf/2HoAOseQFlC0T7hygTwKg2QjbG6RTarPjaPxspqyI7gBq
         EJJV2LufNCJ+UfFxCQv1QjohAai37z6I2lDRXFx7XH1vQOwoENBLmtToHgb+AOSh7OBO
         l+GQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9jDxX1X0x0X0S23SAbM35XJW7xI8Dzu9XKDJNjb2CV0y+fMciFbpQss5rF1sI6XNkuFpHpXz/SjDmQrEWV3qf6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQNbm+IP5etbQPT1ANw7ccs9h45ILhypf6NET3Jq/xD8BXmIB
	bTrwvHnEuSEBJZJO7nxvE9DfYjYRRomIQjFaQO4kOdw9XGPWvJl2hrz4
X-Gm-Gg: AR+sD11z1SmEgiQvYhLsLtVy2Je1r2ZwCqJR0AqKMo1FPKGeMaa1w+3GgBBPH2v5G4U
	EZ7t/uyL7Gvcg6+YNOJp+Fglz8472/ns32rpVWNTNxq0VmKUQab8M8q3rVzuJQyfpMnap9gMmVL
	YeXS+2XCrwjWNaU/aIuXBOzn9g4UtlaYUijc/VVDIpAANb7om/IcRj8PpeTAlfgHfuwVD4ATBW0
	DCCWvsbln3NOvW18uaS1f4zVGDmXF6mdUYYsr1zUTZcEikR4p7qqkSvHqMCMEx24CVovlERF68P
	37GsT6xcmpo/TXhm3LbBUauD3/7YyPu13VjKgamL8hCxHVyEhaVweyBABcmf7opJoN/Lr65EC5y
	KZT+TuRtw+hp1tXwoNbVgLV6ts8QJAlRc443s9I2SedqFx1B9gC6/bz1GGpi4NWfH4eMvWODO5y
	ZW+eWMimA5DVqn8g8yqj01N0JSiEvrTWeCcEI3jLcupr5Tjy9/s4UFqsSYyzheVOpJ3i+Q3R8IL
	eYYK01/r5FgAw==
X-Received: by 2002:a05:600c:c4b7:b0:499:4d4a:4990 with SMTP id 5b1f17b1804b1-4997c0e398fmr55410285e9.3.1786544400258;
        Wed, 12 Aug 2026 07:20:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:58 -0700 (PDT)
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
Subject: [PATCH v7 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 function support
Date: Wed, 12 Aug 2026 15:19:27 +0100
Message-ID: <20260812141940.246223-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Switch ehci0 and ohci0 from dr_mode = "host" to "otg", and enable
the hsusb0 USB2.0 function controller node with dr_mode = "otg" and
status = "okay", so USB2.0 device/OTG mode is supported on the
RZ/G3L SMARC (r9a08g046l48) board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v7:
 * Moved the patch from [1]
 * Updated commit description
 * Updated dr_mode = "host" to "otg" in {e,o}hci0 device nodes.
 * Retained the tag as change is trivial.
 [1] https://lore.kernel.org/all/20260707145135.247565-4-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 522cfde4b66a..a3c491778aba 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -88,7 +88,7 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 };
 
 &ehci0 {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
 
@@ -97,6 +97,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&hsusb0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -149,7 +154,7 @@ &keys {
 };
 
 &ohci0 {
-	dr_mode = "host";
+	dr_mode = "otg";
 	status = "okay";
 };
 
-- 
2.43.0

