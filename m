Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A951DAF6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686137; cv=none; b=uzVoTzdFKSk8W3Mb1NLZiYUaXERm6HIb+L6ofYLegVJdHUWoiASNuXPRpxHMGxfPrr9WSLgpmFbno1KsNfMv05/2n+yKpnH0ZKo3HYohHPgiJTSWXtWw4h32bxKXt7wNRixR5hO57TY8wK9S2LrXi0UQ4W2cuaC4217qSyRvo1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686137; c=relaxed/simple;
	bh=3wEoFwaO0iFWgcSRe1rBVJm/B3HLnQlNmpfCo2dBkHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxdl8xOeoXdj1l1ig98ivBtGRJB/J0Zg6Cng4baBfXl1QSpyhRdOW8FRwK89zMCC9FXJGmk+K4a6wOVEQSlHkWq5xfvadm1bfa4OZ+n42r0BS/cJydWAzR6zWnw8NlEPboqkYmwOUNe5wYAB6PNZjq2KmF9t1ab6IWqH9lUqhXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9CHs4Xu; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9CHs4Xu"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so2962333f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686133; x=1791290933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wGmpRNkgFTWQDnXT7MrfhvAHxqpIIx/rDduJ3KFylU=;
        b=R9CHs4Xuryuj1LFejH3ldj7l2/tBZl9TZJIT5uWwtRSy/SoPpKeekG4zrmDd4hTNqC
         HZu+kd3lD0Mj99MSY2TlEWvMhvfcDhrl7r0gkWXidQdWQHl8V8Q+uPcuQEHMFDp0PdOi
         9Qzr61dHBBHxAbNHmVdNbEnY9xqV4/3QnzCNSRXNNFCjllZKkPIQaiiFoLdhhrsFYIDr
         EwB5yi5xpWC4G2Ur2A80AYNtJBWHt62Lc954U/m2bgCDoafs7wZoJo2ufD4OWEktkhpO
         Rfz0AiPLDFSB9T20IcIRbhmS5mixIXIkdoLU1ixtEi4ycYIXj3qgjOIn+Jja5dFFORQe
         m26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686133; x=1791290933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wGmpRNkgFTWQDnXT7MrfhvAHxqpIIx/rDduJ3KFylU=;
        b=BA7jbIGb2Ce14I+OXQLZgyjtNVpL4dFW+m8vqLMVsHzOvIv4UT7Nfk3UfrGedgU4dM
         VGlj5uk2OZOVzP/Y8eKyIQfjkybYHlI4zpz8fp5gUamqnis9h0jGKo+QbWt3grsPboUo
         fFRnWJ8QkEFD40f2kSt0I50i2gitnWoH8lBZ2VARG+o/e+L/YwQ5hj+SRApx3pwbx9qk
         iGQR9B8dp9fMgbit0AfgKJ0i4Has4GKs/qX002lVh4YZZ3omP7dqytDv6FvDH9dhycA7
         Gv2XOf7P2EcedbA3K3pbTacVydnA5lOgJFbsvDVKxMLy/zUE/kbiJkcW3Wjh/tDcnUlc
         bNsw==
X-Gm-Message-State: AFq9FYLWMa6uN4umR73VZ9gotV7M4a0Nm+PfzA7sJnIVQD6ZGg0PvSa+
	jGhoKtzCGs2qef8mAU1rGyFrfFS8lckWLgMIB6U75b4LQF6M/XS1P0bi
X-Gm-Gg: AYBFou1abGhR8xoIudrGSwaKfxVbE8SWAceO0ZT7nLPh2hSAFsxkYLq15xFW+7LeQ4V
	cAMLa/xJRZyY36PSVPY8UQ5sOXw4OiwwUTdxgeD/xdDMY62i2i2Yu6uMf9Q7oU9BHgEAWef+KKE
	MiqGUNpF67xaKhyGz24ZODmUqxaPsw19w6pNqa0Y2DHbk2sOSKX3+r2jRBYm/YRWDBrTDiDE2Va
	zFYD+QiS8sb6OjPMm1idPH93jxQ/hTIUllN0DFoOlN8XY2a+HAa4min1BpooDwiTO5pfbVU0Zlt
	TTExnn1RogWvaDb5/hP7oMWHPfPYxD/wTc2k8dylL/erQrZSi3JKHK+oKbpm4asz6fiF8h8vfUe
	Uxsjy0Y1WvIE9nreV3QtRWj1QHRavUEQDqU+Aa4RvXw0MeXw1lLILkyG9qTbxbdKhJndZ4u6Qy1
	FbP5pGmgOlfhgn8pPMh5eCi7Q+uppGLAoisc5N8XsOPxqXdnFGv6sPXL9wDuZ2FNBkocwlfwbrP
	gfquLanfFYrWe2tKU4yXJk5Tit9nopZAJiH/ViPtJifx4Knajk1pI0612/J4FUvTMCI4Ibeu4rA
	Dt2Xl2wxoR4gehvwhw==
X-Received: by 2002:a05:6000:40e1:b0:487:62d:37d9 with SMTP id ffacd0b85a97d-488716a5e3amr29250652f8f.27.1790686133236;
        Tue, 29 Sep 2026 05:48:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable ADC
Date: Tue, 29 Sep 2026 13:48:29 +0100
Message-ID: <20260929124829.237997-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124829.237997-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the ADCs on the RZ/V2N EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index c43325dd1c55..5daad7f37e3d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -122,6 +122,18 @@ y1: y1-clock {
 	};
 };
 
+&adc0 {
+	status = "okay";
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&adc2 {
+	status = "okay";
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
-- 
2.55.0

