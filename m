Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134357;
	b=1Lr3Ij5WLsaNgagA0AsrLqj79DXS76DH2urN+QI+zqRaur4UtwoKzPMebGgPsL2N79ln
	 WyD1QVlXOxFw9XzLJwdZKEJXiYZSvaxCm0HHe3rTUYEP6U0JNGWwocuVZaMplbulrkAGn
	 RBz4WkY3koDWSCaBgQsVDXxsvTjRLh1awx1lg4Wu8eLf3pVl4/B4MST9UnD3G2lHkDh+8
	 9+y/YM2f4ChinNXMZ3oJNzlA8inMfk/5vI4pSfEmbeEonzqiHP7f+0X2/mx9uRBNQfjqJ
	 gc2qPGpZLMDLrM97YXPZ1zdr/i8+lyTk3OpAxtGMhxorzwnIel9Kaypcczm+dpMOiKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
	b=dB0L+GSu46JEVFMB14tdisv8xGxhgzv9USOJl6y38RwxnFjSb6zr/6lyFvtYtdKqqL+N
	 9W8vr2HEPOt99hyb0K/dDoiVEWYpdQIyTSZiB/zv7/Dk/s5UMBUla8fe6MMr7Xge16gLU
	 evy6v2tKm/gCwItXLpNru+uctctptOrOv4GNWEppNxilw3zSH6mYU1r1c5bSqkXyNjwBG
	 a8C5pRp2db/QtTOPzoJyTGN53zVEXVCipVHn/bIBjg7numBHxgc7Wm9WAnNSrGpOpW7aH
	 eL1ew5Td5AqJCqLiR/GKp6N0ga/9XDLnEdTtkjdZ5SiFn4w0CLH+Q7iylQ8yvos9yTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuwbdave;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69D606A33E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D69D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iuwbdave
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so2374265e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134356; x=1795739156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
        b=IuwbdaveVu0dQdWfvEKuykC3MeQS2t2S+vvZyH94+kcwIftMXRbZ+6Pgek6qeV4riw
         rXbJE1Qm+Tq6Mw3Ey1ExXSX2tTPQkh7s25kULq4Iw1c+DPaXDMlleephapy1Ls7ouQM0
         kmP7UuFVttFu9ELPBdGGgGEOMMkZtaVWXQnyv19fsTSCLYKELQSvsyXskFn/F2gFTHEg
         uT5iIlFnB3yd3IoGMf9lkLdja1EHYMy+GFnZuGN5+qog8YNLsYl3o0aIaWHNpdtvwFl0
         SEfGLr9V/BCFvlMXDlryoCC4Cm5QA67us2yaUBWFZF6AE4jdwseJxJXS7zANpaGPrPe3
         DC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134356; x=1795739156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rq+rBhuc4c4d0wbSM6sllDNZWB8d58n6PTIrLy0nE6E=;
        b=L8Yrjby0Xwaufh10UUq6hZ9jo5CJlSOGyhr8u2tm95mkpphDQ0/OQszjikMOERu1np
         ixN7rhkRv/C8u91i5D4QEzN++vPtjl4WMzAMdMwbpXK553Y5m6zhayPk80CrbS/IuC4T
         b3jIrPXRcUWo9XS9OCmiTlqzx9xI61QVryoMzDEATjke/gv8gp90mQhL599m7ZQwtICf
         KDajQCs6cQOXi0VsXaZfGJWEU1Lc0ii/iB81cPrWIXRQBErBEIhyOTHsxbRNQlf31G0d
         bAZKS939zXHMODKC6WzmJCBDb/1YQAxPauKv2F3LSvzatcFg0X7ONyfOAnt7AeGs3xv0
         6+5Q==
X-Forwarded-Encrypted: i=1; AL+hErHlu/jXR7OZ6N6Qd75pHy1CLyqO9tw/K9xO2UBT7+Cw716VFxzEHMfdgrHx+2fNJnVQaxssxqNzQXerfiwRT0yYwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/krvEM8zMjNQWgv+5XXdhCg6ksltMA+doCQtupdZATiAYAGO56
	gciwgUmfU0EsqIpbJt1sAiVP0F7AJ5tCZP0NGKZvjlXstgBCO/MYldx2
X-Gm-Gg: AYBFou17ac+Hbt3q0Ba7oLJ9lWOrOppQ54ISe0BLerW0m4SkSMANOs+uZ6Gb0YrBFDy
	OwFQI/glVLsDV1hfDmvodcx6zFv4fKKU2Vu7qEf9aiUOiozL73W+S75ZWu/ficv2+aukALAs316
	2E+QQd6yLqYC5MPWVAMsXtkorvXp3h4+Z3aCv89prv2Nyq4eFUmoGVf/wismk4LtWTDHyXzRT3C
	WSBsbnzVqrhz6JuWSKL6UmohUQUDbeNwedFWBoIlKWW8RmkuiXI5WVb7YNWQJmTmuXVWE48O2vs
	09ZcqEgu3YB/IQ8/uHUDqfTIGhv8NbbhEcsAfz1CBtWJOPvyLGiOIZQyaOBiTApTAFvB29BzpuH
	dYCBecusOUd/t+CZsiJ1TgBpmvpA0aje3CSMYmBufRCVmuy9RHFsOaSV+mAXovVpSZpea7JcLqT
	ojpQK0vfxulUw/7byTKAqvnf1H6UFrL5epZfzDHv4cO09pGAUnbMv39FkOGjipOAq+hfZoZyf/G
	lbZdTRDROssEvn+rMkNkSTPDxNEWafmwXKQdw4RfmcrcfkDmE9wB61skET1pNKzI6VoGOiYPR79
	VBTrNW2kb3vgNzGQQLlG7O7+oQH75E6OuzGpjPg7gmJcNJJ3um6qeTdN1yVjNTeTlbwGYPKygLc
	wdNa0WsIWl/W0KBUym45VIYu2XpNovVHhZaEdwh8Yscc27JXFJ8W/nKM+zq4EmCxoGDt6K9Kv
X-Received: by 2002:a05:600c:c84:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb8881f47emr25136615e9.25.1795134355703;
        Thu, 19 Nov 2026 16:25:55 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:55 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 01/24] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Fri, 20 Nov 2026 00:25:11 +0000
Message-ID: <20261120002549.1908299-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.56.1

