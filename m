Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AFF26ED45;
	Sun, 21 Jun 2026 02:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010269; cv=none; b=R66UjdhEgbhgxq66/Cyr41xiDW52f8GvNGFlsl7z5mvCC21uoZBOYl8qOXPSeC/2dwl8FMVYGazbeeJGXRnQxPErx8Dd+BuFQzsbmPUc5dp59dqnI/tKkFckTD4O0wOclztecbGvOChkcyEiEWWWHLpOT5Scp8JzOAWcuInNX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010269; c=relaxed/simple;
	bh=r0JYLCDnw3mju5T1u1K5KGc9oE5o5pgb/+FA0d6CNt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAquhVnXPy9DHIj0qBfddgvm9zxVZileLYnvIkkpLtj8kJpU7I+xp7XcFgrkXy74l3+ij2wovboat+tr0GgnB0VuKyECV5/Zjafy0MNrLLBBLNLW73YMyJWse8PXrd7b3iMSrzSP7LxaXgbsueU7rPY7E/fYuNBuS83HE5CCak8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=blZ3x85d; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kop7N3tb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="blZ3x85d";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kop7N3tb"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbS94Ljrz9tg2;
	Sun, 21 Jun 2026 04:51:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vwDhshsfBptlMTY7VE86CNApFtJIrIMOdCXnOtH5pk=;
	b=blZ3x85di0Mc+8DspDB8JvOLib+SYJtaijiVM7iFGt05YDPjHvwtzoNL6u/eNZ0EdrQeQ3
	OE9Y6zqqqqv26yNtBNMYO2HvNruTWbNPn9hlKkZk9kSkhvOh2tIU2/ddkXXkSwwDAQ0wBj
	JPdYb4QB76BzuBCETFNjLnCw10ZsoKfQfRU6khb+0tVlEqvzZwRalbvQA+fA/IAFLgvYYK
	aVWKQQ4XU0UZyNHT4WX8MSa5Ehv/oPUZJPHQicFUyf6Nu47iWmmenH49V622lgc3idgWqe
	1JR6a/NzKzltYBZZcQDNVs8DTo3P1r/RFNXhIx6gMglCBSrIA+HjPpa9yNH1QQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vwDhshsfBptlMTY7VE86CNApFtJIrIMOdCXnOtH5pk=;
	b=kop7N3tb5P52tgfdugkvynN9OQOUzztGStgYOJtjV9QyXUn1pnmVP8dolDLB2PlQ6cxEqE
	/FzyRaTZlwWLZoXfeNg3og0sw9fUvsnjah3uRorGGKNhsK5ofCP2HpqIo6gq+fanibz1WR
	5KAvKZHvhtZBErGODNlAXH1jKtP3k6c88MReV5uX7lYAy8Fe3n2v/bIfd93jUsNgX56stv
	XmyPveN1S2RzlRl7X9bpTRYudJwbNq6DLmGcqCYUp80OM4/CTEfio46Bv/L/bE99UXy0TK
	9+S+1iaNFJB4nm6+edlAh1QxJoYfhVqg7+tSjH6Ul1KrOXGbQnrVEhSTMIdY7w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/9] arm64: dts: renesas: r8a77960: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:24 +0200
Message-ID: <20260621025052.406507-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ba4zb9oa13djny9jfwb6adoethxgwh5w
X-MBO-RS-ID: 00a4af7481a848232c8

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
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index ad36aa8e75435..4f9989b5e77a8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -311,7 +311,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0

