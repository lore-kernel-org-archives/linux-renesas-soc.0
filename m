Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF08039E196;
	Fri, 27 Mar 2026 23:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654990; cv=none; b=Fnq4zpEZuvzWZmS3fHC1Y2Y/CyNFUK8+qyJZXiTUao156TFkaEWoPRtbBrO5HCJgMBK5/hLwmsEn3/AIoAVk7G0oCUl4w10uTbtLAhvNWnekMqu/OfgDlx1kG6Q3CFkciVMdubKwJvY+GEwQDpk+nypGTVSYXBQufmfkxXTFrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654990; c=relaxed/simple;
	bh=ifVLXGubeDe4aryVuE84f7HPcEbRzgf+9RnGYK4UHcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qANMmjyje4d/enIaPK/o36ik4CPipOFMmq6SVOGjDmVxqEp/YQQMQV7+dnWSYF/fb8hRVJycTCE3rVZuSp36vKE/+vOIgmf8unSEhVDhdaFfbz4Sq3+mTMYTRZk0e1UzVrr1AkgPpbSgbfb9gkAXGe1XYUE8Sg1Iey8hWEmWeqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xoZuuRCx; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ocx//wCJ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xoZuuRCx";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ocx//wCJ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fjHJT0x0Vz9tCf;
	Sat, 28 Mar 2026 00:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3E5laNUcpyFi0ktqHAkYL8SAWhUJy35oJrbXxzqXko=;
	b=xoZuuRCxpHJ/LUkuonsdBniJu2e6To14l1PU2ljul7kl5ggRyBfhn61YrXEj5j1YUQBI94
	aYswbRQCc8YKLUSi6H29wi3H4pyY/AKCXiEkH5egxOsPfscf996gQhHqVYjAvAx+w1tI+A
	GK1U0mMhY0RJL11ubjX4HElVG5/2ro9iBEThCsOiUTK81YiidvhkIqu05JwwS5RHgGlCgp
	LXLdtESruqqiYXrk+YRR9Q8+q3bdEsQCqhUqP3l3MBvCdQSqf6HOymAFyQrfkbJJa/oz91
	zXS+F2q7tU2MCgvAaEcnRV+EynAS3gZYxoQn0IcPLCjsmHWdvW7/AN+UZg9W4Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="Ocx//wCJ";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h3E5laNUcpyFi0ktqHAkYL8SAWhUJy35oJrbXxzqXko=;
	b=Ocx//wCJNTe/96KNqIJTGxh9kYf2uFXhFWBI0OerYoKIyUfmPMU303TfWaHOkPj0NrsDcs
	NCB+JyC8eEy5PbOXnSjwq+5CVqv3ffa/BIUrii14tfisPuCS0LLtCJ4ZoUQ1FMQBIvKZh2
	UMQNomjd8wG5yDctjWMMYLg2pMMtOAEy2yTNfeW+DTHADEyjgX8OaCio10z09ENrMVaWGI
	hyT/YlgnVvcR9k7CPClyTphfoLzOwdcjBgCkDBqlOFq1gtAl0fqram6KvvtFw7mMAIQJHu
	qTsuLVNXQhVAsUAevyEnFFHOIGInaxk0/I64CHYxoDekNFL7GHnevP0EpSyVCA==
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
Subject: [PATCH 5/6] ARM: dts: renesas: genmai: Drop superfluous cells
Date: Sat, 28 Mar 2026 00:42:10 +0100
Message-ID: <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f613652e2bdcd2fc051
X-MBO-RS-META: kup5x6brydqqhymerna9ezdeyksad5g5
X-Rspamd-Queue-Id: 4fjHJT0x0Vz9tCf

Drop superfluous address-cells and size-cells to fix DTC warning:
"
arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
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
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 3c37565097145..da552a66615e0 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -34,9 +34,6 @@ flash@18000000 {
 		clocks = <&mstp9_clks R7S72100_CLK_SPIBSC0>;
 		power-domains = <&cpg_clocks>;
 
-		#address-cells = <1>;
-		#size-cells = <1>;
-
 		partitions {
 			compatible = "fixed-partitions";
 			#address-cells = <1>;
-- 
2.53.0

