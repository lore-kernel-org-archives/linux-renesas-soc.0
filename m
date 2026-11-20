Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134363;
	b=YaBduOs6aizk96Y3cP9TGW4KAXh2q/Diebwnmqc80shmsPsNtsu/AXSjkXQUuDlQsf1o
	 VYzQmG6v5y9+NYWQCMIOdGHsYJ/kXoGsRWrGq9ukXFe/OIPGnnYZztYkWkm/+sBoTy4Y9
	 Va0O/ZFb7rVquXsFdzh5fpvlBD9+ZmapzgeitlVmKtDPzL5wwayAtDvp8+xyXLasWnx72
	 FBZZqmVacs2wovUxJrOrshplbL6XIFOeyJsdIA3D7sdcpd+M2s97PINqVEW3dNeVBt8Hp
	 ehHVT4GIEcjgU/n3euTwQ88e/Ase5rvj3x2zZMa75KF5oRqCf+d+sq212sJrV7IkacQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
	b=ZcemgKBGMvb+rKLPrc0ZEluV//vYFlWBb8w8lhd+HCZuf0Ed0Emwe8xbuQHwG6AS9m0L
	 PF0xLtKY9aWvBVSH6pcUCrgt3okZsVCQska0kGLgbMnKoPukEeHrCI5gW2j4txN5Pe4CH
	 Ki+OJf42M4g5OYtHXfjqLLVCpgnH8ZQgTXYfAL6ewXwLaNopFA1DNaT/Wbs5ek1k3Le0L
	 eSRLJTIxCKqTUG7nbzYK/r7EAMLowIe3x02tJIeQAVnulQ9RQjGqJ1d6feBx03Ka7SLQS
	 Q62ev5FubGxmyIxwnv1EsUr50km+Zuk9/xMo5oUbDwaJ59lgm0eriL2X3eYB0xeqBcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9MqcPLt;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C95B60A3818
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C95B60A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9MqcPLt
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso125652f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134362; x=1795739162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
        b=v9MqcPLtxE53SbjN64oHKP9t3rCkg88Zes1tVNDU+ofhyrQCe7iAjOqyGgwoAVAPyB
         74RlAfCImWW4u3EDJgGcEgjAiFs4MrtoR0odM43Nci/Lq5HaIRvqBDlFNbttHaKnzku9
         bvgg/zluqtZ5RKvErgFdFnt6f7vI5DzRhSamnmWF9enY8PTOkPLVNn1Uk327j3Gv0Dvz
         Uc0gpHcmKZClPKqOMRZ8DNI5DhyyGBcDwGGNYxRYkffFwL1VudZ5IVkNevBJEBNTP71U
         u+AVVz3mizW1JfQOmIXe3NZ5ttsOXZB8x9NJVYpIUYbvDBz4BCj1YyYuoJHrAxE/ZTJ8
         5/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134362; x=1795739162;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxV2zTydEE4k6FT+/UqpEKJRz2u+2cYDgcocvttPorY=;
        b=PFgVxf9/ab4woka8JxtRMa1PEQY1ZrTKQbkk0CpeVyWykjsEH9ztKGQNIRgeAxrWS1
         vydeiWYNpzfHisAMnY3mHPt0cecruEOVcacP4UfhsXzNm12fK8uI0s4OBIPvXI8UMpg4
         d0DeuQgReH9y6PIMHliFMitW9yWUp/9N5Uav1cfmM9JvC8z5H/UTB03gD5NfZ8j1agdw
         ZMKCKQVsZovBoqxoojGX5fYJ5KWSRB/7kJc7nEpM27GXKO7/A3IiwHD6ks/AuCvSFwlY
         YUymKC3n/ri1Kc7w8njZ9EDDhP59V9HQkZsI61mNzdH3CyXJc3nOgsR/3IwQy8t21DUZ
         cFng==
X-Forwarded-Encrypted: i=1; AL+hErFhRwVaew3GWS6nE3iqQFxQHB/fbEE5GPmbINfY72Lq9bHfd9O5JiVmeNgE9M8ynhm85JOQzOaAvpbd1mIe59gntg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ObxSkc8CCL0Qqw723UVwIUC1/7WMnGFXwWgaeUXfuEJPI2pO9
	W7TIGYDz2LWexKKqSlsT7CV3CHI2wnYv/32FkVLrAMnPvOSERdrF7hA5
