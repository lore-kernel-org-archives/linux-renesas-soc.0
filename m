Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134359;
	b=s6KW2xJbXwC1MMkcBgso0pehs/xMBpW3NldCVdpCSRhQQO/m0G5FJX3kkwnkY4FLgVYQ
	 YJwtlBEFRVt58b2LsGiGK3MuEOUFlOfrdqXikNOTNt1V5Ok7d0Um1d+/Qdavjo3I+/gR1
	 3oy10QyVLHoyPTMkoZDSEim9dNqcYhPf4O56SCNbYN2qUESu/3PTg5gNWiv7DjEUCIjAp
	 EC971al7lfJr8/M8T1kuXjyj37Hi0gxs7c7VbbxosJqV61sav+roPfPStjzuzOZTnwyss
	 liwHmi4dF1lUYXdIEPVaG3s8QRSriJPPlk8kIhVYwQ8ikVqz+kEA4tthpd83a+SDpdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
	b=IlsGwg4/x7oSvwwoF/ccqwiGJjJ3uAqKu6LYVJG5gEVSl/cxNIEOvy089YO7Oq5WrUm4
	 sDf+Zb4TAZ8uazx1JBOH/4TzA6ph8CM+/0TQpVh79i2GD17e/IJoX3q6hoUWPp/w/Sxmh
	 Vijj0ut1F+zKk3ydg2I//FSmXArwPGGgBXSVF3CSu452lFsRwpQ9uf0KQPBn9rxzD3btA
	 vuYU8FQo8LOLQ+SA0A+HeSkPvseMFqihbhDpgl6kaVmO3ppyTtNt2Zfv+CmuOWhE2D2zO
	 XzQW7B0D2lJUZjbxFr29QbRkMWHSpZS8H6wDRzIneoZcF6s3C475oQh+brbWt+EYmeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKkJgngY;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047760A2612
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3047760A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKkJgngY
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso122958f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134356; x=1795739156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
        b=NKkJgngYss6DYT4q4I6bM1MtlHUzzx9l6XZ3zQDqP0oho2qx0uW5dK3GaT54tOfsPh
         v1fo+sho9zx0KUYC4dnTgUSp0gSaUpI6HV0oTJTcR76Mg7FK9htJ47bXigpqFzoIyMnm
         W3ot7fO3A5hENnQSE9PNGvM4/7J9MLCD5dC9GfdJYx+mtRExOIyAvS1lXb6ivBmalBUD
         npecZ7yn8Q1DUDdZph0tz3giECEaxC5WKsrC3UTXl//ikG0epOYHS1dQYVDxaYGnSeGX
         XQiuYOBB5ChFnt2FOjEnFYzNZUBP+ZUU4n+zAgfe72f1Lsbg0tutadfQ9V7PzlIadwN8
         ze0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134356; x=1795739156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bej6NsSjfIEC15lFnYpJOiNPHYir/2JVQbFGd9Xe6pk=;
        b=bGiFM7MY8BY6tK6yVCyvtI9wotofT/IY+jNx62NY9E1CF7yzRbgTdvxRDeFVtu5BZr
         eRJjwTUt9KMV8+j7sjbIxtmayVHyzfpU7uAQcZFASK3PLfH/Gxm8oBBYlvv4v2WgoQw4
         fUT15aBtEY/DGwwjYpP6FhlQ5jXjyXsfcZLq0lx1a+I6TVpIZ5lScov2nhVJv0NQdMU4
         3gqmuaIrsPay5Y1+xuUkg9j7Z7wZrWo+tKgT7Bs23qbMIoEaYJgatScjr/rjVgCazIRw
         UuIr93hFTOA0AdkGCBMdopzw14KR/n6h/bofpxY716r5zkfX0DriUqg5aaxu6KFOR4Ds
         0XSQ==
X-Forwarded-Encrypted: i=1; AL+hErG/TpqVMlZBjyj27mVGLgdqXmNu4Fwf4GjzaoNPl5keUqzzwhYo4iJ/gTBYUVxi84AJJG6R0XI0KipBvDjYrejpag==@vger.kernel.org
X-Gm-Message-State: APuU4Z82OWjrTygNaT9x7apP0NPuF5l6M/AxkMlkO/JFNc5TUHWVLs3D
	1AHvqLbnNFqPt2I6TeGmDObMg2FVM40FGOb1hreFNce4zA3WWtXJ8n/L
X-Gm-Gg: AZFdTZdpeAy4k+EnDbx4zFTGPtL0bylrREgU4rVeZT0lqG4qkvGAMQex+UBEmKMKvkc
	CKb/hCL7COZjoHH/4PYT+brh0kls20cbV0zR79SpPj7eDxsx5GrXFGSqfVWXF6VzgwL4xv6U17c
	ZWcje828CWzVoi1DC9vKnZqzP3LOf2dTNZO2Chsunimy4xqZ7v3x89w2nxcrbDrX5+XavZzpEGW
	5BSeMS5gsZMuodn5f4imNEjAPCcS7avkfRtzlkWzloJ2vEkwX1XlMPM11FVXq1YsuueZv3aufiZ
	gm2wy/jHDfpkj2AkKWh4dTBjGWrDhHNerHZdK5YFKBHa2w1uWafaxiqolKFSgwGjoLGsll5CYcs
	/lCVEeuXVN7xALGvlljkdRnfkfRIogjv+pZV6mMhd8shQLypZuh8UGlgnqqB/m4Z/NDxshvZ1qo
	z2QGUYtBFmpZldp8BUfiBCwaK3Spqu+Zcyiwpi1ggLW2elvh1TCclfSHEYHRFCjtx53JEM91sDp
	XZQgp0wnhi5ejR5MhsYh/BhtbzRTP1IthsDpMYYAzDIEUbsCIcZ5I/wfF04Jx1P84TUEc6GyI8w
	GsfGbbxdEdUXiK6qeqvGIUt9N0eJRLFHPOMXxgJ/R/9EZNKms6EmroYLvZbxHIVZikW8U4DtYxd
	cEsy9zsR9gseF3QMxPry4Nxbt4EGTHQjCqm7uHAUunzHPxutnFmL1t+6bUqlf8v3uGmhHHsW4
