Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499EC3A9601
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558409; cv=none; b=R//AwUEOigG7rIjHUIbTeUIgY/5pjAFmC9C7VQiDIa8HV6ONk6JI4wQ9kxjC5MKbl7cRi+nsDZJpiyYaN3sC8Gr5PEP8DCsxI9+jU5rdayZEM5zPuZfE4XnHA15MJuCqf3peW2XwBQ+T2vkndwx9TUilDYd0A5495f3+LYzoTyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558409; c=relaxed/simple;
	bh=VTvJrfcXRxhJIcMkkeFx6nrIodiOs5dES2+e3OOA57Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmH09ltdT6o+n1hoXC9mROzHCNdQpoSLQ+7xQXvB4rrUQbljFe2Ss+PtmLFHXwEkEwE/3aNqF2GEdzVSa68G4ERYbf8KC+kNFkLVsV9qmbkVgNvN6dGO4MCCA7xi0OFOH/36y9Slb/c+WnM1A5qQaYK5yC4rMimQ8ftCYnqTOvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKbLtqBD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKbLtqBD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf52d15d88so25876665ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558401; x=1788163201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8IuvDoTOF0GSX+Uv0Be9lhsnyNDUYu7WABwGwiy8F4=;
        b=AKbLtqBD4UrX4mqct8aMeB268sePu3gL9GRQyfNWH+SBDIcldIz+Ko59IsYbyRpsK0
         FW06o8j0Q/+2qFLVjN4iB7fWaOEtYyb1iXgUP2S/XmYLHZ9u8jZNM1KH2BXPNiie57Lo
         FTkidyk8oKy8sDi9SDjUmK5gY1GEdxbIwXB3ggggTSD81Eyz9PsNUOoeQONdtIr4lRMb
         AdD1qyAiJFWFbOkfls8eqEL1EQuKM1H28d7AINSknwZ+Haf2lsj9DAVb554CkF8tm85z
         wls8fLyGJxTsgR2v484ZkyqOH0LfqDenqD9t+QZVOA88lbRz9a8lnheBmmpCm6qfvQJr
         vJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558401; x=1788163201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8IuvDoTOF0GSX+Uv0Be9lhsnyNDUYu7WABwGwiy8F4=;
        b=p78viMTuCEFXC1njMCr1N7jiNshbrFGdmhCZ+3gECOMcgpwNY4UJrjToxG1MkNDwkj
         0cUnzMDXAmSo4Bdkh1+W5nFjvH3Rsq/1RTBuJdATlsMpYgL8QvOTzVY/rP8Vo2QHKlzu
         /zbCdq2Nz0soHZxZyOIJIqmGweb/ZE/ovOdAvgL7xE23cUgd83tqAgjj+hXck4CSBtaA
         gFZuh6JgMMPLDd5ra4xYOfhIZbze5wwgZ/rHHsY1TkPyEXyGXha0hVlbJo122InWCF2a
         1hOXwUPlSYm9GuGc0lSDJr9vuBgeWLN+SzKJHD5TtcBaPif0ktEKwDvnhZb4E/PO7w0k
         trzw==
X-Gm-Message-State: AFuF++lKw/1CKtxgdgWYBh+f4Nstfk8TXQ0a19WRTnpCHmAIAtnbHST2
	Aa+wUGaqzxNq6hkudRlCqS0spc5tMmgGHhP3BvUWzO3DRHNQyT6J3oAC
X-Gm-Gg: AR+sD11+o5vXdTZawEaMe409Lcg2CF0X1PVB2wpzymVTJwK5crEAF9O88b1qNxgGtaA
	Sji3AwwrVJ8asz/hBgDQhfWTzxWD7cg2iR6CyhvF+07cK+m6qS9PZpecyumNhPbmbph7nknOAfY
	NMXGBOc7aUYV/Faz/5p0zmT77ArVBegwQpWpjkCmoxQfdwYP4WsgguhdW+mBHBzaj1geFbWvPyH
	uw3F5iMjHAXcBw7CF+r7yeuNzDhPtKfSyXo/SzZZW7cocAe/ZGwclto0ajieU17N2Q2T9IUNyCZ
	nwFeA/kFhU5Gg6JWCO2O+OXnMEaY2ytK+up2HpRZHailo1Uq3nCUTWIQY8IxIBnjFEKJTp4q5CS
	F/n2nbZmyM/GT2G3LyV4N2UEYy3GaUa/77neV3xB+oIP+0sDRivk8/DS8qy0CN+EM9eOHUpMemH
	HoEYrfmo68S1pdkpexcZtRg0VhmN4B916QWErvLn8F5Lxs+/NMrydh5xCqQrtjTfwr8MAlF7All
	F08KAlLcR/UKfT2jtPNT/bFmwEYynwe31UcFqjM2XlqFGsRuyT8LySViy7XHFLWFumF5H43IYN1
	Aef9AsA=
X-Received: by 2002:a17:90b:4fc8:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-395c3573cecmr45259413a91.4.1787558401348;
        Mon, 24 Aug 2026 01:00:01 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:fabc:2511:c0a8:be1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d2d1esm24887994eec.17.2026.08.24.00.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:00:00 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add RTC node
Date: Mon, 24 Aug 2026 08:59:35 +0100
Message-ID: <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add Real Time Clock (RTC) node to SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index fe9003426d70..d5b3eb6c1736 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1176,6 +1176,19 @@ pinctrl: pinctrl@802c0000 {
 			power-domains = <&cpg>;
 		};
 
+		rtc0: rtc@81009000 {
+			compatible = "renesas,r9a09g087-rtc", "renesas,r9a09g077-rtc";
+			reg = <0 0x81009000 0 0x1000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 497 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 496 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "alarm", "timer", "pps";
+			clocks = <&cpg CPG_MOD 605>, <&cpg CPG_CORE R9A09G087_PCLKRTC>;
+			clock-names = "hclk", "xtal";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@83000000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x83000000 0 0x40000>,
-- 
2.43.0