X-Gm-Gg: AZFdTZdLhS6zaCWyzDZBAHHoND9m5CGgrVCwffcacHCMa67hMENX+JkgCc42FB+Cg/F
	1VG7hnGoXFdnr5Hn/CeACCjc/rFEpe0qf40pL83U1JwcfyssHyQuWPII2//g56gCyRq2wkLWeAQ
	oiVmqorGnyYgqZxNijxLUphRpd503DAg3yQN7Jta5/wvga0m56o/tq4Bu8Noph0fzB946e+5+VE
	6n9xd17/hPT1LPmGuwgWbsgg0SFR8L+zuRS/79g2KSKfhphTC9n1LzwW0zUSXXQyUznL30fuZgT
	Cc/MLPzsv7KtbyNgCnNHAR6fFONzeeHIJmOARn+YDZu+ciPLgnAqftfTtQ0BgAYPvYJrWrTGCrG
	G7zjzyu1BYklfXpiZRHmy+VHWoZb538QQEISPSO4Zlr5Qy4a1im0/fR2lPoZGRxZLyE44CMDQH+
	yKXLJWw1GO/sFpXTZwMQwtctyYZvdDMhomrreHl8QcnxNpbxlT0AHr8BKGDAPaQI2bd3DYiz35m
	CGb0sxCBDNvDF2VgsZvwEdpkJBTLB90OWnbi9Bk91oiZ3Znrfx4wGE6oiqmdOiceRxWhnYn2u58
	SAh11PgM+pYqWjR1DDLK7xMW/U78lgWTxhxj66LyR8RIJow/qKcbFOumbylP/QamwqKlI74fjWz
	rI1/N7z/XDY5VPEMK2kxg4nbSdGmwl+0X8VGfG2cnRqRiJQc9pqw/P0YimGfxDkXRVNd8opor
X-Received: by 2002:a05:6000:4916:b0:4a5:e50:ea5e with SMTP id ffacd0b85a97d-4abaf64bdfbmr1921927f8f.9.1795134361869;
        Thu, 19 Nov 2026 16:26:01 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:01 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH net-next v5 08/24] net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding
Date: Fri, 20 Nov 2026 00:25:18 +0000
Message-ID: <20261120002549.1908299-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The LK_LEARNCOUNT write mode lives in bits [31:30] of the register, but
the driver writes the raw A5PSW_LK_LEARNCOUNT_MODE_* values (0, 1, 2)
directly. As a result, adding an FDB entry writes "set LEARNCOUNT to 1"
and deleting one writes "set LEARNCOUNT to 2", instead of atomically
incrementing/decrementing the counter.

Use FIELD_PREP() with A5PSW_LK_LEARNCOUNT_MODE so the mode lands in the
correct bit field.

Fixes: 5edf246c6869 ("net: dsa: rzn1-a5psw: add FDB support")
Cc: stable@vger.kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 13c46cf2c420..7fd2652813ac 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -5,6 +5,7 @@
  * Clément Léger <clement.leger@bootlin.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/etherdevice.h>
 #include <linux/if_bridge.h>
@@ -545,7 +546,8 @@ static int a5psw_port_fdb_add(struct dsa_switch *ds, int port,
 		goto lk_unlock;
 
 	if (inc_learncount) {
-		reg = A5PSW_LK_LEARNCOUNT_MODE_INC;
+		reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+				 A5PSW_LK_LEARNCOUNT_MODE_INC);
 		a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 	}
 
@@ -604,7 +606,8 @@ static int a5psw_port_fdb_del(struct dsa_switch *ds, int port,
 
 	/* Decrement LEARNCOUNT */
 	if (clear) {
-		reg = A5PSW_LK_LEARNCOUNT_MODE_DEC;
+		reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+				 A5PSW_LK_LEARNCOUNT_MODE_DEC);
 		a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 	}
 
@@ -963,7 +966,8 @@ static int a5psw_setup(struct dsa_switch *ds)
 	}
 
 	/* Reset learn count to 0 */
-	reg = A5PSW_LK_LEARNCOUNT_MODE_SET;
+	reg = FIELD_PREP(A5PSW_LK_LEARNCOUNT_MODE,
+			 A5PSW_LK_LEARNCOUNT_MODE_SET);
 	a5psw_reg_writel(a5psw, A5PSW_LK_LEARNCOUNT, reg);
 
 	/* Clear VLAN resource table */
-- 
2.56.1

