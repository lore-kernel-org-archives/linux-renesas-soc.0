Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D4E285CBA;
	Sun, 21 Jun 2026 02:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782010276; cv=none; b=U1NDo2NL62YHYJI4wLQi3quzdfKI1GtAuyzIPG5i4Ri18qHy05SsX/QLPBPO3lp8cZ4FHwYX04YmWdOhpFGWo0ixuk+gS/mvKQsN5YL3e4i9fQU9WTZNHwp1rrC4XQa8D0OUqpTBekc0nqXkMLHrRhM/6cV6xTV9qW1BW/I4lnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782010276; c=relaxed/simple;
	bh=w3rRs9MIHM/Qrl3Xn4FleTzasRjwqp5dwWlCA7ZqiQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/bFyTBlGkY3NA7rPAmkwPfd4OQbVmi8LIByFPXNeIkjnUAVBNd/Vf44ARy+Ag6TAAhrPFjV0GcLsMmxMrE34oopBS8gz1nb8AQGcWVrzGksnh1YPspSCCl3J7Jjn+ONx07qgfpSYXaW5MUbxINsH6s7asQHSpPSpAi5VQKUrfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sS26STRX; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mf8JOBie; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sS26STRX";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mf8JOBie"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbSK3Yzdz9thY;
	Sun, 21 Jun 2026 04:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxHa2Wmn1MoHK9bZLKpvY9RuFSQ5tI5HQ0tCKRVlQEk=;
	b=sS26STRXYEc61YgG/vikmFYHix3OgOu7ZxewIGN5fijpmWdF17GDiQjTg5mcmby6Zksvm/
	uMpM/6nWoGkNkw7LVQepdsMzQWKf+ReshT8X+10kM87HTOmfIstxvSf6HIMSfRNJ2aRkAG
	GD5usOy+zVY4+x1pUaz/PtUhVd/fr6QDsALkTgL+MDKt6iaSTAQpTbjeAhDw+ea+bCpZ5a
	lbtHOS1WFiHiZCmnxz7XhwtenrWQjAc9jYne47BjBDSwjXmuRo3qYi6644zm/8I/HJmLrc
	9OvQBcKgagclBlcb4lCJrnj9pv1WHmS5sRBIgSodZQO9s6KklaHe7LXxBZAgIQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mf8JOBie;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RxHa2Wmn1MoHK9bZLKpvY9RuFSQ5tI5HQ0tCKRVlQEk=;
	b=mf8JOBiesDgD5q6JhJoBsexdYZ81tOfMZpmcw7g9cF9hexrf8JRv998OD1pn84Y1N+Uhy0
	3Hr4BvSzB3/4eBoB0LVFXFRdkc9WU0j0Up6xoXFwfVYe6obtBr49mxLD2MfFdNtKWDLoF0
	Qal2CodYCxznQW/BX2lSnNVfa5gsmuvsLWI6VUloe4YoCyZlQBFljMdaxX2wuPdI1wPGlI
	7lbLqPY5SXywZKCrM3axoMS2/wuQFHTdrCa0p4ENsO7QPZmAcI9wMf9GSKV8FPVJmKhYJF
	y6WdshglspW2PWeb1kKsLVOLtJB851hnNSkVvI+TXuWyUr4sGDkZ5T/gZ48kFA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 7/9] arm64: dts: renesas: r8a77970: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:27 +0200
Message-ID: <20260621025052.406507-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 785aa8f8b571b4c167d
X-MBO-RS-META: aiqer1mfhcrqxy6taayzeomyyyjzqdqh
X-Rspamd-Queue-Id: 4gjbSK3Yzdz9thY

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
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 1f6676e2795a4..f7f1f280fa0b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -91,7 +91,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0

