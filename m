Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E432638C2D4;
	Mon,  4 May 2026 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777935438; cv=none; b=O3T8HUvRT0qnB9ZYyQlOKaelc0HMSddOL/do7exrpDwRgQImNklyYCQP4iRsiIETKFZnQsbzheUCYFqTR3TYDAIJZuH4K3ioWMGGw1+gHDx3fGEAcpy+YjepPallMrP0CRxuv/GuthKB0q1hN39liqHAgFrCVPw5cQw4uZJEJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777935438; c=relaxed/simple;
	bh=aCfCV7sjhMaw2q2dfC99J8OX36RDsOkpTCi6jYt3f7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6o4bHMBGTEoTq8gtv5FgTVOXtm6S8iO8Ip+JyJTFXDjW3NlOTy6Rw2dmaRX6Hun6kTug86j9uaQM0PVTZgy41m1Vl/WhNBK27574g15l5JMxRSL5V7zfTVGZ/GeH0NumjX1zyDNgtyz7/ZEgvGlUeoX2EZT6Jq5gmWFFyOlFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SHHnGGn+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hxRn17UV; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SHHnGGn+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hxRn17UV"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g8cV32w79z9tyC;
	Tue,  5 May 2026 00:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7FtyYayRHdvmA+wM6bGR8rUqY27QswE8bRLIQ06qZs=;
	b=SHHnGGn+lFCMQhVgGFN5e0ACR4cODtNWuwnVIcgKMcah9FGg7Yqntgf+dK1pHv5ZdOsw5t
	7c8kq7yvCpuVyaSoFpqdFsz+7rKqUROmaT2aAkZbbpKHDD9AL25AV3dkG3nioHYAmE8lP5
	UmCW9IMoeGfk/T+AaFFkxt/k4ZVDrqhUBppD5gFnaXnfImrsUqtt1Kz9xb35rXc7baAtFJ
	HFIcoGADLE2W3tGkS8ah/Lbw4kJCULrArJYM8YPZFX9j9g/6tOA3FlS06B72lbHQIWNYs+
	oEsht74jlpAb9wJnT102unPK7jjAS1cQKrMljuNgVIaPlIy4UfcgxrxzJ94Fmw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hxRn17UV;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777935433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7FtyYayRHdvmA+wM6bGR8rUqY27QswE8bRLIQ06qZs=;
	b=hxRn17UVN+/bJcP32+5icClip4TdqFPhdNVG7uLmPNkt9bPTxrgfEBJJGT4Ot6g5GKewkf
	YAcJUiToTfSsKOVaP1GIDDcG99DRvu0sUCNBrmTiZ4W9Y7TLdyoNL32H6MtMyI4BRDsdO0
	hWOsr6hLOcafMKZA08J83P2181n0DA5j1VBxQLGxALwHklI2aAGxX/3NUO3u49YxfeySSX
	GYph8lZft5P52lcY5n/xFbGCLQu/A7G+ZP42Lf5Y/hPKjIVbDoA2rV1TA7hdIbvwr7V8jt
	JhHk3ctMOBCrORE6vy6TYYeFCnjciY+cdnnqMdk+fUWUKT6cb2F8jxErSx+uMg==
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
Subject: [PATCH 2/5] arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
Date: Tue,  5 May 2026 00:56:52 +0200
Message-ID: <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 02567093473d0a7a46e
X-MBO-RS-META: 6ypiz17pr7xcpwhpr6nwf7mm5nzs6zzc
X-Rspamd-Queue-Id: 4g8cV32w79z9tyC

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
 arch/arm64/boot/dts/renesas/ebisu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index ba564aa098661..add60324e0e4a 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -512,7 +512,7 @@ ak4613: codec@10 {
 		asahi-kasei,out6-single-end;
 	};
 
-	cs2000: clk-multiplier@4f {
+	cs2000: clock-controller@4f {
 		#clock-cells = <0>;
 		compatible = "cirrus,cs2000-cp";
 		reg = <0x4f>;
-- 
2.53.0

