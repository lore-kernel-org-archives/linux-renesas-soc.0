Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571532;
	b=AIWhiCkE17LhsXwbRwsvKHCRWZ0YJtm5DhY866rpqypI/P00OfPQf+RsexlbeW2OtFHq
	 IGK4RLxQDFao1GsTN8Y6GODCJyjSP5Avbhc88L++kuH7wxkW66ojIRYqqfb+TCaqMCqph
	 HvYdww08E1FfqZi/4N1vxiUKzdeu0uAIAje3EdBDejAXMPEhNA9bL/6uBYFKT8VxYhrwD
	 lvo5TVEQQoPpDnYJiU417DBZ22VX8vrs6Ob2HATLjNBnbIOWUXSTc/BRb1w14sUAi3VNw
	 KJR/Q7Ze++gKGjWasS7SyZUli0X4mr4X3i9xtuuC0isrcDPjf4Lsjgih9bqN8ICZTrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
	b=vxUbKbc+cV3defvsggzaEjvdaBChKCxw0YILLDX4NbKjsc3UBz8+b2VGEvAlsDoyXLVK
	 noAWxxjNzkPAJ+FvuZ7zuOq9MbrHj1ycdvqYRcMCMksWB5EChswyHTLollOhNxokEG4M1
	 QQ/utaZmRoIhvPLIKBoZN3hY2krQ0nzBH18OtyDPwPKrQ4zb36BTVV+Xdu8ZAmWX6ifVm
	 QmqwePmJt7ljsf0URbjkwoyrZY1WvS5yKlIhpw5hxkzWOhsYUvl23agOgNHa1FNvAc9t4
	 AD3kA/iTeq7D1H/lOfRAvx0oIr32H2B1/sPRGtwFhaFiSCRMLm/QZdjq+7gAaKrqorA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WGFF3bMt;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EBC606A327
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 08:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89EBC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WGFF3bMt
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so2244145e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571531; x=1793176331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
        b=WGFF3bMtm3L2MCSgwqcPw1tNav2ZALn+Bngjm7GzzU4hX4q4RFGq5Gh3EsljyRJhJa
         gtEWV6CgGhtpoiTgz9qTowDGguEKIa+2tayYDkpS90FzRRrZSJvCOFEudeBClvsy5lt7
         2JB/aFBbGlRaPK8x9nVwMz2H238wFAY7uPHdHELygn2b/dTFpTIKWA3fLZowaUi++RKg
         XCulAINhyz2YcU+IGGuldgjZ7HjlEqrRuiLpptIGFApm4NrWr7E4iB9wgmoAEvEMnN7w
         L59y/D3AOS+o54FnC0I8vh1c8PN4ebggO1cczYXpMOM94PAS/h6vBk1gXPImOb/2+5Tq
         d0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571531; x=1793176331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9qEf0UbcRJY+bJhc+G+4o5adeArJnR2v1vDZogjWd8=;
        b=RwoiiK+naRRowhT6Gwc3lyG4TJCCFjVZ2bHZVanITxkfINyoI6I9qFCn0f0TSHod6k
         RfU5Jm+ZhEDuwtR9kCLS3yp9J4HdsnxpGdcM5x06fD1emzyzklx/nTOGHndOBEl7voVv
         IqQrilIGthiwF0FuVGC4AOD74R5uMDcbUepf7eWbCokloGENhrlUdmR25lMReLaCaQYz
         HM9im3PkKkG9zmndTzP9gsf36OIWZo/NXI3h7x8IbjTBpDxne/ji2iTt08T5BYeEFklx
         lc2lSjVBQQvJwsLIAo+P+R9wnJzzwxaxuPHd/eK6C4/sfN6Wj3LUoBL7ms3crOKGLeVG
         B2og==
X-Forwarded-Encrypted: i=1; AKwUvBz4OfE/rtP+Y+ub5JCdwupGNeWAJYTgZHA4mJUIH1ooxnbgOt6HW3v74BSpADqkAjiwUga000I3SgDFI+VJbcWNLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvFzqESfcC9gV33TwHWkzLkPgHzWbWfj6rPrq7jpqWfu/b2pam
	CWC5WdKTm9aWI7Mel/LhLqOjA829hDVdy60hVywaxA9dzQU3wPgT0cVD
