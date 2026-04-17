Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21352459CF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448363; cv=none; b=oAC08NgEuJpDL/7Yuc34esZIyFqJiTSgjVAL2frCW5NKwGeDh9r3XiY83x3Lsgo0nPxyIAGAuUYdQlrOL/IyXa+7LfLfUNLu1eh6k4rcwNSAYK5gZfSBYs3xD+WrblUnKXUZ88sTaLwTtYFiOR9uky2CVUKvu1isw9WrkGgUO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448363; c=relaxed/simple;
	bh=1Gbl7j5RgGrpS3xQlJWZZo05JfjN/Ba6GAfOHPnyx5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=db6CbL8TPPWBeMehA3axiLhaXBTrbs0MFWk9MzQdg4utsH2QMF22j35rbrE3HfPiuzVw7HZWrDBITps4ADY4FNeeF8dMLkAqWTOCfqjfWkbotQHSEAVFulddjLR2CNs4+DkzkEvcEYULfjH8uvX4OhLhJ/nfR5znER11KHNATkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFed86Ys; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFed86Ys"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso11659645e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 10:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776448358; x=1777053158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kcWSZcx8tUSQRJOSIW4G17Zl7J0Fx/Boua0I4nA8bg0=;
        b=UFed86YszqtTAxA2740WEqT9z17X6/a+9ZgUFxmsUJNu4CKYmqmHqqOqd5aankt4/P
         bAS4wai+/HJxNQ/zy3QyVuorweDe6u+AqoaiCiQA4pkjPJBGBbMv+rzzPA9ejr21S7ve
         MRLfrl2YpdA46WGeE94/WpP1rJc+q71vn1mDbuXDnI9DkjZDlpvJQ3MTGQVSoBeYnA70
         w93fzo1MRkSNAenaQqkmpmvRYOGrHv1EnNCQESrpN3sm26C+cAJGw+BkuM/TNJHJDpGx
         3ZznzWK+nOvjaLhZxNHhyiUJKo3QEmeQ7wgm+D1AV3SgWtVFwFSfgs0kx6j+FzT1WNSF
         UGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776448358; x=1777053158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcWSZcx8tUSQRJOSIW4G17Zl7J0Fx/Boua0I4nA8bg0=;
        b=JTt3knldlc4AFMfeDHphFsa7+CbAaBV4Qc8/xjUKD7k+g34GzDCjlEpEAuYwjXLdqh
         vlTm6SuY3W+Rfb6AvhRImMRti9rmYbEwEwipRQHBM0U4Bduc7CbBTzvf/O+HwTJK00we
         1Oh6eeI91BXzC7kr0R3lkIwmdwxB408ADsf0RuK5KQSnolrJjJwvMk8eAW3GzQW+qLvK
         BYIxTkLngNOhzhDkhE82BJ9d3lXs+WL/Sf+QDLoN6BHpCRka6I9mDcQB0Hj0gVo3dyEB
         z4lYhdoYZNre2NhYm9U6YTl5W+Qy0tY+e9f4l3BvtV+ftSrW1pKTPQGw+ibXnpBnwo9X
         nI2g==
X-Forwarded-Encrypted: i=1; AFNElJ/KwN5DNLKF7Muf8r+2CSP5cUOaocHMjN9qVuPnqNOkvq8D/YgiU8Tv2AY7gbagK962dCa8155iwBOa7/V19+KwXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp18QgwG6hP4NGc0gwyVgtKEHnBZ11Xh7jeni3IKdZ77o3+T7L
	Uf1YSN/VFtqv7I5v0k7ItV4pc5hm/+P1uCjUuZ/9oGsWcTJCR57tm2LX
X-Gm-Gg: AeBDietH8HixPxwa9UkooBZNCfqVSZFg7fvAW5w8DDNYhMd/QE/S9TxoXZv/ZaJivh0
	pCVAGbn0ko0HMxcZKtz7LtBHR7a8bvMz87D22LFK8cruvqiHYGFS7cOxA+QNAsFrALXeYI5y/E3
	qynZyo1Ju7V4Y2vM7wlKPz+Avcqbb5zeywMMb/Bq3ybqA5SFwUDyqb8co0BjfFstZU8hUswxZzF
	Pi7/YqAFOavIrWSG9QdYcBbHEi3aSp0wfbwi/dLqxmirh5En78Jz6Q96H3IagCKaWIL4fePN01u
	t75vdVRpBripL2PLBAf+TLXUItJktEM2cUb7OknrdaT1+9rD/w9ptU0RZ1vAdQwtj204UPs1jui
	3oQJez5tALf2ixK6oyGtZsJmdm1ZLFhQ7o5x2UvW/LWQnxyXipgrAf6zzc44K1B5io97kke317j
	JYXowWMqmSDlSkZDiilNFvdh/T9DzCV+GalI4hDkP2
X-Received: by 2002:a05:600c:350e:b0:488:a82f:bb95 with SMTP id 5b1f17b1804b1-488fb7861c0mr52097255e9.29.1776448357547;
        Fri, 17 Apr 2026 10:52:37 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:528c:590:5bef:9bc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm56166535e9.12.2026.04.17.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 10:52:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add support for Renesas RZ/G3L LVDS encoder
Date: Fri, 17 Apr 2026 18:52:27 +0100
Message-ID: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

Biju Das (3):
  dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L
  dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
  drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder

 .../bridge/renesas,r9a08g046-lvds.yaml        | 128 +++++++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 333 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h    |  22 ++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
 7 files changed, 524 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,r9a08g046-lvds.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

-- 
2.43.0

