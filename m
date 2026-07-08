Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF7B435EC7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528399; cv=none; b=qGNJWPkMwImOPgkK7qRGhIV+ROlzbuWZFPQ//+Tq8LqjZU+YsdJ4/HaBTB2jJD4nLyqCCqRTc1qAJDe0Hp+52Vcac0gKz7Sp9V/OUc6QEEb4CPQXM4NEgmBzN50Q3ZdZWxKScI7YfImbcpyleWXxPpT9n3DdR+I/psyEKHE2XKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528399; c=relaxed/simple;
	bh=wyk/xM3ADbKZ5QPCezueW1oPACFQtAd6OjaDEzyDxwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JzblDXRV4Qu5imyopq6H5M35eCCi51X8GmQWxJcm1bpe9YJq0EC5hG7bdxi53+QF65nShI6TrqSIqNwU2f2qUQ8m70FW8PlunulEk78EtxV8C2t7O6CXxnzjzWW6ZTd2faX4p6VB+PBD+mh64Vq4c/xuL1urYk3m4rEqlfk2FT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbOYI0aT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbOYI0aT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so851841f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783528396; x=1784133196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBjGhmS+fP7ovy2DuZDgJwEAVTUlrOrDD2aUojFKQQQ=;
        b=bbOYI0aTu0yDjfP3gWKH+PZiLPjb0d0fgVkXTGQpc6rc/eo5m9OOOsYLrhiLRx1Kg5
         HThNMiUU9/IuSzCkaaJ94KUKMeEPGb2vBDVq9ncT2ZYlRIpghC7WB5BRUja5323N0skr
         GGJw59x/q6O/mOIMaJLiIRsluvRXViyP8cm/MnUkuz6Ds+IZPSadt56nStUqRpvZus23
         gltElc+XT2IlMp7UWsX9HtQQepQ4EEl1n7S7tZxVzOTk6QN+D5t6339bRFIamVaudNct
         UYKrHjhE1vImBUhEiuwUkJJy+69WhFDAWgAhYq5pT1fW/BdDqXni9KiJMZlaN/proExS
         hL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783528396; x=1784133196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBjGhmS+fP7ovy2DuZDgJwEAVTUlrOrDD2aUojFKQQQ=;
        b=mLMzdOJ2AeuifCQg5n8xTkMX/cKi87fgVVSQ6JuWxEwOXQqlFfNpPwkwBIGw4BJ9Cx
         +qsbelXnQgFMANlyWC0UgyxkkfV81LUk62iktElrzArA7ABfSFHdUkyzfNQ1Xk/2QE9r
         EFnJVpVUS4oGDiEEpip6lAfTtNdeyNSknT1jxtZM+EKu8czBO0O0AAt8dNTBhaao+fwb
         aeUyTecbuxRlwR4tGqXwsu39Xw2rQLBCHsrGKPBIExaFXR+xpGm8MXxhaWv6CPQwQud5
         XTRzOz2FmYI1piwaKG+aED7eOG58a8DWiqwSDX9Oz9ryQTWegtxVC7/JeXd9Tw5JRuMl
         xTIg==
X-Gm-Message-State: AOJu0YzEfdfLGZVJtIkzQ0Q6dyYBTHIECUEoh/kHSfNj8Xrk6c1aMgZv
	mShgBmsP2vCJ+rP+P00Xxx8FrHYBxA/9DITGlqtYvprK2twRFCpxhfEG
X-Gm-Gg: AfdE7cmQcm1BIu4Q0Y9VWhXdfmMX1yHSJIESXBAIvIMliWP2qpwZjtir+v0JdSMYYkt
	M/AtaRtBvstt9txaQqF89d+0IdjoOf1UdBsZakntHJJcGAZW4k1Ugla2gecnD3CpeOTgUYAX/zo
	wCdxtR7HCeyATTowGKn0+zbACphXyWYVpM9CmknoX9PYGVS/Wshfykb/LRRdADmZlmLqCnrM4SE
	sDpvR0yi0PPpWTzgL0a1B55MSFX+3pjLcfcOOoJeU009PPYjqdGG4kI4bdoNNcScWkC9gWwUQHp
	XrCr8jij3ICANGRaiYdhKZH0KojW4rxOyUHgcjRuhzkLE7dLsgiSYeYmMzWLr7D0TsvdujEA+zA
	VcGRWE+FPsNycbM+SanoGYhMMrvuklCcyoI/eJuPVV61VIJ3zLa9cfc2pJQgs6/OmxuOL0LS6bn
	wEW5pLCZVodqCLsXkgGQ6Chgjh9lAOvGg+3rYMePD//RjhgNpyCfTdcJ2ErrUEUaE1MjMV6ulQy
	ZAvDacdM8wgk/IOCL3D/m60rEA=
X-Received: by 2002:a05:6000:2303:b0:475:f100:35ff with SMTP id ffacd0b85a97d-47df07896e9mr3637017f8f.60.1783528395671;
        Wed, 08 Jul 2026 09:33:15 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm40184167f8f.30.2026.07.08.09.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:33:15 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
Date: Wed,  8 Jul 2026 17:33:11 +0100
Message-ID: <20260708163311.222176-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260708163311.222176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the PCIE1 slot which is connected to PCIe0 channel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Renamed the node name from pcie to pcie0.
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 3c1ddacc0944..637fc92dcc26 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -384,6 +384,18 @@ &ostm7 {
 	status = "okay";
 };
 
+&pcie0 {
+	pinctrl-0 = <&pcie0_pins>;
+	pinctrl-names = "default";
+	num-lanes = <4>;
+	status = "okay";
+};
+
+&pcie_port0 {
+	clocks = <&versa3 5>;
+	clock-names = "ref";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		pins = "ET0_TXC_TXCLK";
@@ -430,6 +442,12 @@ i2c8_pins: i2c8 {
 			 <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
 	};
 
+	pcie0_pins: pcie0 {
+		pins = "PCIE0_RSTOUTB";
+		slew-rate = <0>;
+		renesas,output-impedance = <2>;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.54.0

