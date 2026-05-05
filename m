Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615573BED66;
	Tue,  5 May 2026 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952643; cv=none; b=GTjEHDhhGGpGNWVJ7sZGUfolCKnXJ2C3lz4obEwfbugIUzIdlcaAEP1u9Ks6+hrN6XZfldP6YpuENiXP8DMo9sAmIsBmBP05vGQBB1LUUOIX5KzQTuUUZOSrUa1pPmkUWG15KsycYkRuYj3fif7Kx+b0UaJxTKNVhKAP8PtUPzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952643; c=relaxed/simple;
	bh=H5CZijB+RVAy7FJswdvidOAiqPtKuw3DsvpjjC+fme4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbeeS28z6RLOsccyecDgvLPErKPmF8NTZl3xVPNUFx1EnkdzKgmd57R+KHWTAoMnq8BaWTBJR+ct8GVqddUP3XtEh5je4wy2C85isjms4fi+nDROK6YuzJRIlAXMNMnl08Fx3wXG6PuR/O733t2eaLh5NHflgvKzDgiHFsvk0TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=W8fMOZlv; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fODKMjiJ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="W8fMOZlv";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fODKMjiJ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8krv3KMMz9ttZ;
	Tue,  5 May 2026 05:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMdwdP3nboo7mFF0k9YbSTM89N9Bulr+AME+RvbTqlk=;
	b=W8fMOZlvvnFLmdOTFoerWHo+qYh6YIHHUB74Opt9MLUiXOM61Aq04df3jOeU6r1jvGzv0i
	HHriuYK0VkQ9if3pWU9ftbq9UJeKbgjP5VWuR0st7dwtZ/5EqY7i3UwJRcJz1F22LN2amV
	I4dZCHI9Ufo6EGffafv0uuhEByBchkY2nJuteJxCPL7WdLC2PnewETsYsNaQWRb1wtEYOv
	C4xBNf4AzIhVFBDYFG2NdvV6HEsqxGCPgJpt10AfU7UNs8obiZwUyrpst0ijAtYaiX0cWo
	RrpMnVmt1UNLS/mxPdXG6r/A5dmGHdCIBaTZFRvzxOExmBhDJ93OAI1Nr41FxQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMdwdP3nboo7mFF0k9YbSTM89N9Bulr+AME+RvbTqlk=;
	b=fODKMjiJIhc/2ccEDt9yXAj9xpCNNQlh66WFGI/0txL7eQB/1eXjt893aiu7KrFm35aDh6
	/aCejIpF+xWF/0PrcZQ71PUnH+zY2HqHxz7K1CeDMvpERrp01NF/JS8Zybhp9dzRoYD7dm
	PWVMYoFQtSrGBWMXu+JwKFV3Oue1wmu6fCAeaqo8s7nSwRIHLj7+qreZ1v7hyco4KKklBv
	mtJga3DEasLNKTFHBkTEIT87cdVXORiK5wMEtd11HafoaGVWvORdts9Z7joSk8cjJapnnN
	C/YdpOZbai8K8sUSKWn/7NPUdbo0ymdREqWUtBkNcEMaXNFhKme1wj307x0PnQ==
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
Subject: [PATCH 09/11] arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:50 +0200
Message-ID: <20260505034325.167797-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hfa34mzfhzuh7xwfkbyihw65n8iw6je1
X-MBO-RS-ID: 3592287a5530274bebd

The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
de-assertion of reset, wait a minimum of 100 us before starting
programming on the MIIM (MDC/MDIO) interface. Set DT property
reset-deassert-us to three times that, 300 us, to provide ample
time between reset deassertion and MDIO access.

The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
voltages to de-assertion of reset is at minimum 10 ms. Set DT
property reset-assert-us to 10ms because the KSZ9031RNX RM does
not explicitly spell out how long the reset has to be asserted,
but this at least covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

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
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 6bd580737f25d..ea5dcee73658a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -33,6 +33,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio4 16 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0

