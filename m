Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEDE43711C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 19:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994768; cv=none; b=Iz66Ih7UPJwFF05wOkTLV24Q/YY5mWiZSObt3o8ywHLUNnvYFvxjekzrerA12/teagh0GmS7zL+to30Bsash64gO90wF99lZYYyKNa/MMwfbd5JPPYNr8XecS+/KJJZvYoG8MznhZzu8EY61f/uWOFgzT/coOZdu+kE3DW4TSJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994768; c=relaxed/simple;
	bh=m1g97T0KsI8+u2/mma+fo4wXtJYWPRQtDXxF8ylWrvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mY2OqzHlSG7yw8cKknSZ57cDx1cbYg4tOxOAVnKSqNAFof1nsNcFhULPxie1KTUCHAvMrF/eOhN5hJtkCpkSHEHQsZzAtZjOnkZiqcOQOFRKCj5lNYsRaN0ZNkhIYsjFmoHQjIBa6M2q9NWmGKXXORRDzCONkVs/2Yu3EESa5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeMWyMG9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeMWyMG9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d530328efbso33138485ad.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Aug 2026 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994767; x=1787599567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdPzWqXXmK+PEpzF2FUddkIJQuQSykw2wIqGTSDwjWo=;
        b=EeMWyMG9qF51p6EmfCbpgubzHrya4dCICsQnjkkRIo1Kt+JKPRxAc9zMBvinEpuJDX
         V1zhLHy8d753KgT5aeNTqEeCnfRMu4FYvS8GY7kTM53Q133uC/dU7TFvGgxA5kKe7zxT
         czg1Uae0GMu8wrS4qEywCy4KP72BfybPbBQRqVoq6rJ7ypupJZnpUAEe/JxpLNprEl8D
         wX8dmAmWBa9fuFBjzW8r5AJtP+MAA9WawcIEI98HARJ9liwK0H8spcCK4qQuEkIpj7Cy
         gQG+LARzlXL5c4ECUvH0VNO6bi4yd7KzLAQQbQ+8tFowpH1s7G3D4/B5ovG5O9BFCnV+
         UQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994767; x=1787599567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdPzWqXXmK+PEpzF2FUddkIJQuQSykw2wIqGTSDwjWo=;
        b=AscX1zVYh3o5MZqRjrVgIOXRc+LhpiMlX3FrbD4vr2MxlkxSRZV+Hne3fxmtmkWHSE
         3+UY/LuWGsmfZ2zlVX8JZuXJM2S/5D/1tWwisrZ55hm1RlHVU7l1mCZumSp3p0J/YojY
         EdIsFWLDwVRK1FXH73tQE1kzfeypvdMfxVEobgm801V/St5LBU3tO6/jPL+kY2u6I+LU
         ZVSGPi84/GbUpWTfFs1kyvpYv2cAu10zudh+tCDAelIh/w/tWI9aXgb2vYKc0cM5BD31
         N+7YbS8DmOo8Tg7jTMjQfdMOmCQ84CzJuCPY6OQbzsrQxZmkRFHkJj9dIaz0JxgiZWi6
         9WAw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6fdaMZR5MwlPRnaPqp49H+2gHNy8HovZnQMKj2jJAqzvAEVkN6dZlbQGi9DhaGsmKu65WoZHS5ZZIC80ZMdnPKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzzunJSppOgLCOMHxjZMqYUXO3qqyNX/p9vA0rqnzLXbNRAcD
	Ool5Dx8JdmuBlLu84rNSR4GIZ0AVhPB4GwmLdjEZXK/IA0FdVZ/zfh8F
X-Gm-Gg: AR+sD11f0LcP0OBvqbMqqZe/8fkyUxDrUqu01ID7oA2MtW8bYt5xwVsrR2tc7h2eHRX
	XQvbhALVdniE/jj9uKW8LtwcxttxDPDm6x5BGrAecJy3OzgBgNlCxn5x1EQ19PD9fem6OH3VXDa
	y5AdTi2Sq7T47YZ7VMkRR3ZUXf9h4EE93ex0bCx4UK7q0I6Hp6ROQ79fRO5QasSal/8bdhwvmBe
	scPr745UNi9OnzEAY6xAEdPe3MmmXR9bFX157t4urANLPLJSR8mV4IS2tmXLmEMdaUTSZ4MfT40
	2wDQf6DggM5mfzHKMDbkep4UQ05Ej3VXl75LE1+5fmzmVVJ1j3D2w2TwYggk4bqED2+YzbZVOnZ
	VrGX+OWkyqHluf368IfYzEXSNxleBlKaCQH1FzAewIEkIla9xd6WZecVuxEFT26Ls2gqQ3MvcHS
	U14jMFeWCIH2PAXbZhFAKe1h7RveUUdQfqm60hz7cLpGlL0Q4pdgWfsgxKkmpxN4SwkisooMcwq
	HYt+KHt7LV1v0O5eGVaJ6YoZktDR1AuP5o9owz3ikAlShBesP7uhN60HGcNGRe9CLtmDj3mQxqE
	TykKvu3Ccg==
X-Received: by 2002:a17:903:1a0e:b0:2c9:d55d:2d3 with SMTP id d9443c01a7336-2d5c5148ff7mr25131325ad.15.1786994766706;
        Mon, 17 Aug 2026 12:26:06 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/7] arm64: dts: renesas: r9a09g077: Adjust CPG register region sizes
Date: Mon, 17 Aug 2026 20:25:35 +0100
Message-ID: <20260817192540.423994-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Increase the size of both CPG register regions from 64 KiB to 128 KiB.

On the RZ/T2H SoC, the CPG/MSSR block is a multi-function block where,
apart from clock and reset handling, it supports other features including
clock monitoring, write protection, and peripheral configuration registers.
Expand the mapped register regions to cover the entire register space of
this block so these additional features can be utilized.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- new patch
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 33f953c110bb..de20bed2797b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1075,8 +1075,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
-			reg = <0 0x80280000 0 0x10000>,
-			      <0 0x81280000 0 0x10000>;
+			reg = <0 0x80280000 0 0x20000>,
+			      <0 0x81280000 0 0x20000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.43.0

