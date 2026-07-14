Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7A47B434;
	Tue, 14 Jul 2026 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034332; cv=none; b=oE+VS33ZStNFiQnH09PAThJjT/N/aZelwzD+a+UyUMVSw5g1FebIGwVtztbYAmlwiQ9+iyDCK3Sur6SUZRpaWtIrTazKT/LAWFN5hlKRhPuzVcRMWxAlLRAlA/CukSKhEzfRX70CLTA3J0wimr/uTZD3/yPuBqiEdUUaN+y2yzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034332; c=relaxed/simple;
	bh=MKafQ2xMEf1J5JGLnC2EmXJQYgtuSHd8eV6hadsCP7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n25MJHJqKswgZG8golx6WvYqIyknmLWlATSkr1cDWx2U93f2WntCUVbhL39aZEh6xyOQalZZ4ZVL6BA2hN56GdcbPqZP1HTx2I/JMpF63AdcuW329JNI6xRbHC0fXqkIF8SH6poX78dUIpx43n/5ouAPjO1wwpHoJg4KGAldttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lM1R9OcM; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L6OMjVBs; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lM1R9OcM";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L6OMjVBs"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4h000S25LKzKv6w;
	Tue, 14 Jul 2026 15:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wdEQwuEUahv4QQFaS1sdtIP8s6BHiaKdfz0pUGmYp4=;
	b=lM1R9OcM7/j6sZj+sIPbEFx+Ax8Y/8SH0Sz7RSaGbqW+czsZadXp2mWdFuepJyrL2sx55d
	Z3QaeWOAA64AovSFC2Une3LSCMOsa7psybzATg9LTy6aGZQeAVd18UHBA01ke3qqFgaB9a
	W4Q6JBXO6Li4PSGoo284jP7h2PQZ55Ds+8c8RcFYn/dMDlUxVYvbkjfT98e0GXR1b6Ougs
	pqaLfKEnssw1kSCWW8DZ7ClSY5RAqalS/7IhY+hvG3ea/vT6zmwAvFJD5LZT3T16enJQdk
	s0ok6lgJ6vh682iK9iwtEhu5lrQObPO/wIs9RW/BMKDntavWnAXiqbc7asjiaA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L6OMjVBs;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/wdEQwuEUahv4QQFaS1sdtIP8s6BHiaKdfz0pUGmYp4=;
	b=L6OMjVBsyzwsVKDL2kL03YQRGeY4X7CdWYkpO1yzg3MILKfKhU+E8cKstk9Bw1xgLLFLV+
	D5nsvWdQja9V8HPX4qSosrXMnVFZVqL9uLpf/NzMgqtfxXlpLmpo17dE8bQXQhAIesmTi+
	2oV5lT329lEWJGvI/6/T6Nb2wxhTcFhBidR8OSZqxydUadahLqoSEMv2M717u79PJJKDlt
	/J85eO5LfI4xq0f+vP+SfO5bdAG1sn1tKd0NgYGK15rr2baoMJMbuhcouiVG/7vP4IxWH4
	bQ4m1F2aorXModGt9R1KxDcOI3yfGK+3Zgts7afMnYnyme6iDR2lyA9iFgQEhA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: hihope-rzg2-ex: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:58 +0200
Message-ID: <20260714130515.11262-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
References: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d20c130be33f70fa70f
X-MBO-RS-META: twbnhowye6ybzzzuns4d9twi9fokanr8
X-Rspamd-Queue-Id: 4h000S25LKzKv6w

The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
(Hardware Reset) states that the PHYRSTB pin must be asserted low
for at least 10ms (Tgap in Figure 10) and the system must wait at
minimum 30ms (for internal circuits settle time) before accessing
the PHY registers. Use 15ms and 35ms respectively to provide some
additional margin.

[1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 83b6c04274ac9..58b787db0f24f 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -25,12 +25,14 @@ &avb {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <15000>;
+		reset-deassert-us = <35000>;
 	};
 };
 
 &can0 {
 	pinctrl-0 = <&can0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0

