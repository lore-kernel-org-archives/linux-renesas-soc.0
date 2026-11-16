Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825879;
	b=5eAh0lWMTlL4phiT+zjywTJzR816hANugK/+/li+1JTbTpudn4bpiaIIYcnIAw7QFh3m
	 lZuv3pmNGz0GYd7rbrDlSll0xJraNti/dNondxlOYoJ/lszw4iQeSeeGZ0OcmczAvAOYg
	 1Bcyf2I/0gF6AZ57iSCGxtIIM0PXK2+pvT15RJmVLwrmqRq17H9pN0dDObaj6sPoVfMAz
	 88VQfVmbrfPRZEl+8DsqZBJYRRCOY66CfzrMV6yDhaQ531Ck9XkzZN02R1a89vepKH/NM
	 B9dVIi5uALjqf5kuwzBZ3mWM+VmC6JHWjP+8DrZhY7WSZol8b37Gu1qx4trJtwgcTNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825879;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tYiEVJEZ2AghwsHtNRWK9DsQq7KNpBbOGj70o9+wqtc=;
	b=VzC31SpO2h21l6sqGue7zFOChhYaMY1qSIx9w60ugt+d5ALWkJc7yVOna33c/3zUmhS4
	 oivzSnPCeJbQq7gJaw0vqK2cYv+8mvBZBOM96PuIAWXGAuPxAROkArcGE64iqK1uQTwXg
	 3lpuR4NgPlH/GdsnvSvIuUnAlmtarNLlrQj3/rZOP1oJMQ/N4f4cZrnokxhzzCXAGc72F
	 hhciF8DsYVVwuTSO6UAOgX5mX8mtRxfDn3zwAnwz19+YeLcW6TiSE8CHRxmJOMwy1qHq8
	 RyRdPMCfvm3Nl99xAp9ZtMZ+caNpPs7aIZ3eLqnp/FRwP7b24xau/8Q4IVrMyMy8ajQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Gk87Zfms;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6FE606A329
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 10:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B6FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Gk87Zfms
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=tYiEVJEZ2Aghws
	HtNRWK9DsQq7KNpBbOGj70o9+wqtc=; b=Gk87ZfmsIypjph4pG7/FpEgpn3acOy
	iT8hgMIDS8bEeORuOzzVq9D1E+ZnwX0DMUEMl9sVMedj1bfMB4XWk+66wA13HASd
	RP6Jf/cNH1SZ9n4k2xUnie/Fi3uO4Zy9BdEPqSzpZxefUlOJ+u4SAq1HJSMZhzAX
	IF7C/CCH7ZGq6AsmazrSO4DbHE4rYhgrUVp3RyYitWm0uH8MI3mHRIV2RHMyaw1p
	qpD3OJi9BvFbEsfx1TaupJ2uSg90OC+NmOk0HyUdJIOgFt85hBYnN/CmZx70v6Pm
	J757NaJb0lipj+Bht+W0isvwg1YeERqt2OpYBD3QmNDavN8wCvWHU56Q==
Received: (qmail 1243494 invoked from network); 16 Nov 2026 11:44:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 11:44:35 +0100
X-UD-Smtp-Session: l3s3148p1@B9W3dmJgbs8ujnv5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: beacon: Increase sdhi speeds
Date: Mon, 16 Nov 2026 11:41:28 +0100
Message-ID: <20261116104427.5152-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adam Ford <aford173@gmail.com>

The eMMC can run at hs400 and the WiFi chip can run at sdr104.
Set the respective flags to push the sdhi faster.

Signed-off-by: Adam Ford <aford173@gmail.com>
[wsa: rebased, add HS400 flag instead of replacing the HS200 one]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Okay, the original patch is really old, from around 2021 [1]. I found it
while looking for SDHI improvements and it is still easy enough to do
the requested changes and add these additional capabilities, so why not?

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20201224170502.2254683-9-aford173@gmail.com/

 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
index 882513149042..8af2edaa690a 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
@@ -288,8 +288,9 @@ &scif2 {
 };
 
 &sdhi2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdhi2_pins>;
+	pinctrl-1 = <&sdhi2_pins>;
+	pinctrl-names = "default", "state_uhs";
 	bus-width = <4>;
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
@@ -297,6 +298,8 @@ &sdhi2 {
 	cap-power-off-card;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&wlan_pwrseq>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 	status = "okay";
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -317,6 +320,7 @@ &sdhi3 {
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
 	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
 	no-sd;
 	no-sdio;
 	non-removable;
-- 
2.53.0

