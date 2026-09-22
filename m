Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78F4AC17E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107536; cv=none; b=tndAebh6w2BB/8d8PoNKv8wA3nlVZSk0PgmSgCvz2SHIakFkn1egomJf+uz9EYHEHY3WgAVQuMGG0Nbp6PcrlZRZGf//xRrPm3iUMW2Nt2p+/Id7b7vibovzkEjfzIH2QFCMGYQakB33xBSZhOYzDEkdI1ck+wjQxT6P4hBHlWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107536; c=relaxed/simple;
	bh=fh2Uu82ejF0DtKt0brgXH//fEo0R202bASP2cymwUFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsafOPJEs05sYkbY6VobJ5Y97Gcj/C5luoaju/WiBX696lJ+TSF1IfnSqmQEPD10Xaf3q8NNoQpVg3kFVZs/vaF7LwO4TwyUCtOU7Yzp2u8Tg9t5agtN1py59PO8wemmSZ4nAEQz/Z/z7YM/YoIyBgCC95nFuSBGKUzbxQZB6x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdSVq3K+; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdSVq3K+"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d903e972efso1031895ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Sep 2026 13:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107512; x=1790712312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=UdSVq3K+yojQHpnGmXGkAEkPTwJMk03Ajk4hF9OLMwsODOjQCbvDf+WSAgGPzHIWq2
         nRgmIJdoOtiaRZUQPD/DhCTuMORzVe9/jqNUoQDo7z8ZzIP1FdXm3Jbo7tZViUWx/m31
         mfF3kkwqEvFh+8FkrYN59yqQKqKabszHdHIUpi3BwZZ4l9FlpmJHXUFjaMmFfT8kaew/
         dqm+gs3l9v5N45jo9WZ/YYs9i92/yVuHWd1nTp1K2lPxtAkEO6cXxCakPlh1XJj13VRM
         YMCFM8YYrgdAsN6HoQjVmGG1cS7BIFlI4ER2QtgfLQl7oyIKbQBmNofZOf90LUkmEbNL
         KdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107512; x=1790712312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdJAnLwrz+/OjIyJtnetxy2JKy8P0MsUYxFs2QuKaus=;
        b=th5gU8NI5AK2Vmai4xBMjuTgKbyYE2RI+uo7p/7HOGrEP7GE64TzKE4esx+WV7s614
         I9Mxwtk+3nswKnYuu8k2KrgPlydBVttSpEw/9BIr1fXwVqmtRelP0PlnBm2DVUsHkORA
         0ur8pkwoEf9WzH6SobDVkO2Flu8Y5X+XgGhTB3pxq+EXwKVLW2K6QnX92wPW03B4WuSG
         vdI3Fhd723LaFDtL1Sr/Dwn+D1BdS1yVMckFJoBQWat/7/vzREBnd3/YwI4T1U4nrxvS
         WnwCfFPVBR7fdYB20BEQmKxrFFO6qkWNlhmLna67k659jiID9KMBzULC4M5WrfHvODqj
         17NA==
X-Forwarded-Encrypted: i=1; AKwUvBw7XKzKriKopb7bik5LykqAdv4+llmU54aSvq8KJnT3YZKNAGsOU0Rk2idFdnBqtHYbq9MCi0qmpFo2X08C+uziuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lnYooVf78ZZRJ6XNPMBlNPjKvAswadkP6VBCC4xUTIYXqa9B8p
	SGteYnSIXqo+uzKA7ZgBIAoXphivSz6gJc+31aH/WVNCJCNbKTOs3+Ik
X-Gm-Gg: AYBFou2SyPNObnnGfnAKm2srK6s01hd/3S283JmZUhX1PGDn5N6bJEg7ozfvvXM2xLD
	6378n05AY+pYs47xbkeSKq4fMsEdlTaqCQ60AteX7DINoiWz/QMwDfi7oHu+LrctXy5ZskIJOfT
	LR77TJEy9/FKC7n0DVcv+dko75rlGI55/wAmN7zSFLlquURm8oMxXO6c1nOsohn/RVU0DqypQHr
	viBzEtaHgmViOSJLeU6iVwcL5RrsL9Hz8CZ9xQLbKQSnwkjbTxyucPEdcgiZpgZ4tWeAzatjdPB
	FkTwbrOvGzsoS5pyvR+WHEww40vwJ+/0OcASSJD+EFJ7uvOFnGpqRgs6Ik/rGWBN+LB/K+iO7Hw
	XNrtr0QRqKrFoYgqQlJlWEMSm3ynjIGCHOymHxxameMcFaIB5bg5/7ickkzk/seobNnOYRvj0kN
	Ix6O5eYiQ/T4sSAen+3SFjXFY3EC9uca2CVnK2pIbKqzUYl4ttsRgNI1kK89BoJQAsuyZT
X-Received: by 2002:a17:903:234e:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2df69d3649amr4211185ad.22.1790107512560;
        Tue, 22 Sep 2026 13:05:12 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:05:11 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Wed, 23 Sep 2026 04:03:35 +0800
Message-ID: <20260922200336.2201212-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc3cae2e378b3..085589b8ba65e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23740,6 +23740,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

