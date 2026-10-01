Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F390551CF4B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869417; cv=none; b=aXdCVyzGNUrDCSTFu0FlXGZV85BlU9nzuyWEA5SQoGQ2aHj2VtILNTSJb/7VCkyqPs7VrVOeYYzyoL1tcKPGCMnXhObVXSvYT5BVMrgaBg1uDjB67hkdAKim1Ntl8gWeKfQ1Mo9FQoX+g8Z+1QUTp72ytlXE2KVz7yu9OMo8tQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869417; c=relaxed/simple;
	bh=OQJZv9acOTk42vjwuLnraI5dhRhpupiz0zjKA4s/M3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxmVKlgvKtmfdRRXQsiivwMGhZtGlybTTeTbbdRPinEnuIIqQuH/br8mXARh+3/jRZOr3uGJdt67TCc5DKA99W2YytpRGUN+3QRN0LxK8s8IF/be7kHFv+D3EFIlNnnRQJz5UVh2VZ5QmkdcbVI3/hF2a/qWK3akpNz317InD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhMGZUTL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhMGZUTL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso18185225e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869414; x=1791474214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSWSFoiqnHbSZUG5Pf7Vf3OD9TAVESMC/aG0LA9oLno=;
        b=bhMGZUTLxJm9W3h9q+gFQe8whvaARZ7e0ZqmudarlrWHOok7vfQE1SzFYKCANCSry+
         GyTzIY6jhuYjjlL8KkoTQfgIpjd1+tp5r85XYpdU3rvavhWIDj8Ym5W1l2pBk5vJnEBr
         XcrPsMFF7DLcw2O+O1oCSYP6dBNowfHEMzLB06XvoBM0L7ZSABEtwzvbgwXG2irhbYEs
         Jv4h9BZlkQa6vmkE25fGug218r6qZqULHdfHiKlqo0iZZQmxQDYkF6L1Tej3y1IKoCI4
         lQpHyETrJxqXVM86iiNGUn0TuQcr81JkaL20BvA1dEOgJi0Sz+Q4D1HM581g/eXn/twX
         epnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869414; x=1791474214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSWSFoiqnHbSZUG5Pf7Vf3OD9TAVESMC/aG0LA9oLno=;
        b=UklfPTvZDlyAxMwEmiSp0ABNEsAwYIBkhrMGd+NBASHSUhKOe4zBEpuZagZPeWxOCW
         nwlqWlAJqIWEQ+Q4pYY+LtnFU+JijYfR5MBS6gCkJir8d+TMUZl+Yl2HeGT/FWiDSbBa
         cV26azgKAd1AJmV7OFZ6T+5l4qVUFYDt+z2xqr+AA2aV9ZquV8Eiuki1+ne2B93BqPcK
         s1KBaoTMEEBIU3YJ6W0Gx8N738e5Z85bUxwbjhZ70uTsffNb/BRIzOS2+u/LsrtxHA9x
         OYbGGYG6UuHFihBcAwfyZF6k4uOWTHRzwyUQcO81aGi2MZE8WaJ3As6gOatfg2iZs0FY
         VQoQ==
X-Gm-Message-State: AFuF++ktgQYG1K7kADnibLi3hAp8lwggg2gcnpChb5+gk2isyLWDR5G8
	Q0N4sbq48HpHUk9/RTqpcdxhfn8SmcOlbWgszlcgWJYYprrthyQ5xyDw
X-Gm-Gg: AYBFou15ZUQjSClZL3hPpM+qzz+64PWPw6FLdDE/RiKEEsCCUkwX9INYd1mhZT4IxwJ
	hGvR2aU0NfEOox15qESdLc+699HmEtU/UFSTmd92sAEjsaL7ndOeY7gL5njmCYaZq5yF9kBZQv+
	bbdF7iM/BlHRojIPg3w045vkjGsG6BseCQGEfdCP9GCKg0nMoLMBGXx50RpK/qpdla/ooWy7qBZ
	F72x1MPJQvEFwUXr1mwbYu/PhD089JGkiouCL/uV6Oz6H/bBY+GUdhRCz9b5nlUBHXPT9ytRs+5
	uWHFi/lC2KQ3HXqpg1rL1cRxlZ9mmOOpKgmIhHYqFVAvV6m6LJzh8/SiK3uDTGp/q0SHpiSZHrV
	Mclvd/BFuBfb3RIy/pGXpcWcCMary1/lFC1rf/X3Man7vnDePXteuELBM+DT9psv3Me7eoIURHD
	pi43zfP2k0BfgE+wlFrRJbe99XFDe9MxgYNWxqjtjUlFlqM2Mc0adlaSDf/T2goXl26NbEhmLn/
	meTkoaOXM1OhOc26DkWHBcPPCRbvtfNk4hcMvDy/v6LTDJfbNagZXNVvn2ukuHnAj8PZvsb6njx
	1REce4rvv0YES3wROxNou+adGjWRXA==
X-Received: by 2002:a05:600c:1e24:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a0275507d7mr448335e9.11.1790869414072;
        Thu, 01 Oct 2026 08:43:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH net-next v2 01/12] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Thu,  1 Oct 2026 16:43:14 +0100
Message-ID: <20261001154326.754314-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
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
2.55.0

