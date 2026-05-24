Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40E033D51A
	for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 09:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779614423; cv=none; b=oSZTiSkuziM5U42BPojZGlCfWY0Ld8FsKmUqTHH0PW/4RQ9cSqGA8+A6cenzRPapJ/21NIflr2GwZD/TIEXTKUYcE9wRJW8YYte91RsQ+ZI/ZHy8iPFbmjvhGYhe9TPDlCMZiWFil391D0p1x2TxhpZU78K2vnEbHLAgkH7jO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779614423; c=relaxed/simple;
	bh=m5MldW8/rj/cmWsdxos1cei2w4g8s18jCasI/5xDt9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s104CwbjgH5G6upodwHpuCDErpUA2Yw+iWrqa81NAqTPnVJ98J0+1B0vChTDECHAHptVc+ORgoAo0pkOCOUSFXcILF6faCJQvLMS+LPmFG5okFx3CXCLGaWmJxW/idG2HTs5VzpRfE9trSLoruuPPjsFKCfzUBemXVb2BF+Y2Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duOQWtjP; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duOQWtjP"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49041e84237so18145635e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 May 2026 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779614420; x=1780219220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBUAhsBB20qNgqheJcG9wI7Ac9cNCmknHQW+c+a7mQ0=;
        b=duOQWtjPGifffMgAK0gY9fpvEt8ziUtsyPGUF1k2NAC8kgSDWKZnZx+lZRqxIstHek
         B/dgmu2N15UpbeSDwHdJFjhqA8L4NE/d54wUQTM8GBBo9otbi3YcKcmUwjR3jAk2J+yc
         yQzDShDbvY19QqVKnbx8exL/fz0N1DNuHALqef9S1CmG4gmnTfi0YVZfj5+5jyHwWstQ
         I0MYecraj5PI4ogX2PM5Yjn+ckiF7FSafM07ggMwvv1Opa6Mx1NIpGJpTuiht3k2jCUU
         jKvza3v8v+ZmcFUfUSX5YJJJuP8rnAat4epbNEYUS5a5fH+ehhoFLuAqTa1z/P+jutLJ
         OB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779614420; x=1780219220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBUAhsBB20qNgqheJcG9wI7Ac9cNCmknHQW+c+a7mQ0=;
        b=hcVjaE1fhscSHhD7sgmKjVYDD27Td7EJJxSUK2GVt8NmtBDYDkWqfDrWXWhvyh6Rob
         3OZheyTS2nL6YCtcf0TNj79O7rK97pjbaIqcGQwKT/lKFT6/g6o0khZ5Pl1nFWDA/wuY
         H1+rCvPUp05Q0fXeWnm9VmSoHj+nEicX3FZO1OM9NKgfvkzxcfjx5WtbgNR1tBFMI4WE
         OfYFTtYYaZzo0Rds8smHOZZzlj3YLNMkG1ZMpeHXXaqhDbevltB2ObO7RW2J2gb6FDAO
         gcZ0bjLt4NKIXS3zBXwrHzIXLmLxN4vU/fkDqseWOLWqhWjREHolDrLc/Dzr6JXXCX6D
         jtLw==
X-Forwarded-Encrypted: i=1; AFNElJ9AnHb7AvzdL60/haETV5M1zmSygGyQvScI1M+QEzK5UDN/rzv5Tv7L3Y2Su5KM5VDgmoksl5sRF+9DVJkDnaWAqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMLGNmKwlNb/yqQL1ZSdpRdCmq+QQgigvm+7bD+rt9I3a7tMu7
	+fx6N13QtmHEAQdXcOq8LLvWx4AzVIPeZ5BHY9iKeny61hZU/rn3RCQv
X-Gm-Gg: Acq92OGDn+ETfxQDcMUKmS8kqTi4WWvPuc06tgoNkX0MsZ5rG602DjUdSXMAPUDO8Fa
	Gg+rK90CZv8Vuo6dX2fzPZDqeZVD4w9KDa13xVCmyUYqC/kYmZpfXqkFXO4ofHKlrv9M5D9fRjO
	mjFcBVWvVqb8hxhC+vARMzDz6/uUoG7RO0uo5Awr2jGROwTCBgGj/rxsLDcJbLkfVMuhv452iQL
	hKirXHAZIHnI9drik24fx9bErH4pFdkmHDl2InP+nvBgADXEpnJwnapI5lVf4a8gYDZdrZJ/JsF
	YtVD4lTkX1Tzm+6PBxQnMN46DlMEUV1n387EBSy1WVzpKmCFtJWJWnzNCAQVWJMborbuiKDcT/g
	j8SA0kyy56roSPG8bAMOXtRVVHegy3VPig//cPgTtLklt0KZiB/eywvEu/nWfFTuKZRaEG5Sq+I
	ZvAW7UAoS2zAYbiPb82i+XX3zGblARRY14d8AsFBl5JJTUlgYpwTxH7ysh8Oc=
