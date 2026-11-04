Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816484;
	b=BpcviTj4RiXP5gBd7KHRzdyFuBovJ5U0AQKm9SMHNe99lHtAKYJ2ZthLOy/EuXzh8CSn
	 04nLhL+aHoEkU7kVxMVAikmVsaQ6b/cUgQhKTtaBGu34nxUk7AxdPRs1wmz7RT11rXy1R
	 kS479XslczQJuwc75pYjpTdypqfmilI0teDIL5eMIbid60KQ8VM7cVjqvrJ69/lYSXobz
	 UJpTmi4dEIF6MwVx99/6F2x2c2O0/uulYQgv6pvH9DdVIfT4wlHWZGe/fVOnPJa6CoJ7p
	 1r3/EWH5qXO8gLea7UtUH2CvmBU2B1p+W8NyTyUOufTp7ofrvW7fGBOqTrnk5g7mZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
	b=t5fA8qhiBZRkvLyV8U0VNZOXUEZ1FKkzFB+dPHxuS/o3hAJ2KCdEuX5A8/8jwNl8Qk1T
	 8bK0eHQ7avw05fWvoWuxAJhW0Zls2UYxoK89FIMhDPfJPkoLcQ4cQKO3TjHS4gLwsLDrK
	 Bnzbvda4SDjiM92zxoYzt8TZhrMkKcZYVSAb7Q7hS0vZCzlGSbIeWReEtrjtgpt/zT4ud
	 gC9XqrQyEuNYAVvTcinCYZoCIigD1BW17W5LF//Sa3rI/J9kedzgWbJEmGZF3dQTzXN12
	 DYSey/777IKvKOojzYDCps5GpJvW6cYgh4BTF7Pmd3pQ0i/FaeNpYEyxT5zU0jLZBFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+cJhG4b;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC660A261B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CC660A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G+cJhG4b
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c1d337d8so330729f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816482; x=1794421282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
        b=G+cJhG4bvR6+Z+oY8S4RJlEN38IG1EGgaF8mSO5/bCTCqWATVsH+4Y1VZGtcuLRjMk
         VAFY+p/LPm43GaDRFhaqT+bL9cc5Jte+JSMCUNHxmogmCbkJMi533Q3QF07rFa+eR3C5
         3PWz3vYqfDX15L8ZdXL0oAETyLZj2WU9Cxzxpi7YJGR8slBt8rBqn2m/JXVXVbzZxAW8
         Wpb3HqBbwy670/5bgPUsSOOXWR/9wcNWZctApoIgpEW6rA5gtzwotyW6S9Gsn8TOwdMQ
         gwRXdgmEGQXbCKkelU52x4emvfJjeRi07OAnOnUcqD0bdTy/crxb1V5NoX1rZ3KXk2FG
         sQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816482; x=1794421282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAFQ4NIpw4G2h3WAzyEmbQDopp5teXSrxNa8N1logrI=;
        b=2iFYJ7JqKzdMqaeqCR1MZ15Wd4mJk8b3VJQ46R4PVlsJd0kVU0p3Ny0oN6Jf9HIPo9
         B53F2N6aqCwF8Zorwqm3QDkXCa5X8n5/JIHcHkDbIxQ8JEDt5tYltPozsTjtZtdjtxUV
         ed2kRn788UM7zHi8hEnltdHIn9IqNQ5GjlFDSugrBUKHNLW+qF8o/fRU7NBrma1klE9E
         eBgtJ4aoNA/7cc7rwJd8mj4S2oCDoet3nA8+eQ910U2F2yHGlDs+OZKgynDgcyJmmxXi
         pjn4CjZH/NF5OC2ebXPoZQxQe4gMrELBN47I1GSjku2VsTMXRoL7zO8MPl99Mpqh97ji
         j/aw==
X-Gm-Message-State: APuU4Z9BrgB2fQFtEp7u+gutEB7cwOYhqjhU7r80UuxcjhNwKSRqhK2A
	M2Rs0wWKrynZXZFbWOou2tlXWho8R0rvR4RaOwB2iPCFDlPQWhjCIjEW
X-Gm-Gg: AYBFou2ERnlx9pYdXPKgLCuZDmGCmmCsKvXphGRqlhf21mzGvd3jGMklepDK5o67f2C
	Hg1AnIVDgUuNowex5kho/icHTjyDI9pXXCAMmmffawSL/dMBPKmoOHgFs1Wj+XfB05XzERkFGmH
	g4NLX+bLZQCtSTKRrStmbBK1oM0pBPmMT1zlEDoMq2SrKIzAtF9T86rHn150NJwyWvqP/mXV8X0
	IXEByIzv4gH36S+WALLqZsDNvwmI5Z8XqRXqiAF0IgqXnvnIMXg2c4ZEmGzNwKlyewfbYqSuSbH
	+/pXwEZX67szgQ/PNnMjdiH0Ke/muaSgoKFJMujN2rPC/t1+GJ/GT9NEEGjVCFKO2SZULBvbKJb
	zD6+JmiJBBH8cNpwVRGkDN87IeBws+X/fqIeKDfF1DgO8cBZGKSet8VG42IqamuLBhLeRT2o6Wn
	kjad9D8TbAr/ePb5orC33jLvN5x12W76OHQWTl5jGEX5ssyRd5fo0nByqUa808R9NCsChXgOGDD
	y1YumZRZ1CPUkXiHGNFllaR7MjHKhQnQ3DUDVBho8g1oW1BDynTLrjrxPuEytWSDYJlWnU/Os1X
	evZ91rYA1TRv52UWyNcphZMZPAj4q29HUuRJi5XX+vWN3r6HpnZcampsR7bcwZwHHoaAWZHaNm6
	6QXRDIwt8obj3HgcgN5uavaxeZuklmHWKqgeMOg==
X-Received: by 2002:a05:6000:e89:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e6e4fac5bmr27612625f8f.43.1793816482340;
        Wed, 04 Nov 2026 10:21:22 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:22 -0800 (PST)
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
Subject: [PATCH net-next v4 11/14] net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string
Date: Wed,  4 Nov 2026 18:20:59 +0000
Message-ID: <20261104182105.1102555-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index ee0187aae2bd..f8fe6f3b8e12 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -97,7 +97,9 @@ static enum dsa_tag_protocol a5psw_get_tag_protocol(struct dsa_switch *ds,
 						    int port,
 						    enum dsa_tag_protocol mp)
 {
-	return DSA_TAG_PROTO_RZN1_A5PSW;
+	struct a5psw *a5psw = ds->priv;
+
+	return a5psw->of_data->tag_proto;
 }
 
 static void a5psw_port_pattern_set(struct a5psw *a5psw, int port, int pattern,
@@ -1324,6 +1326,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
 	.cpu_port = 4,
+	.tag_proto = DSA_TAG_PROTO_RZN1_A5PSW,
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 197ff5916578..e952afd95dca 100644
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
2.56.0

