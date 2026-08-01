Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70963CC313
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Aug 2026 21:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785618222; cv=none; b=BA8o0Qaq/70scYKzazIwLp1uDVXzwZsBmqp4OVXpMcjv/xee/L8PmEUlzEJRo6uSrvmch1oq82MRoDa7x4e0eMEqlXqqqGkdUbD58IGc1Yo2MKDK+WwBJr/Sd15X28m6XBv/+3Qt1RPmnpJO4kMCSLw9lMZHKihWvRQki8bCOUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785618222; c=relaxed/simple;
	bh=fT8mirhGgRHGih5afz+pF+mYwgjHvVGglAZ0Of8t3hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gcmHEo2kSww/nsZ31NId5RYyOIuzlbWLJdyHwh0GG/6mtYKdwpjNsGaW1bNqJZIiGT2naJT+hD3FvdYuGnxV0AUG6BZlbPgaM32dhMgjsMM5KM9W16qj45tA7D1j7WN4I3fjC5kXho7Iefe1NrKEdfPvemyN73WkZbrei3j/RBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtgaNz6s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dsr13RZo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtgaNz6s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dsr13RZo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671IxgnP3599868
	for <linux-renesas-soc@vger.kernel.org>; Sat, 1 Aug 2026 21:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HIKbLGVbzZy
	owZPXHI5YsTewaTbcrbLzjZdsQn8/RGI=; b=TtgaNz6sl7urhiZoHNJoz8Sp9TL
	8F0Q1evL813wTFKWGWIQeaxjdZIi2DQfWC4//FK9OfAL7IAKn9xvmoeryZRyNIsp
	dhS5hZxeQ/huyhD+nGNdm/+wm8zjrbMTHflh2Amx94WOrvfgsMu2FbCjw0EeOFqJ
	n+5SjAwuA6hpL88cT+un4zib+P4GQf1beVXXQThIezUEa0BoyAHUKQuFJO5ctcTn
	lqJP03nRF9b5/xWAhQJZKqwVZ1GjGJ7jSAadH2gWCaXFbVzU5oPSkYmOag+94nrD
	XlDl01Li5UrnR9GafwdUjv7B9e3fvQz47sKyGdZCd6oZFR7tw8aZTVBfQ2g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfsj0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 21:03:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso37409031cf.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Aug 2026 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785618219; x=1786223019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIKbLGVbzZyowZPXHI5YsTewaTbcrbLzjZdsQn8/RGI=;
        b=Dsr13RZoUW7X/sAO6EUskpJ0Z1Bg6GBcesZnU72YFop+q07XVgijcQjN8lpdNZ2T00
         aOmqc5yQPNxRMb0IbuPwLPh5SFPCswV0fNe9aqdKSIgdEtE4e4YybVWZKtB8n2N5w7fb
         2hS8QEaiKBdrk6phx+KdReRZz3jYEcp5lGt0KllVfwPr0XgVg/Dhmsjtedp6P54/Exq6
         U8SowcssOjJtKyWCMWrvMN4MohzgFbDaeBcIfA9pysw2yTxD7cYULrcfw8Kv5JfHczpO
         DNyze0+zXd1GsPCVwh3sdBW7MX/rmLbw5hk87aDIfip7B+WVeezzKJvRV7CTDJvxdr9R
         EU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785618219; x=1786223019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIKbLGVbzZyowZPXHI5YsTewaTbcrbLzjZdsQn8/RGI=;
        b=iLf8Mu3+TEPgqyFTTLvoA9danrjPsQe3PSx2yyq3AAx3Gk8EV+n7rq2XUpP/33+74i
         tRxPpSOAUKABEiyFFoV2JJhndDVeLmxiKMQRv8Uy2jKzjZH3vo20RHmtnzGeyjMp8HOE
         xtHi2Dz+v1ZikNNFXJB5Wda/SGMuI4M2emAB2/UGA8OX3urMmLVXXyKXwtccfFeljxP6
         SJehaEnl3fO6I7wu8ya6TIT2NKiTVPJOnlfApkbjTglNewsSs6IjoFChAc0TVhU54q8Z
         f9ULRiuhDu1q2B/knFjxoMFx2Ixjqs9V07IfwfufxcWS73p1B/eIB8jSmyiFc8VnZAZa
         7K2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq3XWYoyGaKO+sDQ33pSpy0Qgjj7ebZY+nYGjqVj28ICrIwwKNVJaq0JrKKLQa8vffNihNisaauKExMkccPPo9hCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YznkgzP0/B4GNuYTQjtHcHagTGpcqFHhFrQ+O3v+gEONUb3XhPa
	X1HoUOnSTH7fTfkg7reqhboVODGDbRnMJuInDXz6jm+LpX2FWIfNW0Jrj0ul05fvkG4mneKBpgR
	sjNRImYTSVlXWmew+X1ipEHAod3gL3oGRc35KVHTfH63ciYCpJbhSOYohkdNkrw6qjZrggNwl0g
	==
