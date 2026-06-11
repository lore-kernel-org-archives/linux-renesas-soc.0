Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868231552FD;
	Thu, 11 Jun 2026 01:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781139635; cv=none; b=NGLwBG8sQA9r36T5c6DJHqbOIX0pPjcOzphZ7glV60ITXb8qvwkmUZzxuVLMFm+7K04GUnmk0zLw/amhQP/dQcpaOkjRU8l+gvF7UXw1+AkFa042v+lgC0I28y6uEBxq0w5v4KDQfBDwSofo98DpiLmmFyovjK5QT3BFuhzomZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781139635; c=relaxed/simple;
	bh=7sl3DgJjEULgeWOBJXoYH622WuCnl3XArZmTjkCyPzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HTfwF9+b6JgkARNrGMfZwreEROI9PmiMsAFVBGa43SpXK+jyyV4SJmUgzdgm5iZV3b+QgXRsS5Xnan6YfX1sy2veyRYUgMra5c2XDE/Rs5+KggG13ZUph9Mv0q6jUUEFE0i5UQAO5XqGwNeLqNg5NQuVnnWcf/h3TkjyF6jwbFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d3nxPABZ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A/gn0upq; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d3nxPABZ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="A/gn0upq"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gbPT55M6yz9tm6;
	Thu, 11 Jun 2026 03:00:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781139625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDqPGUp99kdvfGBqZPF1+5zVeTXmq1wN95svWlPadWw=;
	b=d3nxPABZk6Q4MbTPemZVWnitupGqEfgw1OgIoIGc/lOM7bDSnPXaJ/WC71xlz3MgShRv1+
	NKWy5JJZS09CJ0ZLxybYyEWM3Fc3RHnhR3ww4MOKvEdFccvDjMugu2ngfZ3gORnwGq0dhZ
	REKqdlvt3u3fzH44R6RAOn01c/MO/MoZNOPj2yplx2UN4NO4+kdOWKbHADhh1hisnaOPmw
	252gJeJhd9ZKz0AyxG5zwVJ4WsaV6epGpcxbvR5izGHblDxQOXXBT6ZhkLFQGkbJ49zCIp
	MBUAHVkI7q/ho7EOCdkq9NCmTd3UlJbhsNwTKqjQ1elE+KBuzIvtqxNSVojh9A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="A/gn0upq";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781139623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDqPGUp99kdvfGBqZPF1+5zVeTXmq1wN95svWlPadWw=;
	b=A/gn0upq51JOgG9eNWbtPQ7uz9t0XVLyw1wKHC6pu8sKUpHoVGWMK0XhwophrBNiu/BKGF
	VaZ+6F5l4GDqfnERFUOoZ3fpqgTZ3+/rB4ef8f4zHPB3CCEw26lFExRMOvgCCnkR8amr9c
	H9LFvbvpw2g6GeJjwM5RPb9ou99VIPTMVTgu0InqBGQQP323oS3C0o28CeeTZajS8nT7Ct
	s9MQswa5GEqqVgc/yX0N1x4DhTpjuCD5D45VIVY6EqxAVdBYs3HNxgCo9RhdlaptTGWyAc
	MhutJIDhdrSdiIhp5nbuMWckUA6oQNBuSFeaMctCXV9P+RP1CgDxJmHb52bCSA==
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
Subject: [PATCH 2/3] arm64: dts: renesas: r8a77965-salvator-xs: Enable GPU support
Date: Thu, 11 Jun 2026 02:57:30 +0200
Message-ID: <20260611005952.146825-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 55d97cd60b23676f93c
X-MBO-RS-META: hqm5t4yprqfwp5pufsmmuaitd6durq7a
X-Rspamd-Queue-Id: 4gbPT55M6yz9tm6

Enable GPU on Salvator-X 2nd version with R-Car M3-N.

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
 arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
index a1d3c8d531cfe..f0d9c0124f69c 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
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

