Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134370;
	b=fHkyuJYSSBOUXIqNbx4itDIl3dD01Scfx1rdOgmByUtDCo6QoGxP6basTPqOjR/RcKY7
	 5+tsYts0ygvDBhSOJmX1fr+m8FxvcqvK4porICCR8JtyuAdhyDJoavSnlc/ELEepFCRdx
	 uYIZjyvYEHeOIPkBOeCnMJx6gtLnt1Nv2AWfDOIL3sdi9L6swJDygjD8MhNQDxY9tq6zW
	 DPmi/H2DCh90G2ATJobj2gWFI9VDE3EV0xT0cmvlnIyHqS+grRlRlB3mMQmJ8EKBGVurC
	 FRFlO3wrw/WXteFiF5DvWV40tdCWcDn8WYBnvRLDEmTrvyKIoqAHUrGjd5uLWoiY6fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
	b=WbodR7h2KcuiJo2JCktNLD0VlWRJjduPHe/FNn9wRkXiShOxD4dxdI49DrmmGvK4gOQH
	 UUrKUXzL0kMosyXDVo9dFjB8zjesvJqE4RDKyB9JjFio6qs/u/mOvDNrZ5YQYN8axSG5l
	 ucZzCJGhBMgCC4/s2/kPKzafJAnPegh1ozKcg7zoDP/ymN/y5Vdjr1W7fTiTnuZ5Jtw3N
	 3DHuxpIXc/lNAhs1K0jO6q21KyPe9khiZJl3Pyk229wfHfWtyETUCFaNmw2+779LQmx/o
	 RGy1l/gUTae+FBjUQ4+SLf/gDTHV6WHBZFVRnU+rXrDMikS92hpQGT/A50VIyxx6hWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0JoIYtV;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3973760A6F44
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3973760A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0JoIYtV
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49a92144733so135620f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134369; x=1795739169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
        b=Z0JoIYtVPDmE0A2ZiREqXrdoxZvq/jv8BTPl8NaAicVXaC4oaWIIfcq/LTKyqhMwqs
         VYEwwvJM0A75vnFvaE776F1TqEBZM0peUil4646fN8B/4HBg1MjcaXZHB7fxrLQQfv8Z
         heBTmSWHKACeKB7bQqs0m9DXupWRiMTfbmQj2qgzic0n9NOWDmPWl3I0GbvHTx4CcgLB
         /W3QJbTE264YEqBJl98oFIhuwCAAYcwRWXiXaohPJQJO+G5w+eT7j3AZKLcYSONytTK7
         VJxISqkTTt2ZF8h9xyVaLYOeWjJRb4NDjJJPbYPBoAzyuXeSZcA1mZsu4JSmI81T4Qiw
         Mwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134369; x=1795739169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVA5e3lQLXXpuEDBEQldt12KnrRmz8Phbwb1K279DPo=;
        b=TDS+DLUHkVW2R2gb4E669590T9jEexAv2lUgLSJuFNAqUTlD+BpMDWvv3BvYZqTvo7
         HmfFsbiLyGnHFYZcqztNg2sJo+ZJ+h1UTGswl65VLbmUOqJgLSZxQys+FBVF1utfh+f4
         IRkNR7UFIBiHBqbssAdwAR6Q8wQnFNuANB+qfBAk74+Lb7MSOiLGuHssXZN6wHOJRPeb
         wzFcPzfhq0IfzPMZZNN6yDn8UNcQKOD+kaZYQAyhw3T81nkLTF3xn1Qb1fdfJ51CVWrX
         wGs7FbqQ8ysjY0f4mG1iXQt1GzqpzEmwn8pCC+1/cWvu8X0QWVhVwj/EGqns1djkOYeY
         h2tw==
X-Forwarded-Encrypted: i=1; AL+hErEl+E9ro2Wginb8LqA7DU3y2gM8KVOooxh5ZgBaVNa1kjoIab41OB5IHX4crFS5caYZHsPJTtIdZrPFQCHSmW2Szg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EGrxVRFwAH+k9zTqCOvPgAeNai5d8kyhBALOIS53Km2a4OaTP
	lYjVe1OsgeEZH+ebzzM99daIMF2WZiFqIrCiy3rleaRg0Vv0lGLQJBYx
