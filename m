Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3019637C930;
	Mon,  4 May 2026 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935436; cv=none; b=WXwCtT5xtFsPZqlt6m7gM5AsUDqroYvTF6e80IZZajuRbJcaa6GXsZQhtiCzIqkajhyP3I/L7MzwJXUpXmAHzruVymDZUuLqSqoqURiPQxHZ1Ri/oe1uJdDqFHXiM5Rk8dS1AHyVCaZE7VCbPnh3msTJd59Bwm7LipoR4MqE/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935436; c=relaxed/simple;
	bh=wMISqf37WJmKrut6/FUHYyh7j17TYvgQ+enlzzWJbMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8yyz1/ad3VfC8K8DreEdntR8ApZs+JO1dktMfScSHQ8ZVxFXu+fdwiNNzaiWJEj/YHtuIQNfNm1h86kLnUMEO7qcWRD7/Ca+03bA5d2MQA94tt6HYN/JgDnPP32+I7GuJ4nBP8MNd/Q/qtsy3ROC8i8woUaWW2p4LNnXd5nlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Z9I7m6w+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OoQtm2Tj; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Z9I7m6w+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OoQtm2Tj"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g8cV12VdLz9tdd;
	Tue,  5 May 2026 00:57:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XLhkWVEYq2mGpEUiv0sqxpsGyZahR5a6SDGaVlbSZSg=;
	b=Z9I7m6w+0Q5ZnEOQPvJ9cB6OHvDdeTbp2detkmO1Ab8P/qizHyVCnNjVffqVCsCA/M4yTB
	PgMgtK6tq+J4F4dx/xxnsLqj4Qbzyb5E6dzkuQz+IVFkBBDq+nsz9EPjfjYyWJX7IFetGS
	8GGmG6tXIbNLYgwNRczRDGBQ7HoD43gXPn5MIH6IgcDPMcs6+K9IBJ002EjN4bMIIns8/H
	Othkj3Lp4fxXyKF75ZKLBX66RjgTGm0CKiBWjWLiNILxp/FYFoiknLXEmMy4F0UcIbuZSH
	AZr6MHM0CYum1sdkcrTMJq+HdhMXgh7bR3YzfUHVfnsJQ0EcoMVcfDWpFTLiIA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XLhkWVEYq2mGpEUiv0sqxpsGyZahR5a6SDGaVlbSZSg=;
	b=OoQtm2TjtTLDJkAU9vHhj/2oSzpGyfQG4MWxxayfPuT05poELpma3EY1USJnNfmUzXnAqX
	lGr1C48lZMaC1UkQVxmx95wPL7Mk4smM/I/Jwhf2A3yVHH8XtkcMiLzlUBaVrO52tAnV7U
	7HY2JJc1yzcOUM0j4OgRTrH+b3oyA0hC0bsqRd5DUFNdGw1zsBSasyB4KcmtqHjAF5YO/x
	ujtR/1TaIpFIo1jjl9dOD6XJhvb/HX1Jer4fXwQSrxVKMVJbkbE4Rz0NTuWEywLEq4dqvm
	Ds2h4rccXRexutsBJtyLaswLE+VEqbeGx+2VCfdo5i1LInTop/DExpATT8y0UQ==
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
Subject: [PATCH 1/5] arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:51 +0200
Message-ID: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d6f30ca155c2f1f8d80
X-MBO-RS-META: swbnshd58iodsxtxnznbst6hew8nyzrm

Use standard clock-controller node name for the CS2000-CP.
No functional change.

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
 arch/arm64/boot/dts/renesas/draak.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index c83c97d991133..c9c5c3ab06c38 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -435,7 +435,7 @@ adv7612_out: endpoint {
 		};
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0