X-Gm-Gg: AR+sD11eKslN+8zWe892CYjMXrICJFaK7sW4Ui6PVurNylmcoRKj2gqnyM3x97Ij+lq
	Kxnii2qAMl+fYpPQC4mi58EXQlSaMBZdC6LRB1bDkyFa24Ai/z4VO5k0I0Ys7GyE2F5+Vkurdz2
	mQEw8JTUIy8ReXxgRUmu7A3vlZ5lAd/SraaAW50dJ9uuKA8fLrHPpJZz61Ipv4x+CaHMjF6mshK
	THMjbg5yDOvhGgVK/hKLAMboJJqTrnMTP/QHqAc+99hgtvhHdZaVDPA8o0vFh0pmIe31TSq2o82
	c9eh1rUyOzps8ha9cyoZZyeVd75mS7stxniWAtqKPz8lLrZCWiNitf4fDCoRtetRetGjITrs7jE
	mNGcHYFenYf9XeO04
X-Received: by 2002:ac8:7fcc:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-52b566aa85amr87382271cf.16.1785618218503;
        Sat, 01 Aug 2026 14:03:38 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:51c:de5:bd4b with SMTP id d75a77b69052e-52b566aa85amr87381731cf.16.1785618218012;
        Sat, 01 Aug 2026 14:03:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456262bsm17552251f8f.17.2026.08.01.14.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:03:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Correct white-space style
Date: Sat,  1 Aug 2026 23:03:23 +0200
Message-ID: <20260801210321.383773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9741; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fT8mirhGgRHGih5afz+pF+mYwgjHvVGglAZ0Of8t3hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbl8aZpjRsmDsAygnBx1vBrgiCXW8W77Gm+24U
 09SjVGHiFWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam5fGgAKCRDBN2bmhouD
 18gMEACGzaIOfA0ykvP+L/0Js9lW/6tdkj60URJPEqBLxXvgfMIuuLiwQUAGBR57IYGEii/PnFS
 U+L6HC6O5MZ97Z/OhD1Y3nN7Y2HWdOl+sbDj1APOI56UUZbjFMJFknfJpDmG3cF7fV9n6sv4BwB
 USLGGo7slJuWcrt6LNhUURipzPvog/LVZ4eUn1reKNhAt+/KGKnLto+oAYIx+ErSN5/YgTCp4rF
 0grQTAMxYrvfch+2JVmvqk1x97a8Xd2AnhSBiWiEOKjonrXV6lg5KUycdPfZZgo3eSRCmd+38fF
 a8YTpi54yxTJPeQvC2IjVGeb4bO8cywSjyeinCV4AJez3B9OXDjTJTUeg8JdTSCuCqa+osQCONt
 w8gbZpqRC2wuyErPPTY680oCQkxCH81Mc2ofKp1Lkyg0IP311EvJBHis+qRhjUIhnkuyag4/BWb
 CbxICLXoZTtY7ulucZZu/hRwIF/taHWVeLBMUlcvqSPReO40+z6ucot4Jaj4ZfuChGPE5krSZh/
 e4Q6+Du7ipoahaXBjDxmhjQaaKvzWqz2JltACDY0D9dUwrfYj34vXgZS7WmL1x5P7u+iH/kT/nO
 hAoHbLf5kLR5OObaP4FQg6SXdXRtWLfabMIeT5GJsRjtViuALlFXWLUIwYF79pJw7G8zhvVBepg tdZCzDGDtIkhN6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KeEBKLs61VnJHqeJ4IY-ZTsoxtvHRcBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXyzEagwzK0p3I
 71kfcf7rMw4olnr9JbZWjF92/+yBC0qvNlwSO9h4dkx1LhYaMt/7BV7s/fL4/wGOY0W8165454o
 7szjMPgwCTjwCsRW7F1f0MvgSAsKGq//74HZcrhjuvfiPgjFYDev1PkNrBnbRvnz3jaIy5EVJQx
 5lcux2IEa01N2rGrcBKpdjUCOEclBmSz1UDTb3RX5ug3d3sEXIZfF3qEhytqN6pZpHbmBcGt8G0
 qq8fiseEAIRNEzOPmNFIILgBLRea5oJ3AMAeE8VOCYk3/gC9QZXslxg9AVeb1bgx+Xx5E2gVIXg
 F9uL0dyhGgwXNNCMDD1Rzu4tC67jD0vKlMZM1wUOCyrRpG0S8xHA2yVCTCG+3+6JKw7HnGjnT1x
 aloWrllfscU8BGXvnGduj7+MbfkSd+Z/QEfrX6jdVaEiRPUf0bKx8PBxFbaMWApCgRyDLC5Dwmb
 s9p1Lvw5E/lLEkNbY/Q==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e5f2b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7YlEez_digMlJapE0I8A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KeEBKLs61VnJHqeJ4IY-ZTsoxtvHRcBU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2OSBTYWx0ZWRfXx0AXOTtCsPRB
 o1m4oOnzH9xq0p5+O3wBnhEo5IP0XUAQpEKPA5ZrN4a4v9NCSM+LX6BtA1ttQoAi6LDJIhzzXzG
 8FER9pbAJ8D1AaLPNMo/8jmpc8LY2k0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010169

