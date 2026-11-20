Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134372;
	b=pIT+K8fE2yaXSb3o5LRBxyZqYQQMqtJbAgS3vJL6nUcUq5DMNocoZpoNkpLNtXWYDgeq
	 Nn2BHXCL/EaZ0wirdHb63m9qmhZF8EqiGOfpqffbXwN8+234uQw1ePJ95/SHZy6Gcz6v5
	 4zmNbPWOv+PRRKNgrPKox73z4989bH+ji0hHXr5/9aV3Goa1so72pRltrDCv9RqFf4A/1
	 mDYgyIsU8gMFhpQX3np5xdv8eTg82yancKHvFoS5OukeWR1nbwyPJXHRqf4HZLIr2Bf6N
	 oXbJ7J4D4Y8QL1mX71/TQFrOVp2YHrzMvXLLR/sEfbccgyRTuAM6EfQSUeVOwOd/M5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
	b=38pFQbU83+oLwuRI1qx80eIMNwhkUT13dPkjx9HlsX6ZCbKIZOjg9efwiZfXP28BV3Z5
	 0pC8LxpnQvt02yvNKbS1YXyLeGVft/RVLMBIeV09JLrd7L2OZO/d8P6x2J+Sr0URiVwuq
	 oxMxU25KhF+TKdR1GhqYYV1twHn3/0loe6quq6e6pwcEvAn2DrtzZ66FHLJPCiTaRlrJo
	 BjhIpagFDiPfZZRaOQNvVXMy5ai9mcsXw8uFZR6JTlPb0qNT3BH6gxFMx5tKvylyhgkJ+
	 re9MBDAFgtn2ZRu3tee04NXdXrQezh1XjJAFcmusEDXZTrVPg056n1gDQDqKrAwIzpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMLRrTNs;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58B60A6F6A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C58B60A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMLRrTNs
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a9be758734so178965f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134371; x=1795739171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
        b=cMLRrTNsnReXz0DEhroH2bdIjvqagWBw0Ch+yalf3RR0zlVdoti6aXH2VG3S9xxPXB
         fCyd1oGWWWfH6aBxYQAD857pBxWufXZ1W+fzwg1ECsaL/DcxSUq06ugBXdqvuLiP/gU2
         LvBrgkKKIuZBYodcDNzgJSZwVjoVgo21HZCQwlMZgjmyKiwgEQ1cTT1lv8pU3Qeka20M
         avoJQB4VqyBDajRoZVJVcOlgrlqxGo9DafhuRJCGoyN9ftvlNasGf6JgjqDNMM61J8PQ
         jeRHQBlAarqPzbJtEqnH3t0wAMfDF3hVEkaFkyE2mFHvEvuZ5qdzDmRwVYPt4o9oafo1
         enkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134371; x=1795739171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHhMBFGaw4NGI5M1LLOmxtMxazFzLRptQhTvV19ZnVc=;
        b=qGJn5BwxvKwplxTcOrYpRLt5eLeNOaiI9wiV4c1hHam8HkYX7m8SJaYgX1elEaTW1m
         l84tT1YHJ24MEEOBdHD8rfsfhyS0NAt5N/5BPLDZ4u751GH4WGAlJYtk+zjekwJF031I
         0Leo16WZWcz6btLN7t58aQb+sQr/LyVtvYndVZi5B71sBOSO9vsqMMu3ct3luoLaoCAh
         6J0ljfwH32CEAn7oyY1wptxILLsJbbqfUAt5Y+irEloJfqluChwJG5AgnnQjzBQ7voPx
         BP9HhTZ7My0/lwPd65zd/+erBTTd/eVZPY7qcyOLJMUq0hrs69Gw0vF0VLrs5TDyWgjv
         G4lQ==
X-Forwarded-Encrypted: i=1; AL+hErGE6u8vIhrXA1nh8tjCJ1JtOVZptsEIKm/jQHw6AxaqVaNIRqII+TO+/FXWq7P+sBM9reqC4KKQpRxPZhJRpG71CQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lw7+ZUvqgRJw/6kKHOk1hZ4/P1OkhOS/8yvECMmqIH9yNe8GK
	vU9vJWMueq0XAQUJ+kkcH3itbSV9TjtlqCjmniqUaJNXUBiBSrwyf65I
