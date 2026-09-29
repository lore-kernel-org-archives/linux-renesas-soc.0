Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298735187D3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686135; cv=none; b=UGM1rlROq1ia/HXj18cnIXl1ae02EI6xNlBHoXnQKiu46+OwXoGvWL0fG11ZZJN6CyIJlh23o1ku7guCDibA6PfS76/XU75Nf0/SBHvLU6Ljo+BaFFUu7DPWDgXr+sHaJn4tL8PkFDxQ0CNYbXJM/6AHIJLjSNZLmL9l5bKKIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686135; c=relaxed/simple;
	bh=lSvtUglAx1rTAxF63r2sQiaH4fhCBzuyiTNiuauSmaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ycqbfy24/FkbXECyYvBLAXh4AivzlYsdAyR/wqEm33KMj7nqkmpMnYt7S/TwNp6HzuN5YJD+/YTGXxUO5TpThLAvnTXcoY/frL0M5JyCghoFChlXbcNRYsl0uRiZr9eIR0ORFZrlUfRa0atqdMgSe1WkOC2HeHujU8ZB77nWB7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFZHQPpZ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFZHQPpZ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f635552aso3257093f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790686132; x=1791290932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epA+CdgHUmlYYpLGEczrqq9cajap1pyqUy7Xk8YH2fo=;
        b=ZFZHQPpZUvy9TEu20hbFjtKkm/TrurU4SmIUOVJStUxCpr3vmyiuT1nN/EmxyAxKv1
         sFAG6pLa8PCJHWlpUTojcjR07vn1lqKjmJhXcyAgJWsHLqmD9b4tQlX0Vv3ix6tjMii+
         +KPogZ7ASDKiQg6hEjVxKCq6JcY0T7V7MIJh7rtpjMtSDcpmPKEQuU6LqGvuk51fXgKN
         CQq1+JklMehnSpraYkmUyJOjOtR9BIs/nJjXAV9dpOKrkI7Be4ftHaZqF3KZkbp+R4Ri
         eg+re1OnWUckdSXz2/8U8Pvqt4W+ySGhbTJ0374Vpqk1xR3xWaV4i6Ou/mYJN+iwaubK
         Pv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686132; x=1791290932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epA+CdgHUmlYYpLGEczrqq9cajap1pyqUy7Xk8YH2fo=;
        b=mOV9R5DghC0M4SLoxoqPR/56uaB4VKqhcbnUveRK74ARwuZyZy/qpx0Xp0rYz6eXEO
         TvF6gSMPbpWaHoaPw974vgS0JDHIV+QXnDK/HjNlwONL7eo+3o9ZkRH7HbL0cWXlFek3
         ds7ldp1drrA1AovanTYezQCjaLOgo6LUYxhBZ6s5ksJ7BIu+Otxugi+JKgznaIZAaDvG
         17PAenasspwwKMIz7NI/mqTGRqnkuyvH3eoQFMDwMZuuPlZb8cqFgXA0PyVKU+Swr5Mg
         XLpEwMCMAlJiDuiV6OgL/Rkz4phOexDvFjUfg+z7V1d58aCKirZS9jsgfLhGsEQJZ35y
         OFCw==
X-Gm-Message-State: AFq9FYIQB4y3PsW28QmwcGbzCJbjPkUxwKVdQ7P8LE5mPGHOT41LS0k0
	+tGoQ1b1EETBWsqogAjIX1GjCxoB1GkzgyLOuqjhRass99Zck8ibnlQY
X-Gm-Gg: AYBFou3VJf5rG0akdzxrGO26dz204fVG8Fq60SxYs9tHVs4N2ND6tYnaRMEeNfYfXUS
	O8hJ0vfF4RzabvFAUvkgByEbK7UcOFKjGsrTHgxZ9F69ji6BTMaNoO9/BJtYbm9BuzeX0c4XjM0
	w6TY7BoJbMtfMRxjDNZ6hBBSZty7plBElyTBhYum1W6hApQ3tBtP3dyBMbNkKXRtz+33MOYrt//
	tucgWmadCg3Jp5X1sgX9gEtpaDHcFxufnTrbr5BzUD8h6jteWipOPJCmH0IZBswx6JWS1NJu3jw
	fwzKle1keVUGvTs4PJ60pk7zqNrU0jMVmaaIpG/pOx7vrBidtMUnRaqE+xih4c0pLFS6G3scN9s
	oFHbUUagPGyg1E6+r2eRjEqf0qe603bshrIqbUdFsa3gt1B2IHy3zw4MH7bQ+wV/E0//SeUuK7g
	JZ0Hin3o/KH2j9zj3A81pTwF0O3RTLcD1JxCB7Gl0q2Azls5K0Dv0K7iH9MKPMtzu5xBh4g2pPz
	HyQeTAT9cGaqf4q9qRVjAEtcRwWPL5my/4D8wjIYqzPsQoE+NNHTpoYsdoIlBYVwExrsG2Sjle6
	UNy3iH1o9806rGFmdQ==
X-Received: by 2002:a5d:588f:0:b0:488:ba61:e3be with SMTP id ffacd0b85a97d-488ba61e623mr13300292f8f.46.1790686132400;
        Tue, 29 Sep 2026 05:48:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50abad2sm3439942f8f.37.2026.09.29.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:48:51 -0700 (PDT)
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
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable ADC
Date: Tue, 29 Sep 2026 13:48:28 +0100
Message-ID: <20260929124829.237997-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable the ADC on the RZ/V2H EVK.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 0926ab891fa5..8939e35639a5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -130,6 +130,10 @@ y1: y1-clock {
 	};
 };
 
+&adc {
+	status = "okay";
+};
+
 &audio_extal_clk {
 	clock-frequency = <22579200>;
 };
-- 
2.55.0

