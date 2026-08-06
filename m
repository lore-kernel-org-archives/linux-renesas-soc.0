Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C164483A9
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011768; cv=none; b=GUz0wMP/wzG2l+aIPh1v84tp77Pk2uwnehdodrXms5jz6qNgTjkQg0bOj44JNHV/GxR7KXxods1F4bPS18DjjjHOrPlfys46zllSPenj6aOAeyGNHdOhnXSWkbaIW2T4hzQMNVFbZhVNSlJWUtrWvPrvt+eShVJH7h9tx4jm1kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011768; c=relaxed/simple;
	bh=0AJy8TlyfDRRw+maDVYJCDG/5w/BHVD3ALTmYIt50hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQGa0Y9K2/pmL98Da3wovwI8a+nt9GALAYUiUB4+r3BEHPZaR/+DW6Y4Y4ZbhcViwm45ho6kYbpq/fEgshtiy5RS57K/O7AcUTFKadTs4c/OWfm48LaLeS8xqNFvZypfbfwMFN7nqcPrLdNKxcgqkNcXfaC99FBUYWMkXARl/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvXBbzyh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvXBbzyh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso623434f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2026 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786011764; x=1786616564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wE1rP+31RmT4ilzk4EfZDJMKx3C1i7D5wMzh/zw/hTc=;
        b=GvXBbzyhHgb9d6vUFSQYL9W6VUMGa2TT6hsITkNGixPKcnajQ2gn78TtI/iBeLwsut
         v61xhEU2ET2EWqg6OGgQBQLEJZz9L0MxbFyYIsIwe698TU15Yrhu+rRQSueAV0Ilvm54
         wzcGAovGdF4Snll2s1qAkf19UyEzJSRxYJrGuWn1PgE7bk39ftI4+yLoEtwwAVN+YWoR
         cDa60j8yWivGlJR9VHDm9YU1bSZhSSeW20KzcZtt/Hh7ZtzUXo/b9rowt+5FtzdD/OUE
         Ml+LqMn8d6PA8F1gOS2qz3eSCmZefnt4GYlY9h074PydyP+sHZYVreE4sFNZUmIKRNri
         AW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011764; x=1786616564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wE1rP+31RmT4ilzk4EfZDJMKx3C1i7D5wMzh/zw/hTc=;
        b=PUTlsw9FrirVhXWtqxptT5KDG22tHaB3JwxYEksL58LI580F59aeEarHueoAhH/G4j
         bdGw70T7K1A1C2Q9JgYzsdmbXZaWN67i72qAgH9ngGpa0v3B1XNJBk3CaMogXeweSSp9
         942+ejsLfFb80ru3Nhl9i3DH3eDcFE7/Rasn0wVIsbbOgYDTvy9MpWS0ivFjifUnENg5
         6JsjJyIo+sL+icGpaZO5WBQWlC4MOIIPIiWAV8QU5NIq9SlkOovn18DIq6ngSzN7Nwfw
         l0qlukNU+cj9qAJ0kmLtzjL44oao6qF07/swS/QInqVBzTYmFG3lCtSdsg8La/Qe+JXX
         uGTw==
X-Forwarded-Encrypted: i=1; AHgh+RqAzUIcCKuF+8ryX/WPSh+GRJ3NyRLdzSdmzAMO5Zy4syGvZ+owJiDRI37JmIowV8/XSJvhnEOuQbdg9dJ6yKE6/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3EXE3NlnUhhImn/terbNa1Na7QDtP7g6vNq59uPZHo++Hgzfw
	7jPxQCaUWzugIEK8GuBjPA2SSTuH6CehrfX7nL+W8bVpO/wZvA20OsfT
X-Gm-Gg: AR+sD12CRguF8eTZHWXSXzFFvSjDa2qPBmqA+P9OWzR+aS9K4Hb+bteVuoKInpmlFQ/
	MXgbCcoiW5ZEuSWNp/IiEn7gM2sM+RI9nRYako2Rm0iAs8FYI3HkwxCUyBoxCcmG2o+AiIPEeIU
	8ChuAIw+ci67ah5c4NoAutz+nmRKf5QGWWT3fY9LGVK0NNIwici15/9vLAYLHEh+mLvHFyjZX+O
	02WkSWgY+hT7G/VxAyGpYqTLW2U2nfj4lI+cSfPHf0rUjXt7QuDeQapbt+RNNTcdfLO4p9EzkcO
	IHFd3fN3u9eouoUUYwEwPrkbQvpFgRLjBZSdT8kc0GQIUkH6oxNG1kf0V7sZNvLW+0NdEgv+bjy
	xdalu5X/J/p72Wv/MFcoExJ4M5tHDrpu90xAOnPKTMowjxSTLk2lzc1i79TADhxpt9rcZRl6ff1
	rEaGYQWbTKv9PV+Pj1cbF0BgM8aPlegosGaXuG6q6OWp8+PuFYtwnTSfQt5+vW8hiQpynaYPkSl
	KJScGcvmc8h
X-Received: by 2002:a05:6000:604:b0:47f:7526:598 with SMTP id ffacd0b85a97d-47fec5037eamr21046463f8f.12.1786011764300;
        Thu, 06 Aug 2026 03:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a173:17cc:14ec:8d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm5634553f8f.24.2026.08.06.03.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:44 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 06/10] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Thu,  6 Aug 2026 11:22:25 +0100
Message-ID: <20260806102236.149159-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
References: <20260806102236.149159-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change
v4->v5:
 * No change
v3->v4:
 * Moved the patch for easy merging.
v2->v3:
 * No change
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 9740e5b335f9..d6b9d08ceec6 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a08g046 # RZ/G3L
               - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
@@ -132,6 +133,7 @@ allOf:
             enum:
               - renesas,usb2-phy-r9a09g057
               - renesas,usb2-phy-r9a08g045
+              - renesas,usb2-phy-r9a08g046
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0

