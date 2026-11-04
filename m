Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816486;
	b=vuvThT+gwj2/T0xyTCTV1CD8Mu4mFqKlERDeeY0tb3XmfuKkq92stuUnZ1kvGFKmS3jm
	 SYl0ZX3S3tlsWHVbNgTGkX9MTLz4HYw3SIn7ubRjKNzm/9TrBFBY4px9XbQ+QNDLUMZgm
	 FCcGz48vKUTAijXaS5KueNUuBUbuRZPhVvbK56xXW+laKnvJ9gp9h1cN7mV6NIssmsUYl
	 jwwbAjnuHX+/F65GcMUrcs5xP12cvtoyse+LpYdEOAA+6E861tMgYAcAER38567xqIG2W
	 hV2ypAzNOUtQPp7pE1qD89WQ/7zYvcMQbNup+Vb5zsXpsZQzKinr3hZD2L9jw1vkddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
	b=semJWqkhg6DGaS7hFeGSVoLHtrZnff6Ry3Z/B4IYy36SkbV9HCZ3HTEubs2daFcxObEr
	 jeaiXB8APSmm7gDm36uQ6RZV30YzMVG9hmRIsjEfKDBRj8L42P+jzIl+hTfV7eDZREPFp
	 QLRuLbh8/o5vUHIdH1WwEmhU//+Hh+wwXVBRnffhxLKhcYHXEtgCzKhOSYTTDtOTNxeR2
	 QKg4dpTPYVtgnsHKmjaoSuxGWDsnccDIOl4tOjBj0RWvbw+HRTcdNSD7fTJD8xum74O9p
	 HFJPLGcI7UD0wp5+izfg+AZQxX3ENy6uaZrFKyJxYgaqzsKJPuZPDCI4sEi14xPKM9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2cgLMeZ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA39660A5BC0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA39660A5BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2cgLMeZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8622075e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816484; x=1794421284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
        b=V2cgLMeZZt/RrMcjTOPGqIFR5x+T3e9ZJqAFvwV+Kd+/sgH/TECjzHHEh3Wqg8Dtmg
         vUUWzch3y2voBzpfsFrZxLTCJJI8ZLp5kTwvjniMN2FqbHDnytOWQISIevoo+hhVWA+B
         xKM0s6gVt87TUmdYMkgMES0yiA5T0PU8Mz+Wi0JbAbvhSfj7hLtS61j64zaMhJwk7so2
         ILfWWDGRbLoaJBXVqIXwETLwer6IX/mtY6FETllRw9lUcnd5ezevvx/AQIwub/s/G2rk
         OFB6/B6sA+DZCt67zT3bDZTIBu2eexm2vmJ1aVzM5KKGk4BTwBYXF/XYgoUpo3rPcvEl
         hTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816484; x=1794421284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyAGHCPkA2zIGNE1s41zUFh8GTp9SbTWyYT3VeBaM0w=;
        b=GAPmD6XjRZapB8klGH/7LARjBBzSkhSeuoN09E3a6oQuUhSXLiW3rlm/Ptpsgi7uH+
         8wdhb/8JvqEkLAIjJOHw/b/b2lmWaY5yZvPe5+gNw4DTxacvQGj+65HAhu9AxE326NX1
         TgIubLmyxLdqiEWVyBv228ZojKYUI2qabuPnchnlThgbprpWkNjkyW8GXe+gNf0ZGWRG
         YDtd+psOkksnGvWPlPjyEe6xIxBiZFfPt/3V25FQAULy/CfUrojpdhQTgb02LZwioGdB
         LMjFknhKo0HevbJaibIXRkVNcf+uO8f6WiSMcFc8mphTcoKuX90BdtPjF+mUzHlL7YRK
         BMvQ==
X-Gm-Message-State: APuU4Z+06sPkbp2BMxgHci0AX2iP/wTObMKbI36ZZS7WjCzRRJ4pjnB5
	uPko3fuaG1/dAiA4Qbu2g8fe0ryICsSTpvoDVhND0fbbVptWUBE9774V
X-Gm-Gg: AYBFou2cpeffCo5FrLYKZOq7SeZrMGATEkHdBlWGx13dxx5019KJfbPszw6gOAupllS
	5X7CIE1wYhf72E8LJeej6S3dl4b3IkbabgrdbN7KBDOw78jzJ4gW1iFyctQGvVmwHFNSshKRXBl
	536WBjCAuyG8Ee/IEeHD+UhSwdvNq4bJxkqSXtF+nySdTUY9OVMmEzuNvWIpM1GikCjeZ67yMwb
	f7zUqFMm/MyZXpgrC5aO5fwtc0ZDFw5+oLt15HifBsTj0D79fZ7U2uG56Ox1vMJPD/OXHZxskyO
	qjkPk8PsNTsfa0cyyokeMgpDr3ssVOCvnBuZKOMJbw3LMqngtPHDa9vuTJcHH134VVVVNHRmz+c
	UQV2gTWrnoqtfdg7sTlSXIl4ZEGQli4Pjc6zrlYC8qFhxOEkm2Rk7bducX9xwY07PMblmzpt0fU
	LH4DT6GTnT4xc2nh/lqrXegPKzH8K21PGW3pMjLc+DWJm3ESQjiDsgSlrX9RZoJCChAGSImJLGj
	gsjoNmMmqFs0reMResPIPlhZ8yCZF51Ifid6UZkU3ZXcpFtHT94ZZdYueJFlE4qYGksFQSpyXzW
	YO+Lqnrxvfg/ZO0Xzoub5/AL0gcUn0SzFo5K4j5KhoAJSUTCcEyAwHc9PC0VRpilifoi3b8ds7l
	klJdnFGYIRmvXMWBouqN9LInL59MCCNYyAgXpDA==
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr373949755e9.31.1793816484012;
        Wed, 04 Nov 2026 10:21:24 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:23 -0800 (PST)
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
Subject: [PATCH net-next v4 13/14] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Wed,  4 Nov 2026 18:21:01 +0000
Message-ID: <20261104182105.1102555-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add device tree match data and configuration for the Renesas RZ/T2H
SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ETHSW`,
and an additional 8-byte management port frame length adjustment.

This prepares the driver to handle RZ/T2H and compatible RZ/N2H
Ethernet switch instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index f3eb8646dea5..66b155686474 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1338,6 +1338,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1346,6 +1354,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.56.0

