Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05DA3BF66E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868204; cv=none; b=h/Dnoa5CDgS1Q4gCU2IfqR3GLmBSzByUfBchN7ECOdtoiyiYOK2QOGuwJOSAk2j9gNFRUsj2MAcqIpLQ7jxIV9l6rfkc0dhqUsLT06jnYMBlXQ3gTV9dcRVPbm62oaLACnzR/57Sq7kHLvrlK4O0xznNmPp33azXnwLhvTPPDyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868204; c=relaxed/simple;
	bh=m2CkOrXUMCZ8u/WunDlRMPt5n3OFxplRgyHeNoeq1XU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAZkmK2X954KwPkvDXnBdxB2P0g54i4NMZReANE7Oxbhh5y8ZsoN0zDpM8E78KPXwD7PfW4YgGEdEjAGD5sy9TSRbheAF/ENuAePT9AIebzIQQpR44OgrJ2fPYjBYIwFHHj9nLDAvPnVIEAb9huEQ7GqYIh+FLfiesH7xXD9ips=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPxR6xvo; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPxR6xvo"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfa33a983so721008f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774868200; x=1775473000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSCuUeGQ5Wwf5AGsJZnlfwfrW2VQbpTSMnU1lclD7ek=;
        b=cPxR6xvo1OosRP+Cbamt+4XlzdSe+j1FOo/0bu/GbAzRfdHJ78YROC4hYJLp/7skhU
         +vH7nX2xax6YWUl+kzqCTiCoKo2frwdRFmiTnNwBYDKe88UJZdla4ZlMpz/RKhMe+6TO
         iM17uvt+VjyHSzDfpfUxkqo4aD0VTxfrW0EhcSBMuLNZg/8bWOqsGWZyCWuYnMHB95GX
         fhTyKBtTWHwXdzwodRZA1y8ezoMP1FLvf0frxe2dJrMftW0koWPB+rhpU350gnmoMH23
         DCKY3Xq+bPRvc715Zt4X4D/L0qirIddGjEfoOf3oh7GTim1REGWeoJ4aKzA2+SLhsgWV
         Ua0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774868200; x=1775473000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSCuUeGQ5Wwf5AGsJZnlfwfrW2VQbpTSMnU1lclD7ek=;
        b=fo06fyfgon84tOFmnJNN8TmVJ5f0s0CFQu/dFJJQnSe3+herK1uLM/SUgx2Fao7dAN
         wi5toNWqG1/vha1hCMpmv+0D9VcvI2yWIgToYKuQ5NraJVY7y4bwcQUL6wHwg3EKpu0O
         Bd/yKB3Y6iOgykM8EL5kILZhKUEjoaMjW1tmYAGnuV61NkVanngeUD2OSfUp9Nr9rxfJ
         0BrpU7ag9wkCfUBk2g750JKAfcWdWBZcGulriK5oMSXK4RTRXfUgTC5mX9LbTQCNrfY9
         Jd0cGMncV/77lrRJd65DBqQLKqQG9uIAO7qd/BZ+1XxzTA/X4q2mO9MURADueHAn0MDL
         LBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGsmEM8CDbIoqC2U1ZgJn6pSyqGmvMM1/kFNiAHax/7FPzuv/nQaIQeaxrTSlIjYEcSCBZrl2TTy1wjvBhXHa4Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNb0bhr9IIIc/Un99rgW3vjEoB4x7YBabZIfap+Y3uvJ8ZWTg3
	pS3ZRWc4EU9Fj5JKW4htruIHlvCjCwby5qX2/FduOPNDJDWb83TQPHJY
X-Gm-Gg: ATEYQzxNF9HpW8e9e8IDCamQpQbGVktiYrfuRcscX0wPRssBLf1CS/94W05x+Zn5aWH
	w+gflIk2LJxkL/PhTgQaLPW2TgTfmQLgP+WK4+L+OLPf/fgB1qvXmei3t33F4oan34L8VULsHr3
	Rj+E/2/zPl2pEenfIFNgvMh/OfstMwOSlZnPvRHNPeSrPnYBbO7ieX62+raZpEON9LMimv+KzOE
	0rv9DPSAItMo/X1gmpFOm1yIYqjC+am++RxjW2vHGPQW6fL+4i588NZb5Lx7So5Ix5gcT5uyuyp
	Ilu+Af2PsguQOi0ILKBj0kM99X/nsfloyIPmM6Ef2hfJWI8/6FowZR6SL4gOiojHGhnnFq/9hio
	Oy4X9HMaeTHtp1SU2F/MGrvySbxsjwHBYnSpzWtcm9qDhIKb39FJlmJOjC7mUOyoRjVhNZeFCtF
	p4a4PPoJS52QIUho6FZVqMiILH7wKqtXYZhl6ecSUi
X-Received: by 2002:a05:6000:2c10:b0:43b:4960:60f2 with SMTP id ffacd0b85a97d-43b9ea766f6mr20597624f8f.47.1774868199956;
        Mon, 30 Mar 2026 03:56:39 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf330872asm16376324f8f.17.2026.03.30.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:56:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] media: dt-bindings: media: renesas,vsp1: Document RZ/G3L VSPD
Date: Mon, 30 Mar 2026 11:56:29 +0100
Message-ID: <20260330105637.130189-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The VSPD block on the RZ/G3L SoC is identical to the one found on the
RZ/G2L SoC. Document RZ/G3L VSPD.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..5447b9b78930 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a08g046-vsp2    # RZ/G3L
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0

