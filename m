Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16B29DB6C;
	Sun, 21 Jun 2026 02:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010279; cv=none; b=GrZ+C+vlBzcmozbL5BfEiawncnsXBCUUWZgPnmYEku2luRDZ0fJElDayNHo7JaW4iHwhepEkGdfyQkm+LVHZE/EtWmssd5aRa0Hpd89P3l/mikeZev27GZTqeKQA5XIOzLEzRIPWTY59x0YGtVqG5Dl6hNlTvVwq+IoH379WUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010279; c=relaxed/simple;
	bh=Ow9fSFEXjIMCyHnrysLPturg+h7cVKNX66/yZO+Y69g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZHoENm3NOQZYJWLwjoMnSxPN90oZkfv/5I9Hu8w5SzITYGUrHk2bsnl+ZzxrJDKJgP6TPhRDdTY9vSF7pGfKNSYPS2rSx3gYeEno+tI+9Ou8EahCZYR0yvLs8qtW/FqSQukAepbVNQb2Rl+F1tgKNrSn2k36tauqWPLfM1ULGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TnKTaEF9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MKsbY6T5; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TnKTaEF9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MKsbY6T5"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gjbSM5ZQ7z9th9;
	Sun, 21 Jun 2026 04:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKuXq8RbfvkC0lW0DYT2gTn2jf/chp20OOtUVaN4ri4=;
	b=TnKTaEF9OqqwCHw25oSNGzTlhw/esnIR49BuSg/RIYIUtQAw2ak0TkHWhMYE5c01JsXOYF
	jk2DQFclaKeUSS6uxnB4mvUoUHJKMnoR/lFc1hrEAFlvxuTaQTWMckiSQvgwej0EpdnFX+
	ykb7+AzQItubBzGyV1DVHJnoO7u9cEyZyc3Eu107QeB6yPDXozbYLcEUvKW4jngt71dCM7
	+vFsJSZtN8ahoItL9DBni+/yU1V5xyKnpC5CBHYWBV3U+c5CmI/n4gURvt5fZ5sAVhqGaI
	qxDIDuXEXkduF+Khp29xOGFR2vhRG3Y5w/8y0MIp7ZTr7J493psUdseOXlNZJg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MKsbY6T5;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HKuXq8RbfvkC0lW0DYT2gTn2jf/chp20OOtUVaN4ri4=;
	b=MKsbY6T5YjFqb/pVSBs5P5jQPYkdH/CTgaC88kL2kf9yg41EyXR4kazYPxuMFSDEXJKwgH
	dV6U6pAWlo+hqzropgG5iHJaWWF9PqTDTye1Eqsbp4y6iOvugNZyJTYh2J9FwK8tbHqDKJ
	syTa7M/8L5Lmiu+EvtzqwJSYS7c50o6JMPs3PwbnZqINMiUtThVD64HTmWDw8EsqTrKCjB
	vQuAPw8Coz1whdg6G0jtSclQdjtFoQ4LTlfthOTVqEZdy/Uuw2KzQhncr5PsmxBSMGnLVV
	NeyPoXxw81uNeEt5WaQLXhcT5lxglO8M2gpZvvMH2dX6ycHDB+5eSC1rdJuUyQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: renesas: r8a77980: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:28 +0200
Message-ID: <20260621025052.406507-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a51831f5e06d2c34085
X-MBO-RS-META: hbxon1izeimnesuum9jbd455zegf171b
X-Rspamd-Queue-Id: 4gjbSM5ZQ7z9th9

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
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 86b7792d68fac..514dafe344786 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -120,7 +120,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0