X-Gm-Gg: AZFdTZcYIAxystPCGTiP5Hi3M1iYpp4xCqwbhxsGzpREJkH8u7uKQY5I7c+PiEZPvvh
	n2ANuD9o8hBY1HM7pzGm1CsDG+Tj9s/AZ5qfVXaNhrPc3GlFSYlBexbOklpyxFvO7umFK6k595R
	COMrbo/z18BHmI83pB3c0O/uX8Zi+5PWBgPDsC8hpJgpFqSm8aI1GKS4BXk8yqIicJbvgfdsURy
	cIQGCttIzYGfVSlREWcmhIrcc46jPUictpNXlJRPJQbTUm+U7cxAaM5L/QBwczD6054PFLAlQM6
	wLjio50DqEuHg3ZzWD+/SPtEVcdgeborlCFWO5KCRVDrYruob29c5rlUlVgKD9C1MT/FFInaSQf
	ForGaCRBfsDC61xGEO/MAUl5T0s7rYpNdZV7u92mavucokp00pd5PyysV0H3U83GNhxfcCXM7nr
	ZAEmm+cwMkWx7+SbCfFpB4zXhzzFkTIbgclJJbMk9hx3AQT3kk0pvxI8FmVb06z63v8KiLS56PA
	Sdo5Z4uqjCElvyjLWLYM0ItxFAmX5w5E2tnhnjp5S9B/iQCV02lqFV+1feJu4jCZd2581wApQsN
	yTH7PKC+93HTwP2gUSaJgxxmZyax5MWuXfgz2BN/Ud7FUBhcSn80eLvtXC3b6GesU/Bi4b7Gv2+
	IRz7j/xvwVVY8WtHvmQg15jX1YPYguT/mmsqPkuClCrJhhkibWOhck6K0FyZ6E/9lQY30Rr1v
X-Received: by 2002:a05:6000:400b:b0:4a8:dbbd:69ab with SMTP id ffacd0b85a97d-4abb4f58c75mr2298190f8f.27.1795134368583;
        Thu, 19 Nov 2026 16:26:08 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:08 -0800 (PST)
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
Subject: [PATCH net-next v5 16/24] net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string
Date: Fri, 20 Nov 2026 00:25:26 +0000
Message-ID: <20261120002549.1908299-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Prepare the A5PSW driver for forthcoming RZ/T2H ETHSW support by making
the DSA tag protocol selectable through SoC match data. The RZ/N1 A5PSW
and RZ/T2H ETHSW share the same tagged frame layout, but interpret the
ControlData field differently, so the tag protocol cannot remain fixed.

The common tagged frame structure is:

  +----------------------+-------------------------------+
  | Field                | Size (octets)                 |
  +----------------------+-------------------------------+
  | Preamble             | 7                             |
  | SFD                  | 1                             |
  | Destination Address  | 6                             |
  | Source Address       | 6                             |
  | ControlTag (0xE001)  | 2                             |
  | ControlData          | 2                             |
  | ControlData2         | 4 (timestamp, portmask)       |
  | Type/Length          | 2                             |
  | Payload              | 0..1500 / 0..9000             |
  | Pad                  | 0..42                         |
  | FCS                  | 4                             |
  +----------------------+-------------------------------+

The ControlData semantics diverge between the two switch families:

  +---------+----------------------------------------------+
  | SoC     | ControlData bits                             |
  +---------+----------------------------------------------+
  | RZ/N1   | [0-3]: ingress port                          |
  |         | [4-15]: reserved                             |
  +---------+----------------------------------------------+
  | RZ/T2H  | [0-3]: ingress port                          |
  |         | [4]: timestamp timer select                  |
  |         | [5]: reserved                                |
  |         | [6]: RED period indicator                    |
  |         | [7-15]: reserved                             |
  +---------+----------------------------------------------+

Because these differences affect protocol semantics, select the tag
format through compatible specific data. This allows the driver to
choose the appropriate tagging protocol for each SoC while preserving
the existing RZ/N1 behaviour.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 5 ++++-
 drivers/net/dsa/rzn1_a5psw.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 8d7cad90d613..c59d881ce10f 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -99,7 +99,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
 						    int port,
 						    enum dsa_tag_protocol mp)
 {
-	return DSA_TAG_PROTO_RZN1_A5PSW;
+	struct a5psw *a5psw = ds->priv;
+
+	return a5psw->of_data->tag_proto;
 }
 
 static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
@@ -1330,6 +1332,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
 	.cpu_port = 4,
+	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 26d201931453..58690f5f3887 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -236,11 +236,13 @@ union lk_data {
  * @nports: Number of ports in the switch
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
+ * @tag_proto: DSA tag protocol used by the switch
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
+	enum dsa_tag_protocol tag_proto;
 };
 
 /**
-- 
2.56.1

