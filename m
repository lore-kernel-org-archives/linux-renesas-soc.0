Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9BC2D1303;
	Sun, 21 Jun 2026 02:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010280; cv=none; b=MtswEAeiH2O0hOjcER9mLwkL9chs32lRdBUTGokGEk5+TiyQo0OhPITKWlH2xiS10zUINsLrVRlc5Se1yRuVFjXAohAxhCAjBCl4iucl6kNV9AT8DPK5cGPpcaZiKKECi9YwZhw+1v/Ih1MsgMhjRheBYgqa2jDXS1JXf278GHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010280; c=relaxed/simple;
	bh=bLzG/1amA14w/IxHQ0447nzuUqOUg+glas4F3GFI6OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rt/bfTV7UlepVSV39nSUJKtnhspaddEpvRXlVMPN4pgjZ9E465bMht3zIYMhU2rpgf4J2bWHF7kYDOuNl/ibrYgE+JkgxntXdeAjIFRG1G7KFJK545lq/GHu/5813Runk2UG8583rXzH6kjLv/GHl4X2ZMX2gC9Jgvg6eAaOBKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yd6QlJTa; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bPEMMCdO; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yd6QlJTa";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bPEMMCdO"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbSP6HRNz9ty9;
	Sun, 21 Jun 2026 04:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwm+MXScOQYnctLBwyL1CzuVFN6zERU+XCvjLpdQOgA=;
	b=yd6QlJTaw2Ca8T+DBj5AIlo+/P1YAifatdblwos8D0SDFERUupFKf9E28u8i33aZuuIeSd
	6NxSsrJsTKKQMbt6rmtuUlpaQZLgRhdOcjVaKf1RvALScRfLgADCt2EhCzM7EHyXcO2RkO
	EBiqX/wxrhSwMfO4r7jzWJf8lG+Xb6d80sYk+KUd9epuzE94Ll2MVAQYvzLmKu79P4PgHp
	7S4HRC64ZHorq1Y+15ZU43zdlDJ/zdwUPwKK6Uyf60WaznzoW+FqiqDNSNICR3ZcerfXh+
	2328dtCI5XH/Aqk03o5LhjrwXPZ4dMhogblTeCJ/Vh8bqr5BJYCsMwoz/RDrVg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cwm+MXScOQYnctLBwyL1CzuVFN6zERU+XCvjLpdQOgA=;
	b=bPEMMCdOrciDHvwYBfgBrOszoFvfEQpA/IpfQtsumHpioa9d+cfDVJ7WJnJdFXEVcuuuXH
	AyU/A6H4Jcf0un2hG8txAYfbAhHPyNP5uW0ao1IY/tr5/qlxfBswJs0uaBCajr3DIHx4kS
	9YXJJ/Xm5mEJ4o5JdU4fAf8x927yNG4idz22DT+UWvsNu1kuPwG3XcIm78BT5IIq4u0eF1
	7eBU7HyWiAZS30DIBx3ApA618XVV8gppuG/qFlJmP0+2+jvExIEA6TJQG3w9o76So9wSuN
	WDtJg+MlmvBVh+ciDVIT09+ZGZUKHxWPTcO+ai5kjxMfSs9yrz+C8QsOfcS2lQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: renesas: r8a77995: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:29 +0200
Message-ID: <20260621025052.406507-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3dsxrsw5txqre8wsqoktfo4tfuo6ukpr
X-MBO-RS-ID: 62e3300bd24bf859acd

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5f3fcef7560cb..522a49db02587 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -85,7 +85,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0

