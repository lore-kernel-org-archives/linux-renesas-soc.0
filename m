Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0B3BB689
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596905; cv=none; b=CEQSVxgrkecrGfe8Ixi/IUkrROVBdlevcavytsyaNgPwwn20X61AfPAu26CgH7pzlq0IsXWhqsK/GqnS7D3YmvFI5y/30pdkKBA0Um/XU684mMNtnWXKfTQeTIjmA8nVo+HReSM1awyeHN09/fyOw0LmNJSGB2wfpHQ4Z3lHtek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596905; c=relaxed/simple;
	bh=RE1FnXeJKmLcxnjfLZPE+aA4Er7Xf4f5w7XRhWJ2yG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b63OLuQhpRChIGKEXs3dK4WzsDiPurYUcxb1BHbtkcQYYuvxfHeXzDJrG4PfmCGLcOz7/hjwa9s+8gC3QGinUZEanjAsUGDmVgMSkhA9X1fKZSF/QMuPMYs700PPwVpIeXOwE2xiy01YJrvHuCE3Ss+xzyadRddS5HA2egR/kgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1q0Rg11; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1q0Rg11"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44a74032ff8so4190175f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596902; x=1779201702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0HvXZD2JH3Hm4dxIzGecREAhsQ21ewQFNBJt/muUZQ=;
        b=X1q0Rg11rqEnmW7xVD7XGEeuKfMJc4d6EosDo10YOEQVguH2kmg6/Rsa8/b2DWRWuF
         BU6vrWp+LNMa31yMey30tT82A0/eW1aGY5bjktN9Qy4qhwGkm/zuGCnfnTxjmGnfgHVY
         tAm4m90G0+Xc30GqM0v+oNicqrdxeSVBOdsYVFZI1DJVLbyfhxsROvQFlVnZm5acetx7
         ulLE++/TNZ5V4kBncYVb9qICU9ENcqrPiFkwS72kLSNqOoQS0DA83gF08woCnb0ZVb7f
         sE/w9mJWV2sGRls+1alrIViIysu4YX+tgCWN1gYd3sRGyPw5S5VEWshuBzImZEYJ/jZC
         XfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596902; x=1779201702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0HvXZD2JH3Hm4dxIzGecREAhsQ21ewQFNBJt/muUZQ=;
        b=SlqXWw3ZqhJHzBczVjzaX8Xm1UudC5W8ClASFpXUIyAu98pR5K9+PAN7asf7YjJbJL
         pfsCeSdBXHf/bvn4fIcw1EE7580fbo5Ru1+yOyYVavYDQIEbM21ocfmHJEwrFg/6fdf4
         tLjN0LAgC0+UwGO0eXGA7qB4wSJWtPoFHVbm2PrCO5lMfUPS3ed0kgJF+Gj92OP4JoMS
         1uM+NjWWFj+ohVz26dsi9rbnmMAR+oTGXrlOxtsQUoLbbyhtytUnrza9F+oDpuUM5Bbp
         cfAbhh4t5NR7ivVdgOkvLIYmGZ0wKaIyDqz8aPuieeYoGf98Sd4Y0P3Fb98EA4pdubZ/
         qlVw==
X-Forwarded-Encrypted: i=1; AFNElJ+xUJDN6ZnBMttYdC14NRvk8q76DwzIw6UKSU455h9aOWUVzVNLfDSZ58gz8OBLi+o0gIqwQ/kuKWXDSGSW9+7Rhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNP3RL3cHFRr1qSXbbv3IKYL6Atj9cyROzj3htB/XW5EYh4VZv
	+dunXuvPPWbhqaHNNvetoJxJ2fwW+Q6pmDKE5JXj7RZ2lvAT2qY0D/HM
X-Gm-Gg: Acq92OE9Qlr/z/MQtRKyPO4tpVhW6X1jIhrjfbBk53Zhp4jBD4ZBjoycTpgfPlu3v/D
	42m/7flWR/RwOtenZMGKLpYlIv7YARoUa5SGoMsGg+KgOsPqOMaFewYNeo0uPya8gUGe8GhuxCU
	ggLQL6DwYI5o+3gZ5F3IGdNPj1bop0HYGMbq2kEIlUfytTn1Tyr1UgTPc9dGApJtLSshlWhEEca
	vAMsuvBgmpN0w9dZLOonv1b7CJ7R2ewNpubd8e1uzu7XhIcEZenOoGeo/P3ZVO0QNHm1KTIAQ+v
	MOQYUJTn/8X/HlTN7XCNzsLeeu/fTDq+FAyrkBXMrIFCfO36saat7SnKMGSxym35QCzhvyK03EZ
	IhxXjNMml5yFPIBLNLP7/yL6X9OgeDG5pq2sSvSjEU+u1bQxyMOowh2vySyhrbIPjrPHMuGWZuy
	SKeKWn4I4JHj4muncaoJbIkeUQXrvtaoKMSqs8eNGTZArqiMYB/CrAGol2hSXXSA3jTW9pp0fHQ
	QuoxbpV42sjUrVMVgueNll0ERkQl5MA9CM=
X-Received: by 2002:a05:6000:200c:b0:441:36b7:725f with SMTP id ffacd0b85a97d-4515b056aa0mr45843437f8f.5.1778596901460;
        Tue, 12 May 2026 07:41:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/5] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
Date: Tue, 12 May 2026 15:41:02 +0100
Message-ID: <20260512144104.761531-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the DU CRTC initialisation to request the reset control using
devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block does
not expose a reset line, and treating the reset as mandatory prevents the
driver from probing on those platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3:
- No change

v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 26b95153ce88..48065f4952a3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -380,7 +380,7 @@ int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
 	struct drm_plane *primary;
 	int ret;
 
-	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
 	if (IS_ERR(rcrtc->rstc)) {
 		dev_err(rcdu->dev, "can't get cpg reset\n");
 		return PTR_ERR(rcrtc->rstc);
-- 
2.54.0

