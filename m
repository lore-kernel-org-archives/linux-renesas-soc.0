Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816482;
	b=zNq28aRBfyu05frcmztyq2TM3HGLXsj6rul5X48/tUKY5qywrFPL/2PhcUjISVXFccqi
	 x0z/RNLAoAqm1ZGk1835SsuwZFsmZ+3Ci2nHNDN1AQV5q084aNCeSR+KJ4BaNqsDtZXHC
	 Ux1pEvJFYeACONVNb9F1EgH06cg1bk0FAAc7WH8ltD3y0nE9MBp/NREq2CzkWUsTWKejs
	 xOnpzfWDrjaztSHVt/Yk9Y+tOwzLMFWnXUeuHUH539mRbvqKXUMlpVKH015qmH0m27yDs
	 dC0jbWNcg6tdgXWzNkyhGhoYw5nThIXtrreRsb1kTGlvNMukxhqylMjGuFD4NLM0Lig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
	b=oAynvW3LirE2R3RkYB6msapPJrAlDMjhDCsdqDpwuDf1E1qBvr3zLYJtFaftPJgaUPsy
	 DetMkUK8yRpqn/huaLTRPulkNbFJZTnXBv8o/VUkucwgTfXH9oltQgjhcFKzYaqzlfizR
	 9bWV2+wy8xUweTNTiyCc7wXYr62phSw3OhvhdG8VNt79C5+Vp1JpqNKpTFlozdRP9JGKs
	 +eiL7gqfGsqL0hhN3sceLfXWc5UqHcB5L7pvIBdTXB/JE7wejCwWOWZchWJpfoaSV2mlW
	 3AJBetTP53SszNi5/+beWxEspvfA23O+4oqJdq2v6UsYCjNPNGSXc9YL+qoKTUspzFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776F608362D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7776F608362D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so6416635e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816481; x=1794421281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
        b=B5corqjge8lxXP8hH2NNrMFHeSd6tqG7U2fOuevHtZCjzKMBlC7wko1wz1Zc+QvhOW
         GguDbv+6DYxVrQ2PS/Jm7KIIO3enikMFBRIGGeQGI+VXDYF/+22Et2ITlZVCVop7/Nxi
         6AbajOlVqPIfVFAQKhBq9aQ5oTCoRFpSN/tJmAvj7/jbDsjVZlt8h/xdSpCHTYI/xjEl
         +tLpuLQC6Ww2S/IoslY7P53atZ7Ddl5Wn3gpNf2ERsj3Bm3+7TTCvvI5gfYqMCWp4yQr
         LVWmEdX15TNTKJtr9WGw4n7yrWCe7jEDT2r68j7+9XKc2GoRD0NpHfddYBrUBfRig+9k
         wjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816481; x=1794421281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
        b=2DmSsUKXTDUdQq24oXNXIVoRIz9+JxCSLmWDEZhsRLZSD7DMtA5N2JA3plqmTnLLto
         CDL9FqAxwYyXM0ToeQ6mlGYHUXYVfALqVnAWGDwt+BCe/Btdn0CzzT0UQ+2MpACMu0pD
         HAHn64g6SNazgX0cWO8/ojdWrrv0aoIfeXiw1NdGF95FH+k33zseMsatCdVKzlVxkAom
         Rwzn2Jub17BGrbr56Wi+d7lMWIWpyDyVy5TBzGkxsau7AI+pdkoPy0DeQQ4C+JCteWZZ
         NkqbeInHWepP42jozSrNXv9WbzT6dYrAK0tuAI63HTLR5wPm3oa96RUoFN86J21nXwSh
         X6Yg==
X-Gm-Message-State: APuU4Z+cgcZOZWJEbcJVC5SOehreqlMppk704Sjt9BggDe25yY4ffpdV
	pRyIH2qDHdrWXce1iLkDGHUErmyaFCC15BIPEaCKuGEsgEyhKN6L2umg
X-Gm-Gg: AYBFou0YIi9HkpTZGckyw5E6he0Gwlwq06elRI/WZAJ2WqDrGV3UwoV8JZLHMGHxT/1
	KirajjVg52iS931BRHd2P6l4j/tfz0j5wzuANXRj1kH2Wp8zT/dvbPrS/ju6Zux/XLX8y3pHklF
	HOtxbGadZjmIya4nZkzcTg85MfCtJsk0djTc/6QRuwVksXdT0/uMabziScdl5TkJ1oLvezubNVM
	PnapZqwAhSWcSl1Tt+iqzzUt4z1OiC/NUCPzqH7zzP7XN8Y/ZK2qtEgu+Ml6knHPQdQxl2in61Q
	iE710X4Sip60PxyH7twErkz/iuB3ZN5dIANFzZqspy8AKBBpf/jA8J5fifWPwJMcBorG8/qzUtn
	6BzTC43TIj/T4J28bnrD90cN84W1OmADpEpx3DT5FXOrJOFEAhojNOtRb6sHwWCPFD3ej7mSWJm
	9aPt9pTbzyyH98QS3cevB89MM1sQg2lqb1T/tbYn6fyJc+vRaLg3CORUm2sIXleWJ56xKL8dlJU
	YCsSZpRugchbCy82oyxYrqwO59xQ7SHvK8M0pHxJKA4tEQ/oAEEWLluwoz5YblI6J74iOikExgF
	x7iFjhjAXDTnSUyvT8XgPNxIXamNp+nMVlRpxquvmm4NV1syWmHpN2uE00U98QvmuoLgTxeUGmM
	zZsIsk4+DvYekHEWUDi3wdiwCXi7niiJ9hwCf1Q6apiPDS07/r7peAcayR7It
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4ac1932a23fmr387484835e9.32.1793816480738;
        Wed, 04 Nov 2026 10:21:20 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 09/14] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Wed,  4 Nov 2026 18:20:57 +0000
Message-ID: <20261104182105.1102555-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace dev_err() with dev_err_probe() when reporting failures from
devm_clk_get_enabled(). Clock retrieval may legitimately return
-EPROBE_DEFER, and the current use of dev_err() incorrectly reports
such cases as hard errors.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 846216f22bc3..bdfa84745eda 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1234,15 +1234,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
-		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
+		dev_err_probe(dev, ret, "failed get hclk clock\n");
 		goto free_pcs;
 	}
 
 	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
-		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
+		dev_err_probe(dev, ret, "failed get clk_switch clock\n");
 		goto free_pcs;
 	}
 
-- 
2.56.0