X-Received: by 2002:a05:6000:2310:b0:4a2:ee0f:4fa3 with SMTP id ffacd0b85a97d-4abad6a4224mr2489161f8f.8.1795134356478;
        Thu, 19 Nov 2026 16:25:56 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:56 -0800 (PST)
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
Subject: [PATCH net-next v5 02/24] net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
Date: Fri, 20 Nov 2026 00:25:12 +0000
Message-ID: <20261120002549.1908299-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add a distinct DSA tag protocol for the RZ/T2H ETHSW to separate its
semantics from the RZ/N1 A5PSW, even though both use the same tagged
frame structure. The on wire layout is identical, but the ControlData
bit assignments differ between the two switch families.

The common tagged frame format is:

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

The differences arise in the ControlData interpretation:

  ControlData field (bits):
    +---------+-----------------------------+
    | SoC     | Meaning                     |
    +---------+-----------------------------+
    | RZ/N1   | [0-3]: ingress port         |
    |         | [4-15]: reserved            |
    +---------+-----------------------------+
    | RZ/T2H  | [0-3]: ingress port         |
    |         | [4]: timestamp timer select |
    |         | [5]: reserved               |
    |         | [6]: RED period indicator   |
    |         | [7-15]: reserved            |
    +---------+-----------------------------+

Because these semantics diverge, register a new
DSA_TAG_PROTO_RZT2H_ETHSW protocol and corresponding tag driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Rebased on next so DSA_TAG_PROTO_RZT2H_ETHSW_VALUE is updated

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Updated commit message
---
 include/net/dsa.h             |  2 ++
 include/uapi/linux/if_ether.h |  2 +-
 net/dsa/tag_rzn1_a5psw.c      | 21 +++++++++++++++++++--
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 09f3043d57f0..a81fe7ae4d18 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -63,6 +63,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_MT7628_VALUE		35
 #define DSA_TAG_PROTO_KS8995_VALUE		36
 #define DSA_TAG_PROTO_LAN9645X_VALUE		37
+#define DSA_TAG_PROTO_RZT2H_ETHSW_VALUE		38
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -103,6 +104,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_MT7628		= DSA_TAG_PROTO_MT7628_VALUE,
 	DSA_TAG_PROTO_KS8995		= DSA_TAG_PROTO_KS8995_VALUE,
 	DSA_TAG_PROTO_LAN9645X		= DSA_TAG_PROTO_LAN9645X_VALUE,
+	DSA_TAG_PROTO_RZT2H_ETHSW	= DSA_TAG_PROTO_RZT2H_ETHSW_VALUE,
 };
 
 struct dsa_switch;
diff --git a/include/uapi/linux/if_ether.h b/include/uapi/linux/if_ether.h
index 1ffac52c39df..9fd25c5d96c9 100644
--- a/include/uapi/linux/if_ether.h
+++ b/include/uapi/linux/if_ether.h
@@ -121,7 +121,7 @@
 #define ETH_P_YT921X	0x9988		/* Motorcomm YT921x DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_EDSA	0xDADA		/* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_DSA_8021Q	0xDADB		/* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
-#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
+#define ETH_P_DSA_A5PSW	0xE001		/* A5PSW/ETHSW Tag Value [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_IFE	0xED3E		/* ForCES inter-FE LFB type */
 #define ETH_P_AF_IUCV   0xFBFB		/* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */
 #define ETH_P_NXP_NETC  0xFD3A		/* NXP NETC DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index aab0ec143c77..3dff661fa58c 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -23,6 +23,7 @@
  */
 
 #define A5PSW_NAME			"a5psw"
+#define ETHSW_NAME			"ethsw"
 
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
@@ -111,8 +112,24 @@ static const struct dsa_device_ops a5psw_netdev_ops = {
 	.rcv	= a5psw_tag_rcv,
 	.needed_headroom = A5PSW_TAG_LEN,
 };
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
+DSA_TAG_DRIVER(a5psw_netdev_ops);
+
+static const struct dsa_device_ops ethsw_netdev_ops = {
+	.name	= ETHSW_NAME,
+	.proto	= DSA_TAG_PROTO_RZT2H_ETHSW,
+	.xmit	= a5psw_tag_xmit,
+	.rcv	= a5psw_tag_rcv,
+	.needed_headroom = A5PSW_TAG_LEN,
+};
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_RZT2H_ETHSW, ETHSW_NAME);
+DSA_TAG_DRIVER(ethsw_netdev_ops);
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] = {
+	&DSA_TAG_DRIVER_NAME(a5psw_netdev_ops),
+	&DSA_TAG_DRIVER_NAME(ethsw_netdev_ops),
+};
+module_dsa_tag_drivers(dsa_tag_driver_array);
 
 MODULE_DESCRIPTION("DSA tag driver for Renesas RZ/N1 A5PSW switch");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);
-module_dsa_tag_driver(a5psw_netdev_ops);
-- 
2.56.1

