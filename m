Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816496;
	b=g+pIRisg68czIgiRAzJi4Vbb8XggoIpZD3Of3Q+TCHIdz3vLpzbbLtWL0zZotQWrNzMj
	 XlziY/yZ07vaG79BN+5wC8aE3DtEj5Z5ItAkiiAGSDmjIoGJpTvVPSsVQCOxkq/L/Kosi
	 nMP1u8a3cne5psYW9fE9qtqwpmVmkZqOSQYYpcnjxEgodNoGq1VQ+KbV7PTwzLD+Pvdxf
	 Q1YoMjvvLn5vtQoAkURN4cmECukB7p8I1AhBVVh4tfCVVCmyoxvp4Jjf5wwkO0hO31jRC
	 maBk/V7rN0eDHfgQpYWgs4Z1CfKr4/X7rrFQ+jKC+A4OxXKHiiTIesNhcZhQkS91VJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aTDvp/Q0M0o5LAma9UuHl2ioDRXCh/2jQrBcsrQNRLI=;
	b=1q04T0oGltue65rWtBwBE4o8eAjkXCpzd7qTU+Gj4kfJmUIm5hB54wc/fgg2KwX5oQBT
	 mjp928ZH/wff6nS3DD5up9yhWxdVOYUhlHkWchqD+PmNxaTRdRAImIALRdsjounBKILVQ
	 Y6j+dVY17if0XQeovkUw2tDMZceuFFgFxke8IH1+2MsAtbElbYOJhx7SUdSov+sBa5J68
	 JudP90kDlUyMDzlQY096fyBdobyiQ2RDnvPqg0QaUy8pFYEvD4KKZ9U7Q9U2JXaPfQcAV
	 Vtyp9LMOGVwZ/E1omjx1M5+4kUyBf9PmthQcjjXeldN7H8L50e05fIUc+o5iCZPCSlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7DE60A5BE9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7DE60A5BE9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df54150dfso713125f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816485; x=1794421285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTDvp/Q0M0o5LAma9UuHl2ioDRXCh/2jQrBcsrQNRLI=;
        b=aRNKux8jXMUGWHWagH10tnaFubvYY/cvfOC258fy0pVp0hcDXzySw/Q6YXq9semX30
         farQ9acn5oTFCbz1nQL+p/mcyFEYgrwgN5EvIVBNM71OgHEeF1zic8TstmtsCVUGPmJt
         svvzBkSOKPQlpOjEA/yBPnevN7N4NF7wBRjNZ1Zp8UNyUZRom8veuAMr/CkVFaneuGp4
         +M0dgse9SXLkSvVQNLQPEmLpXsXnEpd+P1McqG+XoZhCaKxL4P989KsnwcMm8oylWep8
         e32kq2zNveMI520KnbsIi5VuE6ZaIFO8ItsZWsNrPQZSO1WSM24gLV/gsz/cuJyQsZK8
         2L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816485; x=1794421285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTDvp/Q0M0o5LAma9UuHl2ioDRXCh/2jQrBcsrQNRLI=;
        b=2LsBNrM3oFO7E15bfHdswI9tsRukmDcM+41xJXZ4B8WYpzoUC2xTAlfL7tYD9WRcvb
         M1bD/LHKcS4oxbbbFUTx+YM0Mco3MXnmk/tC1qsMfqyKkSMNp9u/Tn6b1vr7dKaZqpUP
         E0TAuFFxGyDzDtgQL38ngIbjKqkCP5O2LGlX3GxuEIwMw6EuBsl9MRWnkLGWzI4Auxla
         bm7GLtkW50Vy5WOvZtAvsmYMaPsiMxPVSF5CZ/uZ8u0SvBedHS2CWVyldNIuXLnfvtzJ
         qYyQRPyjfnrEA+9eLJAbbuZ/lp9/k6S7YA7NGY/iVqTr1fc6Wph+rSJNaeFhWO3hLUtN
         8ckw==
X-Gm-Message-State: APuU4Z8pAlSNT6UzyN5bUEQbGg+N9ZZZve/Vt8uE7N9PLEkF10gPMays
	XDK7cqssbPBA7mtjjN/EzXpdzdRWttMGY0Fy17qV5WB1D45EM8ECsXNc
X-Gm-Gg: AYBFou3xyqN6F9z++JKnmTvk+OVra0s5Ab9zZ/+NtMbzJDIOgmJNdkTMwjZwn5gUnli
	xz+FnH4FajM9qAo240xYO2v+qADyXAmpv0h8skBDujZYOAqFcsQUXVI2mhnpXKfvprbuy47pihk
	Y4c+HdRFqFXsUjgJp0TSfhpBEkO8GVCD7bDPwurytHnGgYhjUc+mLKMg9ZE0GuHNLAxUDUj81PN
	TEsWFLkqvmygVuVHFSvAc+YhwSlFELMEzA4xCeG8uTakgmP1fjd3to5tce2H+m2aFzlgZsrBMj4
	8F1lNFdWILMbIkLnWwfTfYX+jpmDf5nlI2PvmBJ5u1QznOPvysVIT0+azuMWEzISPNVZVh/O3Hw
	YpQez6av10Wjj5uCy1ECH4LJmgBuTE3nCp9u3augAFyLuUwYDkAnxFidoFiko80j+hnWPhj1S++
	zMs8ruXwsEFlVZUxhHm1rnw/hTVEqwgEjY7UG/bUQUMUw68/aUSqWiKnnjAdOxPFkgctQWiwxWI
	H3K1l7f+D5hBxzQW8hvuoLHUnAdxx85/4lbBd1Y47Bpp3wFatJpVTa2cuJ58w1OHXuZRnbpzibi
	WIFfR53mI5fbSIwhnbxpjmrpYq+BVpDfM5Qb9NricT0Oyz2R08K1opU9qOSgyJ6nHUpqg6XpwNz
	6a5GqpbiI9BIZuQnO8wfaPa1lrQU0bquWxUiuLQ==
X-Received: by 2002:a05:6000:46ca:b0:48d:f541:a6e7 with SMTP id ffacd0b85a97d-48e6e4f4976mr26708137f8f.40.1793816484784;
        Wed, 04 Nov 2026 10:21:24 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:24 -0800 (PST)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v4 14/14] net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs
Date: Wed,  4 Nov 2026 18:21:02 +0000
Message-ID: <20261104182105.1102555-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the Renesas RZ/N1 A5PSW Ethernet switch
driver to depend on ARCH_RENESAS instead of ARCH_RZN1. This allows
the driver to be built for other Renesas SoCs that integrate a similar
Ethernet switch IP, such as RZ/T2H and RZ/N2H.

Also update the help text and prompt to reflect support for the ETHSW
variant used on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tag
---
 drivers/net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index fe8cd5338fda..f6894495b9ed 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -101,13 +101,14 @@ source "drivers/net/dsa/xrs700x/Kconfig"
 source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
-	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW Ethernet switch support"
+	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-	  This driver supports the A5PSW switch, which is embedded in Renesas
-	  RZ/N1 SoC.
+	  This driver supports the Advanced 5-Port Switch (A5PSW) found on
+	  Renesas RZ/N1 SoCs, and the Ethernet Switch (ETHSW) found on
+	  Renesas RZ/T2H and RZ/N2H SoCs.
 
 config NET_DSA_KS8995
 	tristate "Micrel KS8995 family 5-ports 10/100 Ethernet switches"
-- 
2.56.0

