Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E16E2CCB9;
	Thu, 11 Jun 2026 01:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781139623; cv=none; b=kAYcj+9LhrcPblF4myDKj9CoyOY+2SUuvOiivJMdjmRJG55ZmpR3IlXOAqePmhXuhO2R8uRuY0aNbXnmKkrEm3zGvFIMDarmHC6DNByKQg0Z1dXTqe7hYZQUo1IVmpkgnj7MoLvVDlgUEUgN5VcJWlBHLqtyUXBKu+A9M+rQOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781139623; c=relaxed/simple;
	bh=ZnUwz3H4dXTqAYOyymU5Ir6/n+3SLqhJSc/8+xIbBtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BBJYuRFpqZ6eS+pgdp7s36lft6GM0sc2t2yQ9UD7fj3PIJLT23aZGxRWcd2z/94HZ+0BbDFGHGHfvGvBEtweKC7OSZKSy+k2Wm5+DGdflZ4GKdXcYxNduzvv8uTzog8d2WxsXVD7mjz6vur9Q7OJ/YtFMLOJmwFaeQbMdEgS6KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PjjQcqlN; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tyGggic0; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PjjQcqlN";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tyGggic0"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gbPSz00VRz9vNd;
	Thu, 11 Jun 2026 03:00:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781139619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1aX965CQukLCI1Qo1GktUQYfgY2SwoR7uedgK0lphqw=;
	b=PjjQcqlNBL/NM4aa4Qnqov9PNKb2hAYKOq4vrwCrkzrdIOag4K9EbMKxNGlsZBFMfbx7z6
	2mHxFK79hhBp0Uo1N7VTsUhPt+Pb4qiX2PkMg6MSD/cZB09ATS/KBv/A1Lex47hoBU2L+R
	Du8m5/43WdPJgR55HWn/1/ogCOfaCkwD13gWBZ5vdVCkkuqSwA06I2Z2/9DvtCL1dPaBp1
	LfqKCXoU/0CoRWYWBBBgVC3tjO1sKrrmVZDPl2yz2t4rClViVFFoL2Uc8dyYPJ/JKWQrhm
	FZ3AtiGqoCtn4cU3XxHSaA29geHSqO+P7qIYgm96C5GvvFqFVMMYkaHu/uvD7Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tyGggic0;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781139617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1aX965CQukLCI1Qo1GktUQYfgY2SwoR7uedgK0lphqw=;
	b=tyGggic0YnscO44Vj+ppbuM0zhnC3fz5NVGdsymk0TSpHVL710q93YGYBYTY3/EChkKwLi
	0QlGu+g5tatVuoP0TyJv5ajScj+6S8yjyUvQhjDkFVBoby/dLFrSYlO+EEkEdHGoUt4YCR
	/cebDBWASBXS7OjC+TwmVmD4dSiqw19AQttRxlbvYnTYxTlGlr2An4PzHH4yG31rE4THmW
	CULd0db219ZCwmOeN3YIQDPVIEMEO7LXulsVnAIGvttV5UdSC61hBbo67TOvhZTsRrGatN
	CKyW963cn8dAzemPkxcPBlu2mRubR978XFLvwAav5qZyBeBsIX+7AmpUyoI9lg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
Date: Thu, 11 Jun 2026 02:57:29 +0200
Message-ID: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5umjyam7fxaw386rcihnthbewtayxad7
X-MBO-RS-ID: 07aa668f81783f80a0d
X-Rspamd-Queue-Id: 4gbPSz00VRz9vNd

Enable GPU on Salvator-X with R-Car M3-N.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
index f84c64ed4df7b..af8cfdccd2103 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dts
@@ -30,3 +30,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.3",
 		      "dclkin.0", "dclkin.1", "dclkin.3";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.53.0

