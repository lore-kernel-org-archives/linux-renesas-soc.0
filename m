Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320593B38A1;
	Tue,  5 May 2026 03:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777952634; cv=none; b=Fcn/sDcg/XQZwGTOLMjdimOzNnbvkamYrWBMT/e5FclMn7RmO7RGIirAxR4lpmyO7Qnf9mrY18syEA5RefiXcaK4TislDDqSjp3WgKmdCiCrEB0gEMNpCLkcTSxE7i6MoKMscqVwqFZMMKLL/AcBjdDBYoG5foCCMYU5i9CiWGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777952634; c=relaxed/simple;
	bh=phui/MA85BYTGwna1CJpXqQ3X42QFzYzX9sLGb2HFoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXAkJBeJ4EsMCsKG3GLIMaTlIQ+ahOTkybWn2En5fND2egNopc8hXSXsPnp1WIRwpTq9mz6bn+OaYsRs96vawvasQt4FaBsgpLuvE2XFpw3gP+A5Y0SYeAmGK/YwC6m0J5DdLnxBm05IQdFP2tDMDt1BMg5ihWIJKSGR1JHCeAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GglVB3tf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mz+uOm0S; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GglVB3tf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mz+uOm0S"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g8krd3jlgz9th7;
	Tue,  5 May 2026 05:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWuHnng5BOFVjspVoCh2CO/fn8L6gvKLnoeyOZOicYU=;
	b=GglVB3tfnHbt1lRx1Q40TFoBY68Wqj/MAuW4UhAuzpX0+s5vN5+54B4roCzyzct/qPOMaO
	dHrvcgB+HnFJxrmbGOHjYdDZhX7hk/tHQylLnloTjWdM6JmU4peAfiDpPN3OGEwmOiPLRf
	ji8HCO3oaxIFu6HusTfNHDTavQyhgTx+rw8EHfz5BUP6cRUwLkkCvs9SJjHDLfU9uzoWKk
	0/rP66vfZtu3Rov6dn3IANh5KezBOCNQ82Sgu6QW0CeEp68RhA34UrZxBeXPOHgzImQO8U
	3N5pRNiAvrKetwr5oZ2n4smOZS4e/txVOqHm3OReVqY0fiI7D7DUaOjshyZLTA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mz+uOm0S;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777952623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWuHnng5BOFVjspVoCh2CO/fn8L6gvKLnoeyOZOicYU=;
	b=mz+uOm0S2YOmJCE8Q08lFXGXe+cEYLd7C/jKTm25LDIvA3KIA1NIoiM84OuwqKsKg8lQee
	saqeBS3aT2A5e6lGi/ugDOGpzjw9aN3o3LWBxILrH+mEbumJxYHjJYwUb2QhJpdvXWWkmG
	QaT9ZhslCz4Rc6eFY6C7KU/I5orJ7F5SevSU0ngrOwZRE7g9jFOQWrHBx77gTEBTvyKOJg
	M/DF4LmvadMHGahfE0lnaupUeAP2xkcNLa1SDIc5Lu9nOksCkK8lFepXnTiKsBcYe67+Y/
	B0SXLyNghReT+ku+icmLXa1DzTqREom5ucjjjsC4dxTLBHHXDrh02zoFARF18g==
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
Subject: [PATCH 03/11] arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
Date: Tue,  5 May 2026 05:42:44 +0200
Message-ID: <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e4826d3424b96bfec04
X-MBO-RS-META: ky1ycbawq9mcw7k5buxkdftnypnozhw9
X-Rspamd-Queue-Id: 4g8krd3jlgz9th7

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
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
index b26c5a7097771..a2ad79ddf73db 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
@@ -113,6 +113,8 @@ phy0: ethernet-phy@0 {
 		reg = <0>;
 		interrupts-extended = <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 16 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
-- 
2.53.0