X-Gm-Gg: AZFdTZfGk+lMjMsLn/HkosfWKfWrazSlWcPobG0+NcmFSCaxjvSLSHbJ6FkgtquamK5
	otcxsIhWa6gG+ZOwYcIxer+69YB1+SyqhIBpmQQOkyEQvE4o7kLo4FD8pHH2kAW1hTSD5OiE3Ra
	a6ciW/rG8oJv7Qyf3H2/SLT970xoF5yCPZJFRMFlPQ0IZVLP83qCdyro1ZESPj8/22N1shLQQnD
	NbFSrptGt7oaIdtdWEm4MXoZDWhdJMnM0sGu1egprN4GB/kkPASXXiL76nNDQHdPL0H5sR10LEk
	7et5N9RHgPa1RINLekRY4X3FqGdI98jCA2DpEuc+gmkB6cPRIPGrrVCAgzJpZMLtp2badaR3AfQ
	8ijVLOAWo+gYpDx2tIc34OvZkalqa9SoJxbFPHVzRQEWMxtoJx4zM4xuj/98N5FBEJMrgPxeUL2
	0m+ivDAHtK6TNm+VFEzsWHORuWSQpH0tn6f4hT1DK6VZ3hjtHfUo+PWAruRHbJQ8e4pwbo24gP1
	tmGPOBoFyVuKDslFE9SRauoJDJBP7PHOGVHqcu0XnKiYx4xg4GURdKFYfyE6Fe9PxGfEJVUvuta
	+LRbLf3xDZx/dp7cQxhVM0KNO99D76sb6DzGf+NfSyyoIjTrzqI6G2mmqHPic/CnpIoOkoFbZJg
	dor3jsv67WuFTYKMxIpLsFjqwZekLnqYCDNYtOXbTHf/6Bok9KUpFCqu/dGLJ8U4yGOGGPj36
X-Received: by 2002:a05:6000:981:b0:490:369b:f50e with SMTP id ffacd0b85a97d-4abaf7402b4mr1962291f8f.19.1795134370985;
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:10 -0800 (PST)
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
Subject: [PATCH net-next v5 19/24] net: dsa: rzn1-a5psw: Get VLAN_RES field layout from OF data
Date: Fri, 20 Nov 2026 00:25:29 +0000
Message-ID: <20261120002549.1908299-20-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VLAN_RES field layout differs between RZ/N1 and RZ/T2H/RZ/N2H.
RZ/N1 uses PORTMASK[4:0] and VLANID[16:5], whereas RZ/T2H and
RZ/N2H use PORTMASK[3:0] and VLANID[15:4] to accommodate their
four-port configuration.

Move the VLANID and PORTMASK field masks into struct a5psw_of_data
and use field_get() and field_prep() to access the respective fields.

Populate the OF data with the existing RZ/N1 field layout, allowing
SoC-specific layouts to be provided when adding support for RZ/T2H
and RZ/N2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 9 ++++++---
 drivers/net/dsa/rzn1_a5psw.h | 6 ++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 6f3f902f9f4c..7e9bc252d92a 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -691,7 +691,7 @@ static int a5psw_find_vlan_entry(struct a5psw *a5psw, u16 vid)
 	/* Find vlan for this port */
 	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
 		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
-		if (FIELD_GET(A5PSW_VLAN_RES_VLANID, vlan_res) == vid)
+		if (field_get(a5psw->of_data->vlan_res_vlanid, vlan_res) == vid)
 			return i;
 	}
 
@@ -706,8 +706,9 @@ static int a5psw_new_vlan_res_entry(struct a5psw *a5psw, u16 newvid)
 	/* Find a free VLAN entry */
 	for (i = 0; i < A5PSW_VLAN_COUNT; i++) {
 		vlan_res = a5psw_reg_readl(a5psw, A5PSW_VLAN_RES(i));
-		if (!(FIELD_GET(A5PSW_VLAN_RES_PORTMASK, vlan_res))) {
-			vlan_res = FIELD_PREP(A5PSW_VLAN_RES_VLANID, newvid);
+		if (!field_get(a5psw->of_data->vlan_res_portmask, vlan_res)) {
+			vlan_res = field_prep(a5psw->of_data->vlan_res_vlanid,
+					      newvid);
 			a5psw_reg_writel(a5psw, A5PSW_VLAN_RES(i), vlan_res);
 			return i;
 		}
@@ -1354,6 +1355,8 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 	.rxmatch_config_base = 0x3e80,
 	.pattern_ctrl_base = 0x3eb0,
+	.vlan_res_vlanid = GENMASK(16, 5),
+	.vlan_res_portmask = GENMASK(4, 0),
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 5c5f5ec25774..29d205e2331d 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -71,8 +71,6 @@
 #define A5PSW_VLAN_RES_WR_PORTMASK	BIT(30)
 #define A5PSW_VLAN_RES_WR_TAGMASK	BIT(29)
 #define A5PSW_VLAN_RES_RD_TAGMASK	BIT(28)
-#define A5PSW_VLAN_RES_VLANID		GENMASK(16, 5)
-#define A5PSW_VLAN_RES_PORTMASK		GENMASK(4, 0)
 
 #define A5PSW_RXMATCH_CONFIG(base, port)	((base) + 4 * (port))
 #define A5PSW_RXMATCH_CONFIG_PATTERN(p)	BIT(p)
@@ -241,6 +239,8 @@ union lk_data {
  *   port to account for the HW issue.
  * @rxmatch_config_base: Offset of the RXMATCH_CONFIG register of port 0
  * @pattern_ctrl_base: Offset of the PATTERN_CTRL register of pattern 0
+ * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
+ * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -250,6 +250,8 @@ struct a5psw_of_data {
 	unsigned int management_port_fixed_frame_len;
 	u16 rxmatch_config_base;
 	u16 pattern_ctrl_base;
+	u32 vlan_res_vlanid;
+	u32 vlan_res_portmask;
 };
 
 /**
-- 
2.56.1

