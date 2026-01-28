Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6C34575A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599842; cv=none; b=fzP2rfgHLGUz/QI1zdNVJ9QfTtEX5/r7MoRdua7KXNLuP2f2pHeDhAa/on1+qh5DzHxKgQXCfyN1cvicIPYrY1mNX+H22aVQthMJrJu7Rze1hPh9Il66HsGg6NqUIDkiDuv5qU58Bq9yIC7hAUK+mFm8wyGC57LafgoxQv9zQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599842; c=relaxed/simple;
	bh=9v+x0vlRgzi3LTj4XFgPGZ/SN797NNC98jDGIlLWXsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCBAvbAo+WzNlt1k1xNK3t8KdPfhqUHC6BCM83eTNrHZztMRBy2hmLK2SSVy9zJQjB3r8wFZfd2J1ZnPZv1tl0s8z8e6ZJ+Jt17UdPj1XmxwbEE1YDOoE7XzjAb8wkHJBImGEVJc8YvQFVxdJFlaa/pZCHifmiPaF8ISbQK5xQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAS4dlor; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAS4dlor"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b884cb1e717so128918966b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599839; x=1770204639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X75yIl6hGl7Ae9Buv3v27ichOYcema+RgTkjFX2ziCk=;
        b=cAS4dloribF+Khuj/KBmpXembibNW8VqCdPnZhWmuG/y5nVlY55mis5cHPV7KJFtoB
         XxrGFn6FBhsomC5OzuJVZGLMiVmD2eD41o4PA/w/8wtmDF97qYqy4lg1AXpivURsjj5Q
         ul2Ixn3fTD+psWX81cQSr9uu7CDYnB2xtafGvMEitqIM7+q2ddr5rhKWvdXp9UZ7KF8q
         U3GMSzs0M31Gn7r6tqzUnfH64eRK4feLPt377QbbibVaLn3zWN7vlYTNifHvm2Hd8Eb9
         MjOr2SYRpWY+fKNY8sJikce+T01hbV6vt6wrzDT6pUg7fPETBG0tNDXlAdxzqx2MZDqt
         h9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599839; x=1770204639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X75yIl6hGl7Ae9Buv3v27ichOYcema+RgTkjFX2ziCk=;
        b=Hx9DKcUkOPlv8o+k9RXXW92TalLnkHfEP+StzbI3Mv+csBdKtKhJRJWMPSidpQlqSz
         WyQCf0lzjyOry2E7sKAQSkLSx8e4lbM86hvmlHBnSfZkhtbcOJiVnKAARRsSUndYBx4g
         W6v7ogA4fia37NXqgQo1MBMRsSe5wvjAUoDAg0YDKBnsZRb+4Gnzb0NJFbmUMq0DePPY
         Lnb2ig04JJ5YpepH7kWXhWdA3WcAYUMjUV2imSww3nlNBLErEx81GSuZonm5e3lvk3dJ
         eUQuEV7VudlyHEQtGYNZli+hlz1eLffBAAkvvURmzbauAu6f/ewdcYq8ucaIij3SIu84
         XccQ==
X-Forwarded-Encrypted: i=1; AJvYcCWODJTlgKGsYShdQG1xx3fF0++y1wXeVg1+22bmWJSb+MHgWdPh3k6NxxUiAKyLNgitCW21Kacpm2HR1c/qBVujtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUC9L1qANANuAN/JLlJHVA9sxrXa9IyIciU3tCTIWqQAKKWG/
	QFp2+nMUE3Jg0IZmnJrbjx3qxjw07wURI0kdgUG0Ft8tSD1Cxhtz/H9w
X-Gm-Gg: AZuq6aLxRemhgxcmkHmqpgoBF+lTURy1WDHwyGPF/bgOaBV5dN+DehQ6wY9qpWKD+A7
	KJfzkK/yPjf2oqlvOjHGcOgg1QBsUdMNMg1oGVM111sax50/0EwxlzDm79wO7eC9m9tNUcJOrxk
	Lp8JKXPeYQlPHgsUq5u5CDBD6+/NjdHABH4vf64tEa6neFRN5J1eVHlS2SLt3a6fY4LHvjA6cNp
	EKXzVDxxAzXCa299eIl2eTE0vrNMoMuLvV9NyR8T2gNew5so2i1zGYnP/M4esLPUxHs0K5hgHIg
	IUf8dVbaqUrJ/kH01DBUCjk36EJgI5RzUHOjcHOb2aujUYbBqwKofHMRnQnW5FkVnqhCxFKzzl/
	RCsw2YtU0Out37kNtMbZFpxGMZYfaWgq1iPI8znjIPuK9teVLX6vHCIiUeJOMU6f9ZeQy6bCppr
	VpGiymvoGThSU9Eim5t1DPMAzPc6y1yQ9zwtw=
X-Received: by 2002:a17:907:3cc6:b0:b84:3fab:4251 with SMTP id a640c23a62f3a-b8dacc4209dmr406559266b.15.1769599838621;
        Wed, 28 Jan 2026 03:30:38 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm114400366b.46.2026.01.28.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:30:38 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 03/10] dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
Date: Wed, 28 Jan 2026 11:30:22 +0000
Message-ID: <20260128113032.337231-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
References: <20260128113032.337231-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RZ/G3L (R9A08G046) SYSC bindings. The SYSC block found on the
RZ/G3L SoC is similar to the one found on the RZ/G3S.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag.
---
 .../devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
index 4386b2c3fa4d..94ae72eb8fb6 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzg2l-sysc.yaml
@@ -24,6 +24,7 @@ properties:
       - renesas,r9a07g044-sysc # RZ/G2{L,LC}
       - renesas,r9a07g054-sysc # RZ/V2L
       - renesas,r9a08g045-sysc # RZ/G3S
+      - renesas,r9a08g046-sysc # RZ/G3L
 
   reg:
     maxItems: 1
-- 
2.43.0