Correct a few white-space issues, like missing space before bracket '{'
character or spurious space, which will be flagged by dt-check-style
("redundant-whitespace" warning).  No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../r8a77970-eagle-function-expansion.dtso     |  2 +-
 arch/arm64/boot/dts/renesas/r8a779md-geist.dts |  2 +-
 .../boot/dts/renesas/r9a07g044l2-remi-pi.dts   |  2 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi     |  4 ++--
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi     |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi     |  2 +-
 .../boot/dts/renesas/salvator-common.dtsi      |  2 +-
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi   | 18 +++++++++---------
 12 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
index ecb35257b9ae..a9ad009ff7b0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
@@ -112,7 +112,7 @@ video-receiver@70 {
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
-			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
 		interrupts-extended = <&gpio3 3 IRQ_TYPE_LEVEL_LOW>,
 				      <&gpio3 4 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "intrq1", "intrq2";
diff --git a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
index 0e4724336e73..b186807926d2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
@@ -367,7 +367,7 @@ video-receiver@70 {
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
-			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
 
 		interrupts-extended = <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
 				      <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
index 3267e7b75b58..dea386f3c836 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
@@ -156,7 +156,7 @@ &i2c0 {
 
 	hdmi-bridge@48 {
 		compatible = "lontium,lt8912b";
-		reg = <0x48> ;
+		reg = <0x48>;
 		reset-gpios = <&pinctrl RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
 
 		ports {
diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 3a69bb246bab..713de04e0e5f 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -645,7 +645,7 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
-		sdhi0: mmc@11c00000  {
+		sdhi0: mmc@11c00000 {
 			compatible = "renesas,sdhi-r9a08g045", "renesas,rzg2l-sdhi";
 			reg = <0x0 0x11c00000 0 0x10000>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 42462c138dd2..fbe1e1c24f57 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -85,7 +85,7 @@ sdhi0: mmc@85000000 {
 			status = "disabled";
 		};
 
-		sdhi1: mmc@85010000  {
+		sdhi1: mmc@85010000 {
 			compatible = "renesas,sdhi-r9a09g011",
 				     "renesas,rzg2l-sdhi";
 			reg = <0x0 0x85010000 0 0x2000>;
@@ -101,7 +101,7 @@ sdhi1: mmc@85010000  {
 			status = "disabled";
 		};
 
-		emmc: mmc@85020000  {
+		emmc: mmc@85020000 {
 			compatible = "renesas,sdhi-r9a09g011",
 				     "renesas,rzg2l-sdhi";
 			reg = <0x0 0x85020000 0 0x2000>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 73757e8e2197..bc7cba77b6dc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1773,7 +1773,7 @@ usb3_phy: usb-phy@15870000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000  {
+		sdhi0: mmc@15c00000 {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
 			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 76fa34ff3d07..dd0e4e5a6be7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -1447,7 +1447,7 @@ usb3_phy: usb-phy@15870000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000  {
+		sdhi0: mmc@15c00000 {
 			compatible = "renesas,sdhi-r9a09g056", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
 			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 639693d464a7..6242b3c66542 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -1577,7 +1577,7 @@ usb3_phy1: usb-phy@15880000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@15c00000  {
+		sdhi0: mmc@15c00000 {
 			compatible = "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
 			interrupts = <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..99855bd78584 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1337,7 +1337,7 @@ hsusb: usb@92041000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@92080000  {
+		sdhi0: mmc@92080000 {
 			compatible = "renesas,sdhi-r9a09g077",
 				     "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x92080000 0 0x10000>;
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index e8d4f76949cc..f7df10b4fedf 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1340,7 +1340,7 @@ hsusb: usb@92041000 {
 			status = "disabled";
 		};
 
-		sdhi0: mmc@92080000  {
+		sdhi0: mmc@92080000 {
 			compatible = "renesas,sdhi-r9a09g087",
 				     "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x92080000 0 0x10000>;
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 1317ede2f719..9f8c545dad34 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -543,7 +543,7 @@ video-receiver@70 {
 		reg = <0x70 0x71 0x72 0x73 0x74 0x75
 		       0x60 0x61 0x62 0x63 0x64 0x65>;
 		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
-			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb";
 
 		interrupts-extended = <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
 				      <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
index 67a0057a3383..2460ad849b93 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
@@ -76,14 +76,14 @@ ports@0 {
 				 * (H) CPU7
 				 * (I) CPU8
 				 */
-			fe_c:	port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
-			fe_d:	port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
-			fe_e:	port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
-			fe_f:	port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
+			fe_c: port@2 { reg = <2>; fe_c_ep: endpoint { remote-endpoint = <&rsnd_c_ep>; }; };
+			fe_d: port@3 { reg = <3>; fe_d_ep: endpoint { remote-endpoint = <&rsnd_d_ep>; }; };
+			fe_e: port@4 { reg = <4>; fe_e_ep: endpoint { remote-endpoint = <&rsnd_e_ep>; }; };
+			fe_f: port@5 { reg = <5>; fe_f_ep: endpoint { remote-endpoint = <&rsnd_f_ep>; }; };
 
-			fe_g:	port@6 { reg = <6>; fe_g_ep: endpoint { remote-endpoint = <&rsnd_g_ep>; }; };
-			fe_h:	port@7 { reg = <7>; fe_h_ep: endpoint { remote-endpoint = <&rsnd_h_ep>; }; };
-			fe_i:	port@8 { reg = <8>; fe_i_ep: endpoint { remote-endpoint = <&rsnd_i_ep>; }; };
+			fe_g: port@6 { reg = <6>; fe_g_ep: endpoint { remote-endpoint = <&rsnd_g_ep>; }; };
+			fe_h: port@7 { reg = <7>; fe_h_ep: endpoint { remote-endpoint = <&rsnd_h_ep>; }; };
+			fe_i: port@8 { reg = <8>; fe_i_ep: endpoint { remote-endpoint = <&rsnd_i_ep>; }; };
 			};
 
 			ports@1 {
@@ -96,8 +96,8 @@ ports@1 {
 				 * (Y) PCM3168A-p
 				 * (Z) PCM3168A-c
 				 */
-			be_y:	port@0 { reg = <0>; be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
-			be_z:	port@1 { reg = <1>; be_z_ep: endpoint { remote-endpoint = <&pcm3168a_z_ep>; }; };
+			be_y: port@0 { reg = <0>; be_y_ep: endpoint { remote-endpoint = <&pcm3168a_y_ep>; }; };
+			be_z: port@1 { reg = <1>; be_z_ep: endpoint { remote-endpoint = <&pcm3168a_z_ep>; }; };
 			};
 		};
 	};
-- 
2.53.0

