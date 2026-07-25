Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931A02E7390
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784992270; cv=none; b=UMDjrmIt4UGlDk0OngZKSYvBtoNXGDH4PH1jPZkZzydb1KQt0gBi0tXfhnCehZQ7a7goYw7xGrkLXyw2C3bGErf8XM51pIxdigBsDRTlbrnW3+l+QfqX4qfCyFUMon0hpaVeTb0sT4ibZw4PSAYWpM8euRYgln7CSompql2fxeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784992270; c=relaxed/simple;
	bh=1ypKcIZETNEITGeMh/DBgTjLBGiZ2y/Q0iD9vHffUSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xqwbc4/Bf8lLxN3OrnLtYu91FrzzYtvLiLDIa++w32/4l5EIPH4KnluuJHH5C0sJl47Tc1On6BlUg5pHtIH/Oo+QlP6oypQjlfho4oKSFdvY7W7Igmumb3FxaMZIH0Zz9hWPqITk5H6boUZe8SkWOX9xBkYEgHNsN1lkkmgm4hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oURwklN9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oURwklN9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1288448a91.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jul 2026 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784992267; x=1785597067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SL7hBFcGY09oOgMOCy23V3evuH2qRKq0H2TcKBdPEAk=;
        b=oURwklN90/3jZlgPlnvtFMTkH5+ATLcTdF/P5yPFgvbAq/lWOEP6ICnA9SNdORUWnk
         /UJ4uBJ/zcSpmb4a8KdRcI/i48AUDTpzYkmaXhM2AsHyg/vXly1dvY5XTy8iX47oFy4a
         OxkNkYAQxhcBtj4qHUwk2OqF7vZp3zZImLEo2gHZ6tFGUee1vH8k0a2z7K6T54PPWm7x
         5KfXcQ+z8jBfU3A6CnwYPLWuH1TNxzbZYasGrhk5rStfzk6kRvxcrR2ATA8MW45A3hUv
         ONnnNViXMkBtRwSEGSQjMZbqZGrIp7er6Wn2E2iQRfdAsHpo4xskFmWeR8kAWgPzKFmU
         UIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784992267; x=1785597067;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SL7hBFcGY09oOgMOCy23V3evuH2qRKq0H2TcKBdPEAk=;
        b=RjWnFdbT2hiKRipgiUsDOPn4bptkwxFJQO/i1Ir7HXm738rWft3HCKsLibZr0v+jSI
         F2puP0DFsKi0zQ7lLSoWkFmuQ6xqdSOe3AOpL64SpeoETtMyt2MVK3lEIOtMekdoJiqc
         1LGDgeu0LTfRL0eOhm517ASWA9ZGEFWLhYUP1pq8urkbg8U/hVBlKdL1JzuMduyojGzl
         KB/STrjezoxO6iI2Q0dZwpEuRnrXoaayy+XC9kTPd4rtlX6TV5MuXPT0AvrTQm3Xsj+q
         +AAeQiUjBsXIYQsPy7ecoVSyUVSPUYRmQQTCFR0DXO4GR9ckm129SC+Y1RMbqWUuKNSs
         R5Ew==
X-Forwarded-Encrypted: i=1; AHgh+RprWSEmxqJD+f3EzysrHJVM14lFIdOD2q6dg/74VFhGSHAVmFDzM9jlMkxcHyQfc/zA/2ogQLd1mFEb1CQog4LYtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4GunW6PjVw4ISKwUMzzdHnGMiQ8JpOIvhhD8mNgjRmdemZmYj
	D1i/yv2VKR5no9iYu+3Dt4vqUl/kmGmOKeh2lCs5g5eAJoTg/2LCxFKH
X-Gm-Gg: AR+sD12sLVsrwIIHbKJ7wEhwtfCptPRuRQoquoY58KI03HdnjYxP78z5eCSOzt4xcHz
	PgJRwWAr1ZQaJoU+wAAuE3B7TsNC2CkUk5/p78yz53UkjOqXkSXmuAmBYdTNecSIBlMjRq4l4oq
	nGR5uwLTHf3RmbN8Pxi+ifxJ7W7WEFRCwiIeG0DdCkC4Fuvambf6LITmlOygYUrXAemvAbTYpIx
	Gs42K8LAt5YmqKz1wVgCKR6qQrIECGchqnFGUh8BR/aMh/srcvgjceKcPgX0+5Fs6GARwbgAKk8
	o+DHsxf2AANrQRRIC5GJceSAUFmkY5mbKJ3WL1udI9rKfxQHUGWSyemMxGcRxVr0umNgJpleY7h
	xfqvh/qMEVaAFrx33o1Kc1DcpRrUE5II5u2bW+xIZg0nxKjnbNzIvTHIokY7Hr++iZbv9O385
X-Received: by 2002:a17:90b:580c:b0:38e:7f1b:f01 with SMTP id 98e67ed59e1d1-38f2977c3b9mr2576061a91.36.1784992266734;
        Sat, 25 Jul 2026 08:11:06 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm2907665a91.0.2026.07.25.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 08:11:05 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: kuba@kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	David Arinzon <darinzon@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Manish Chopra <manishc@marvell.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Rahul Verma <rahulv@marvell.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Sukhdeep Singh <sukhdeeps@marvell.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: GR-Linux-NIC-Dev@marvell.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	UNGLinuxDriver@microchip.com
Subject: [PATCH net-next v2 0/4] net: remove conditional returns with no effect
Date: Sun, 26 Jul 2026 00:08:48 +0900
Message-ID: <20260725150852.859188-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series removes conditional returns where both branches return
the same value, so the check has no effect. As suggested by Jakub, the
netdev patches of the treewide v1 series [1] are posted separately.

All patches are generated by the Coccinelle script, which you can
find in v1.

The patch grouping is unchanged from v1. If you would rather split,
merge or drop any of the patches, just let me know and I will address
it in the next version.

---
Changes from v1 [1]
- Collect Reviewed-by tags
- Change base to net-next/main
- Filter only netdev patches

[1] https://lore.kernel.org/all/20260723184538.3888637-1-ekffu200098@gmail.com/
---

Sang-Heon Jeon (4):
  dpll: zl3073x: remove conditional return with no effect
  net: ethernet: remove conditional return with no effect
  net: remove conditional return with no effect
  net: intel: remove conditional return with no effect

 drivers/dpll/zl3073x/dpll.c                           | 6 +-----
 drivers/dpll/zl3073x/out.c                            | 8 ++------
 drivers/net/ethernet/amazon/ena/ena_netdev.c          | 6 +-----
 drivers/net/ethernet/aquantia/atlantic/aq_macsec.c    | 6 +-----
 drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c   | 6 +-----
 drivers/net/ethernet/freescale/gianfar.c              | 6 +-----
 drivers/net/ethernet/intel/i40e/i40e_main.c           | 8 +-------
 drivers/net/ethernet/intel/igb/e1000_i210.c           | 6 +-----
 drivers/net/ethernet/intel/igc/igc_phy.c              | 6 +-----
 drivers/net/ethernet/qlogic/netxen/netxen_nic_hw.c    | 7 +------
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_init.c | 6 +-----
 drivers/net/ethernet/renesas/rtsn.c                   | 7 +------
 drivers/net/phy/microchip_t1.c                        | 6 +-----
 drivers/net/pse-pd/tps23881.c                         | 6 +-----
 14 files changed, 15 insertions(+), 75 deletions(-)

-- 
2.43.0

