Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F1A46AF1B;
	Tue, 14 Jul 2026 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034290; cv=none; b=GVc2xCBz+AbIueMbV4fJjylg7BycMny593r38g8tT+JNgwZadx6dpEnF7Mo5puN/7SGyu4FXBmnghSPtoQTdYchuOqXcUtM+9tUyr/m2WQTj4rO/XPBsncvUgGkV6we4P84FvWTMlAX64JDpogBB5PHO7Yk+3fOf8XGHW46Nhok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034290; c=relaxed/simple;
	bh=0EEuYJnODTcJitU5oN7zh0Ed2Ny8cPFn6OZVCcqhMYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EcA6OqVohXGc7ceA4lnWFvo8LBWHaosRb0euXcbwaHmDpcxac31BBB27He2cqKLcFCNPNT6080Zdqsm2bPbpTOff7TAQRTM5hTs+aQYGvWGauEPobyE8NO+2I4UuU7APQkJuGLGfY1+L+zBrCHJe2bcfCAvXo4adWeoYZum6oS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Y/iJABlh; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=iJKtndP1; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y/iJABlh";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iJKtndP1"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gzzzY1ffnz8v9G;
	Tue, 14 Jul 2026 15:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxZTDis523UeX9WvIQtOsfnmnd6iLGOy5eWcWKoUzWc=;
	b=Y/iJABlhB9876LoaliTfRURkM63Z0jfM4WccGgSMo/DriLgpmbT7NI/pOVZxUDrB09L+h3
	xgnKYFXp7rPuoBq222Zyi5FH6FVhZOSleNTySiSSRDsy16yes31L3hd0OFbCsSv6eDlKYr
	XVJ38fXIAvUpDIftpk3I/SZhUD+x411lI9/x+v6DQmz7jF/it+qUF6JOX4LoITztkXTCCX
	zFsoLPKgk7gUsZjPIwhGkW3APNIcKlj67lU588L57YxU80qixoOGhiQaGHQOM8uPUkHy+V
	3hhJkFIHMJVmm2Rz46kJ3BkzsIKYpchHzXToxGRleglsbZ3bHTWc1oUR7gVnyA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=iJKtndP1;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxZTDis523UeX9WvIQtOsfnmnd6iLGOy5eWcWKoUzWc=;
	b=iJKtndP11GiN+pHGNmybiu3mz7xaVAvSSFRfwJONHrCcmyK0QYI+PeE4A/z3ks+dgNHwVp
	h5R0j6D1ybbl3j9MdtdHwAYM6n200bZsa2+4QgkkjkPeoSXsXHPZG0e2KiAVuwXJMlALWf
	xvGPtDuxGfyY4tV7vcEHydz8eQ6G/v2cJoTJ0k75aus5UTH3rs22kzqE8xTzPltHiOwmCG
	SapJmIunpFTMf5crlTohAAEEd4F3CvuLRZzdKx7aFwzQHktoLQxhbxWV0ELvJO9FaK/eXQ
	d/+90VgNmpVgNjyfEIveR0sQ/943Nzqr2zg+B579Q0Mc3yXVJJQ6a9pub92/Sw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/9] arm: dts: renesas: stout: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:55 +0200
Message-ID: <20260714130429.11214-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ax7ssajim4caxm4mh5xwgae1jxosy8nu
X-MBO-RS-ID: 1828e40cd7139f8bfba
X-Rspamd-Queue-Id: 4gzzzY1ffnz8v9G

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
the system wait after deassertion of the PHY reset and before start
of communication with the PHY via MDIO. Opt for the same value as
used for KSZ9031RNX, which is 300 us.

The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
reset high is at minimum 10 ms. Set the DT property reset-assert-us
to 10ms because the KSZ8041RNL RM does not explicitly spell out how
long the reset has to be asserted, but this at least covers the worst
case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf

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
 arch/arm/boot/dts/renesas/r8a7790-stout.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7790-stout.dts b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
index 8ba9d85f10389..b062423499e48 100644
--- a/arch/arm/boot/dts/renesas/r8a7790-stout.dts
+++ b/arch/arm/boot/dts/renesas/r8a7790-stout.dts
@@ -210,12 +210,14 @@ &ether {
 	phy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-id0022.1537";
 		reg = <1>;
 		interrupts-extended = <&irqc0 1 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 		reset-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &cmt0 {
 	status = "okay";
 };
-- 
2.53.0

