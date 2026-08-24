Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57B3A7F50
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 08:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558413; cv=none; b=RmuMFkO1ReoOL+y0jgyMEAJzUoonLRLauiwCYARodD/DS70F1Szzs5nMwo/zFWAnwICVZMm9YIo6QPmcNFyOKjWibh8cTWVweGI2SRPgcW3LMKL4jvR5sH6zTL4b0pZiB/Pt/NbGCH3bVZLJZlKaspdj2Pr2lzj3rEQaGJkJfas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558413; c=relaxed/simple;
	bh=ycS9iyHCfiySCdZ6el38VdkD++UrtsSYhhFfoX/jM2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5VLtzwyAtXU8D6BulMnaReDszDLQTb4NeFuVp8z89J5vs/3U9oOuJTKmxYiJTbQpyssjxFxwckcfz+X5+nqjAqZlVRCyes+KkJi0DCZHsgpRX4XeaG8AE/p5d74f1oUCRYMGFyQ0cnkrw7XdOj8l0gi1ZMSsnI5hXIOOjGWSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3oa7HUA; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3oa7HUA"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso2605855a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 01:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558408; x=1788163208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnfIpiizNz+uh0Nm6+hx6fazu+VGaeVW2k9CDNJDFzo=;
        b=T3oa7HUApnL6YQx2RdzGiqEUImvk70bciKiwbZPq43fG6sjtl9hFmVKjpUmU8yocDG
         Lim90mnAPx+kCSjYq0k1E5zKdcZicEHBHBlahfFZoXw6H4p4nZeMjqcFE6tF7kvdMik4
         ne7roHKiO2WgaVpp1qUhjvuR5eLnOoViwWjj29+OLz4uHUGkXhUDjXaOq6XmK5t31oJg
         zFlsX1TX8U04zkiNkairXiUIQ49uQcG7Gzk4W+mc4QWfTLKX07+7q7N6aQztnCKMuFMY
         zEaViT+UUVX/riNHGfqTA/KYbxFenZtvKY6GzhOTTZzzRgXU4fXna+2sIywlNP4UhXUa
         2bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558408; x=1788163208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnfIpiizNz+uh0Nm6+hx6fazu+VGaeVW2k9CDNJDFzo=;
        b=S0DTLh/EoLZWBKjt9bV3eLZ1wBV30kCNn3MFiGc+H5WLNJYnHyT1Tdaesf2hgQcwCj
         HNHXSQBRyJaVtJ7MTlc+WXbBkmyznFxhDzwE4vJJIB+5ota8XH6EGyN9QTiJXDeqgc5j
         4cZVzMZKeO70V5ZfQeWjAuXGjKrxhnPQzk/3qxIlRLyCB59G9LIyiK/8UTtiAMdCxhil
         02ZmRUdxhffQpzAsRCSIVxqTIidauq8e8uoubwsnlZVDgnFpek+AHLh57y2zX9+vC7Fm
         HtyuPeN+kxIFKGqEj3C7p4EjIYwLzLwo8TzBQQizgNk8cPMxJoexxa9Y2mdoqQg5MTXB
         jwpQ==
X-Gm-Message-State: AFuF++lTq8zk9EWTL2i02BpipLH46TsNhNDEMPlIJJNeQZSyinMlnOzQ
	gYL4nou3JSVo3/IWD84iMCoivL9bI3E8NOMBbTlRVX+JTwKbXitk5ZTy
X-Gm-Gg: AR+sD13/SGCePXzyPL3FrozoCOhqH4WuDXhmz7llG1stwLTEUwx2yZN7ygt/+H+9vU8
	1MNRPmu8mW0NlqWNSrZC0EEJX8PUIiTlknkNLv302YPkNGvyQnggaAJPufmM5tUWgdtzKQMURes
	+iCsqVLNZGYReENLgf3AemSWE1s8rF2MRthtitBVWtaE8S4zCHSJPZpBYmpUwO+UiQ2rQDZAJ6l
	K0jhEJ9Wz0eJG3VdxPxgW7wqmPkYuYsV3CvEJTW+8//o0haFlAv1zv7F0ipgrU0EnykR5WEvuTP
	HDURISinNeif8+/GQ20BqYc5LPML3V1eflDVp5A++B5aRrQmgXHabg3gobQNuEzcEmjAJ+uYUrh
	o1E0R3GvNgkcxbs69zYYgAj/6hUqSXQJCzmL1p2pWHQ7UeJXip5q01VpbQIot4IR01BI71dy+Jz
	jLxs4E5Ur0EDWl0iMH6SrZcfrqiMKTQCi8Xe4Q/LiHmytTGOX2Re0pwa5pLDafoiV3SCV2mp0qq
	Lmq5n6JUMxyVBISFeB5Ka8QFBxPHUAOctjRJkgz5i8Q+k8CKDR3xUH+ZC4+G33g1Qee/YmI
X-Received: by 2002:a05:6372:a749:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3cd14fb6375mr30393359637.15.1787558407725;
        Mon, 24 Aug 2026 01:00:07 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.01.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:00:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzt2h-n2h-evk: Enable RTC support
Date: Mon, 24 Aug 2026 08:59:36 +0100
Message-ID: <20260824075936.2904336-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable RTC support on RZ/T2H and RZ/N2H EVKs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index ffcc0960903b..2a8414d6d632 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -21,6 +21,7 @@ aliases {
 		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &sci0;
+		rtc0 = &rtc0;
 		spi0 = &xspi0;
 		spi1 = &xspi1;
 	};
@@ -514,6 +515,10 @@ xspi1_pins: xspi1-pins {
 	};
 };
 
+&rtc0 {
+	status = "okay";
+};
+
 &sci0 {
 	pinctrl-0 = <&sci0_pins>;
 	pinctrl-names = "default";
-- 
2.43.0

