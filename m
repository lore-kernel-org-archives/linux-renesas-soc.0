Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402F33EAEC;
	Fri, 27 Mar 2026 23:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654981; cv=none; b=PHUJBcI3LwBxSNTQ6C9BnuPmExOnSQsBFWNAU/bRsaluzHme+KOjtS/K6Gg1JZ9b6S4SFrch21v9BZkvh7zK1YWciBMmSt3M+GLp8FIdhi8xe8EPRdZjpa8IaPr5Bf28BU6RAMjgCTHYB/fm05N0RnWylmowZIfDEoLH42DAIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654981; c=relaxed/simple;
	bh=2nAMd/K49zPS9f1B6Ofw4N4IDrwACFN3xQsijiFsRog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCeLW9/Ij1aK4ATSQMyAsRdyLtGtdaCKuvFHKS89CYa662MTVgkWxk4I1t+m3R60wms/VuAW6IbATHmrAj9cY4D//YQ7zXh/tZZ4Z1EbBigvsxr5zHecLoNTL34lsYpAJ87tK8JOfh8Wq2z1ab9+nNmueMBryta9sx8QQrlc5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cl5My3rm; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PQoCh8C2; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cl5My3rm";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PQoCh8C2"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fjHJJ36l1z9tCf;
	Sat, 28 Mar 2026 00:42:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1/FPoQhoSRcFGUM/A96CeIQjrOtIjqWo2SkIO9w56Q=;
	b=cl5My3rmdWoPU74+2Q387hWbL5mAzm4v+eiLM4FmBAjROobAfyHhM536kD+WDZUHEo+erz
	/F2RW6dfYzODUxoTBSpW/TUh9JgAv7BC7I6+mKeB+JCrjHMImijp5TUEwVNGn42/BOcaRu
	6s0otIfUqhWhB85gafUO5xy+mu6+gcfrtlV8SQoy8s6UVQ/626mij+MbGgH35k9oarlUSC
	94W8i2YBQuu6zdYdPLV+l1hWhDD5AdkntenY9ZRMyTBYu/uzpoWujfP4WXGqQDH7Fo+fId
	Ad8IrdFRO8FnoOoOw5NVAAahzLb02k6uJ/bfsf3JmlA9MTmVvmbL9E3+KEF15Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=PQoCh8C2;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a1/FPoQhoSRcFGUM/A96CeIQjrOtIjqWo2SkIO9w56Q=;
	b=PQoCh8C2G2LimjyzDy9CMHSzRCGL1ASMPpzt+IaRaX8YoDwv8s79Ogbtl3p+FkRk1lQ6jX
	iImMPQRDukARFDqPVXwEtkzHRiEqjT2hMyQrnLlTR9Ze26IFQLgbopWWWnmoK6cmxxP7kq
	EW9obBXyRVOgCaHh2ExETuT+V411C9wTL2nVT5xKNFAGkaV37emAIANHZdCmXPuBGjS2du
	Sg9J+ST5VeT8yy11eFPJd2jnSknmzTZE3nAnKv39mB0G8ka6b92Hs4Fnrw3mXZT1f/QGfw
	fuLVdpa5aKG3zBm15hMG6lpe44/mjguYSi3vOzLCyuz2qJfeqDTPZCFKL8euXQ==
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
Subject: [PATCH 1/6] ARM: dts: renesas: r8a7778: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:06 +0100
Message-ID: <20260327234244.91707-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 53e9acd8f93c1fde79c
X-MBO-RS-META: 7hfe3ahzxos9eegf7wyzf98mst8ab71t
X-Rspamd-Queue-Id: 4fjHJJ36l1z9tCf

Add missing unit to bus node to fix the following DTC warning:
"
arch/arm/boot/dts/renesas/r8a7778.dtsi:43.12-48.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
"

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
 arch/arm/boot/dts/renesas/r8a7778.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7778.dtsi b/arch/arm/boot/dts/renesas/r8a7778.dtsi
index 859dd29dfce3b..7db456b19795d 100644
--- a/arch/arm/boot/dts/renesas/r8a7778.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7778.dtsi
@@ -40,7 +40,7 @@ aliases {
 		spi2 = &hspi2;
 	};
 
-	lbsc: bus {
+	lbsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0

