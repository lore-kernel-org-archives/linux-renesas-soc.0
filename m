Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F53FA5FE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jul 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195997; cv=none; b=eKShFHRiCOQAf0viW3GvMwOUFjEbj3mJEHCq6a4bM4wkCCBMj2yrMlTlghPDfZRRmYSxevtRnnIeS0LyF9IUU7/hsfmyas7ksN+HNgVgqqCCjOI37AlDC8d3qH8Ut0fTHQZ8umrVZpVYDjyiRvJLM0DlGdJGjFoEz92FAPtEV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195997; c=relaxed/simple;
	bh=m1QXPdbdcO3Bhn11G+3BLaCkNvGfbdCCcgJEM1mLk3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfiNfwogFj1lhogPV0jiwIdpGOiFVt7NS+mBSF8o9bUW4WHdGXdECANzYVaHCFJtGixpRBH1FLR6g5IkBRf1hXq3ZVg+MEthIZHDQlI2uyAB+AhqG9aBWsj83SNUg+g1cmOccAofP3YIt6n5D3YjgHOb/8sAo1hlJp7BAWw1gxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dDT+Sm9U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dDT+Sm9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zsVVh2KoKjp7VF/aKLSHGx0C0wcqS9Wfk/cGYV8No9w=; b=dDT+Sm
	9U4w3vuhJS/2Ni0yD+BdaqK5f8BXtwcGFYN8SIPCcAkRpKZkb8wo428BP1nbF425
	q5dG+sANj4lqzMiHv72qM5zU6oOWArLURzieCEuoU975jSGJuNxaU+O4R5i113vp
	YphvUwF1rrD8SGeEsjvUz7hXY4mGvCjxK1or01Xc79qB3gfoAjDzuPWYDkEqlwwD
	r1JFFIRH91TceMiBIe1Zg59MyEEUfUT5DPqyYA5e1KGPEFhFc86ZevOfc0XJp6ny
	ESyJs8XEoeDO0/ocFHHmyIK218DHUhsh+g2dA/TpugBdN0gRedNmCPI+s1nahqrG
	d/FioQzeQgYQ7SlA==
Received: (qmail 1006350 invoked from network); 16 Jul 2026 11:59:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2026 11:59:46 +0200
X-UD-Smtp-Session: l3s3148p1@2db3f7dWargujntt
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: renesas: r9a06g032-rzn1d400: don't enable gpiochips which are always on
Date: Thu, 16 Jul 2026 11:59:36 +0200
Message-ID: <20260716095935.13329-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
References: <20260716095935.13329-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpiochips are always enabled, no need to enable them explicitly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* new patch

 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 1 -
 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 5626d7fd6c3e..49f2def1bb12 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -194,7 +194,6 @@ &gpioirqmux {
 &gpio2 {
 	pinctrl-0 = <&pins_gpio2>;
 	pinctrl-names = "default";
-	status = "okay";
 };
 
 &i2c2 {
diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index ead379988fb1..303b5926d8d1 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -53,10 +53,6 @@ led@1 {
 	};
 };
 
-&gpio2 {
-	status = "okay";
-};
-
 &i2c2 {
 	/* Sensors are different across revisions. All are LM75B compatible */
 	sensor@49 {
-- 
2.47.3

