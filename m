Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E002137C931
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633374; cv=none; b=qQx964BZRVg52XkKZfLIfkgrz5Ig5ikrkQ/vJKBAiXYZRCMx8VJKiqjb9MdBovq0+AP/tIVf2kPLwAonyd6NbIc4FiNTo4lUGby5HytHiHB1Cs0oYqiZ57zjjciSk+2RYTnh7Nd4FZOpyFj5JIP6IGwAPFTu81mKX838SRGJXJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633374; c=relaxed/simple;
	bh=rkgiPTNK4wJ0bIJI5clmxZqKNMgXqfaXzD1JDS/WFM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3H5/rMSHr2ncUzhyJC9eXW9iz029IDa6XBN2Wt8vdP9MeMjlCGmZGoq52YdQxjUMdbOQcWXhlEQEknzsh6u6Nb6AzoxMlGqgHxxZ6qMVDGNUPyA738EIv0yZmNkFijq0kdLQaI/rAJi47NYlxuWSIlkLOfbRXwqmNH2Ken3Vfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGY3PbqW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGY3PbqW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fb439299so22648375e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633370; x=1775238170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kH691RpikDb6X9g4K/wrujahyFXI0sMtAOZYtzMJ7Q=;
        b=UGY3PbqWk779Y2pkvS6r5Vkm80uVxN/vpof7crvTWCDQ180jkZmmxXHd64usu8h3Yr
         pzGQE/yIzfaMIrfT5tKh6BF2s5NDs3TSPVoOsaVLiHcpf3CR/g8eSqn4v7sDO3w94yqS
         ocb9RUAkdUWgiZ/cRAbXgwjBTKSd6BlbPmYFKKjfz0+s5lF1P9d+6hh0z8NvmKwWqTWd
         BTuccpmPHSablvEptlaqNWuNulYd3l/7F73SP+rSVm3YHgoBT++p3JVSDdI2oeQsbpdM
         nIlI66auqgjFehyCWKITmfencp+4dCMNl6fVX0pI3yBnwgTg505wl32c2es4peRYgy6z
         0qdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633370; x=1775238170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+kH691RpikDb6X9g4K/wrujahyFXI0sMtAOZYtzMJ7Q=;
        b=mlbkI0TgfXWYIf187xz+uM5TKYshCty8SFg59oeH6NvmTSWmyDHfpymUO2RfhufjUx
         cJ9NJ/jKHm3ykGr4a0PsijJf+ku7vsKQfZZupYBsGipdYRLyZQs4tOOw7RIisoOcMMo7
         vVuKIxdqKE2PZThwN7g1nUTc/06Jrm0gC/YPKZYauAEWpbcDu+9tErjp1gq8AQYqUFgg
         gDiSfbg7XkyUPduqtL6uA5vPvIPWeqIWBZOZ9JyUIW8R+aHM5CX/2HWrgOysabWmPBAN
         3T59Npuf+uomsXRYVBpKwVA2QZoeCQWm26Ewom+F5Vj7UaQvSe3jjN1gpMvZeySaqARe
         3b2g==
X-Forwarded-Encrypted: i=1; AJvYcCXCRjUweKa4hxdANungiOaHxrWnA2NjgcqkMiButNpOZtiUufc/gMxFGGCRvbVrKGt7B07NRjXh/1pGzJvsTMukeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeR0GBxnBvb1fO36QKY4hH2TQMVnex60glarhxZg9muoUKA9pp
	oXIXeoGxszZafewr+n4f7FrC4XYDJM3WRQ/Qaalr2FQDyxNCIrzWAXwa
X-Gm-Gg: ATEYQzxoewXZ8Fpac/V+q4kb+xvgj5801LRhQw3OE9pqDmxUJ4RQu+xtEndsjXJ9D8E
	5TWJbcaHI0hgJhKA5s6XvqhpMDil0OcyNlEYp/LEd+is3fYPe3bmCvuvtu0JWA8AKo4LkSgiFvv
	L/c2UrwNl1KRi9aXMCygl/OxRfgVbpmyOyln5NYgnp51xh2q1XCw0GYC7PabmqGZc1Ojo9xD79t
	ioanhFDpksmTLrN1Hpfuqt/kEXr/4kkmP7w6PQCVWcY9M2BvDgewkKF2wIWGLUgrkRQ5JGHJMlX
	ksmktpju1jleQd7lwzdZMxVVYRpFIHZ4yiegSkO3IiE6fUfzTctagndQEK7uD4+RcjWqx2MZ6OX
	0K3OHIAOuiZwUamghs2qiFNFawlr/xZ92gC0hsyDcAyenrB9SQaRgK8qPUljkQMjpVJYj3puOqg
	tuRwWV1afGU2ZFBJK2Mny58hFCNsch3biFikG+H6Z6yf55bg9OwYKYDWkEecubBUa5/bGIyWV/W
	g0g4MGtCzvuxiGTmsygNuMFQawzKhoN1P1PxZiH3kbMNac=
X-Received: by 2002:a05:600d:8:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-48727f7b951mr48655495e9.20.1774633370224;
        Fri, 27 Mar 2026 10:42:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:cad3:5596:28d0:27e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm15965933f8f.1.2026.03.27.10.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:42:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] memory: renesas-rpc-if: Fix duplicate device name on multi-instance platforms
Date: Fri, 27 Mar 2026 17:42:44 +0000
Message-ID: <20260327174245.3947213-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On platforms with multiple xSPI instances, the driver fails to probe
additional instances due to duplicate sysfs entries:

  [   86.878242] sysfs: cannot create duplicate filename '/bus/platform/devices/rpc-if-spi'

This occurs because platform_device_alloc() uses pdev->id for the device
ID, which may be PLATFORM_DEVID_NONE (-1) for multiple instances, causing
all instances to attempt registration with the same name.

Fix this by using PLATFORM_DEVID_AUTO instead, which automatically assigns
unique IDs to each device instance, allowing multiple xSPI controllers to
coexist without naming conflicts.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Add RB tag from Wolfram for the rpc-if duplicate device name patch.
---
 drivers/memory/renesas-rpc-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 0fb568456164..3755956ae906 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1034,7 +1034,7 @@ static int rpcif_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(rpc->spi_clk),
 				     "cannot get enabled spi clk\n");
 
-	vdev = platform_device_alloc(name, pdev->id);
+	vdev = platform_device_alloc(name, PLATFORM_DEVID_AUTO);
 	if (!vdev)
 		return -ENOMEM;
 	vdev->dev.parent = dev;
-- 
2.53.0