X-Gm-Gg: AYBFou0tQu6BhaA58bGrar2Bsxn62xUoA4XffMAyvKLt4I7zx7oEZXInZ0iDxJ0UqG2
	m9a6/7lZrawDPJa1P+Qk3cCN6tcytfr6jy30PSSJr4d/GcuzQm4gBP+bJMP83Xs2/K58Vfz8Td9
	aVDL+1cZ+nY4yS+ZGE32CVSfRfaWWgvperuUp1nCSt/qnUmdEbghLgD1HJD5hqqtHlva+dqCWK6
	TaMKyEnAaMMYfU65X0hwdPZA92qWKUJiudqgOq+5R0pIlxvWtGOHEYUNSDy7/h1cebPXgXRWKuv
	f8Qx8X5Jon8ey6pIMjgcIymhc/bcapT60J3peMwQtj/O1vrEgGLOXtNrPqwUm1SOTTWjxZRqlGZ
	qygelIAKqsCdiYMEYtpchUQ+uX0P61WMYWjuM877FvikT/1egO6DCLiRSCvZ/CYl6eODvyJZ3zD
	uXW/HKtMmSg5fFkH2I7diQIr998b74xK0j2F1pDPlC8Pqp+0fF/GrmI+Nl1h+Z5Dn251JLzBvvk
	F3BkR5OphQXHrJxFw9g30gJ9Q0kTuPzgabW/GTrfGH1O5/5U1VFOx7tcRFrRCkQkgGTfmzWKQXl
	w0iSLr+VfGwxvTUxjg2YlUsm9gx53iEe9WUYdIjiD+6j
X-Received: by 2002:a05:600c:a08:b0:4a2:1cc:6551 with SMTP id 5b1f17b1804b1-4a201cc6bf3mr744085e9.35.1792571530863;
        Wed, 21 Oct 2026 01:32:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:39f4:e118:e272:79d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd2eff9sm36250145e9.4.2026.10.21.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:10 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
X-Google-Original-From: Biju Das <biju.das.jz@bp.renesas.com>
Date: Wed, 21 Oct 2026 09:32:01 +0100
Subject: [PATCH v6 1/4] dt-bindings: can: renesas,rcar-canfd: Simplify
 renesas,no-can-fd description
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-canfd_rzg3l-v6-1-b4abfdba8e70@bp.renesas.com>
References: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
In-Reply-To: <20261021-canfd_rzg3l-v6-0-b4abfdba8e70@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792571528; l=1656;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=bfMkHO6jG7ziyusENgghR+SzKGm1uT2oifSo7PJ+O9Y=;
 b=DR8TBLyVCK+H8wHymBT4C1B4+LTr7fsl5n2fceAH5tJAmlGsaw+sKf91GRt2XbvtV/5/OMa3H
 W80PWXcyrgPDfy2c1Dpe52/N9O1lj5l+Dm3X1ujbTjxfStsZMFqRQyp
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

The description of renesas,no-can-fd lists the operating modes
(CAN-FD, FD-Only and Classical CAN) and which SoCs support each one.
This is not accurate for every supported SoC, for example RZ/G3S, whose
CAN-FD controller has no Classical CAN mode.

Drop the mode list and keep only the statement of what the property
does, so the description no longer implies that all SoCs can operate in
Classical CAN mode.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated commit header and description
 * Simplified renesas,no-can-fd description by removing the mode list and
   keep only the statement of what the property does.
v5:
 * New patch.
---
 Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 1a7a9ce45e97..81674ea4bef4 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -145,9 +145,7 @@ properties:
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      The controller can operate in either CAN-FD mode (default) or FD-Only
-      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode. Specify this
-      property to put the controller in Classical CAN mode.
+      Specify this property to put the controller in Classical CAN mode.
 
   renesas,fd-only:
     $ref: /schemas/types.yaml#/definitions/flag

-- 
2.43.0