X-Received: by 2002:a05:600c:1992:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-4904245f54cmr129956015e9.7.1779614419836;
        Sun, 24 May 2026 02:20:19 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:ae73:a12b:ca55:91be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904179c615sm59140785e9.4.2026.05.24.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 02:20:19 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: dts: renesas: rzg3e-smarc-som: Sort pinmux entries and fix blank line
Date: Sun, 24 May 2026 10:20:11 +0100
Message-ID: <20260524092016.46346-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Sort the pinmux entries for both GMAC ctrl nodes in port order (A/B/C and
D/E/F respectively) and remove the extra blank line before the second
pinmux assignment.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 49 +++++++++----------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index d978619155d2..2e1d9686df88 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -193,20 +193,20 @@ clk {
 		};
 
 		ctrl {
-			pinmux = <RZG3E_PORT_PINMUX(A, 1, 1)>, /* MDC */
-				 <RZG3E_PORT_PINMUX(A, 0, 1)>, /* MDIO */
-				 <RZG3E_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR (IRQ2) */
-				 <RZG3E_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
-				 <RZG3E_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
-				 <RZG3E_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
-				 <RZG3E_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
-				 <RZG3E_PORT_PINMUX(B, 0, 1)>, /* RXC */
+			pinmux = <RZG3E_PORT_PINMUX(A, 0, 1)>, /* MDIO */
+				 <RZG3E_PORT_PINMUX(A, 1, 1)>, /* MDC */
 				 <RZG3E_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
-				 <RZG3E_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
-				 <RZG3E_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
-				 <RZG3E_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
+				 <RZG3E_PORT_PINMUX(A, 3, 1)>, /* TX_CTL */
+				 <RZG3E_PORT_PINMUX(B, 0, 1)>, /* RXC */
 				 <RZG3E_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
-				 <RZG3E_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
+				 <RZG3E_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
+				 <RZG3E_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
+				 <RZG3E_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
+				 <RZG3E_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
+				 <RZG3E_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
+				 <RZG3E_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
+				 <RZG3E_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
+				 <RZG3E_PORT_PINMUX(C, 2, 15)>; /* PHY_INTR (IRQ2) */
 		};
 	};
 
@@ -217,21 +217,20 @@ clk {
 		};
 
 		ctrl {
-
-			pinmux = <RZG3E_PORT_PINMUX(D, 1, 1)>, /* MDC */
-				 <RZG3E_PORT_PINMUX(D, 0, 1)>, /* MDIO */
-				 <RZG3E_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR (IRQ15) */
-				 <RZG3E_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
-				 <RZG3E_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
-				 <RZG3E_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
-				 <RZG3E_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
-				 <RZG3E_PORT_PINMUX(E, 0, 1)>, /* RXC */
+			pinmux = <RZG3E_PORT_PINMUX(D, 0, 1)>, /* MDIO */
+				 <RZG3E_PORT_PINMUX(D, 1, 1)>, /* MDC */
 				 <RZG3E_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
-				 <RZG3E_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
-				 <RZG3E_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
-				 <RZG3E_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
+				 <RZG3E_PORT_PINMUX(D, 3, 1)>, /* TX_CTL */
+				 <RZG3E_PORT_PINMUX(E, 0, 1)>, /* RXC */
 				 <RZG3E_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
-				 <RZG3E_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
+				 <RZG3E_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
+				 <RZG3E_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
+				 <RZG3E_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
+				 <RZG3E_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
+				 <RZG3E_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
+				 <RZG3E_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
+				 <RZG3E_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
+				 <RZG3E_PORT_PINMUX(F, 2, 15)>; /* PHY_INTR (IRQ15) */
 		};
 	};
 
-- 
2.43.0

