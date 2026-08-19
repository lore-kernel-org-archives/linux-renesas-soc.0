Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAE3A0E8A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150188; cv=none; b=SmrA56bLGM8dLRlVI69qaczn4cqWQfogEf4nDGJIc10mPibKziGPFlFFpv7dphhB8G4Otw6t6qLebs4hczaU4Y+DDP2Aw95Y0krUxptUimiHcp2hiAE40Gnm2DEpE3f5XBW9LeNX36fJqAtCZFRFA7OGhYTZcMLnNiNyvP40/to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150188; c=relaxed/simple;
	bh=z3m6fox0VDL5+p4WGInn9Me43qPCmqPICFvZd8M5Azk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBri9XFifKNUlgfkCAkcSPFYhsfZ4vi0R1UeK3MKMMVBTQGiO1Op42iGDc+Dq6lkhGf3+YapgDmih0pBdtvRpA7i+GvCqNNLJa7ElkJhWvH2Qrh2qAjOU2TLCnFMY6sMuPdpOODAt0OvU3wQEVJYS1cWZid3XyV2M7jwRhDDpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gsrE5JKX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gsrE5JKX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso12659015e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150185; x=1787754985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5yTeyQ1vVAKMn0PJztOwFpeHkqkgo3sW/fF3NuHvjQ=;
        b=gsrE5JKXPw2lxpRjyJEiaxyPUd1pU8t/0ubzf9j7L/CUXujQi2zmOalOUYsPisha21
         xFBDX6pAskz6fnYtntzd292CL9DQ3B2cQELsoSgfapRrO1jQxgl5JRpb41ZNu1ZX91cX
         hsCT31B7STR8s9pHP+Yag3IkC63FWzB56NC2syPIJ6KOi91BKZHKbncBq8fk2zJrSN98
         ApzAv+ePK07FFh1dgw+fv0zq374G46QmTTRUKi14ljzdSkNU4AcEoPT4kTm6t8jdBoLL
         44cG5K7TytVkTr5tzekrxNo9DLY1Ii+TjvJfzr67K8Db1DT7ZkUdzIxxR9SU+JwuFpd0
         DF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150185; x=1787754985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5yTeyQ1vVAKMn0PJztOwFpeHkqkgo3sW/fF3NuHvjQ=;
        b=kYCecgGdmnketqVYvIE4EuySJxH6ui7UgYht9tvZD5JESde3YnzqQRmnyuL+VESTMO
         phj4Fe7exykdmDWF++Cb5bPjPOwBXDjyanPE3zMDSRh9PX+dpytN0TAIbjVurakqkVMf
         AidHMDAubCN1Q0nlBWg7tpYW2/QCIGDO/DLGNsBaMkbbcBF47jJmRqHQC7wFzk6acBzq
         xiFi1TBCR6e4GKzwDuhfENi87fOwSHyhIOvsW+VVmGb7QwxY/ooSQ8awM0cLUBIfXRM5
         OR81s0e8A/GX/F/ufSRb9d6ZpPSc8PzaYgju8lmexwImFIoFcZEnR9rAaDggKe+YvmqP
         6whw==
X-Forwarded-Encrypted: i=1; AHgh+RoNNJdUgQfURyLf2Xbx8S7M1lOSUrkTMl1j9DSwnyZy0vcfLb/Rd5b/KEBBl6C7AQ8z0CfgEJJhxvJwvZAMsQessg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz15ft8SANHC+N32vo43GMx5JuNcO1AMFJsSCdw2spMCJKk3dry
	8H/ehF/6q/2ZGCdmKMky+LFGGzUk4nZ4T+e8jnHxI5Ee5POeJ/U84t+DExoQneLMO48GxGmV0EK
	duW1a
X-Gm-Gg: AR+sD13VYxRG/julp3GfpYHlDtjyeb0nZnjFuqRwkFaPgZiPKj/S1ybuvZihBoADo/u
	a7sD0SP80OL4p7zA1VaK9iFKHMlyWWBDEK1pCCpGUEOVdlxWCdZhYbKECoPYTpov/KdRj/vvnwB
	nPp5zbgM98QdkHuda8xcwYeyf0TnprJ8WY0i4pjNnAsQdVPR+qazi/HlVPuITavsNrz220XGQCy
	KYuB/oxRWI6QHMdUVA2rEK6PhJzTMllxD75G45Bgba7FBz7io/Onl1gbeyAPvWFCEqv6BlVo16u
	mNUVrZP/f5HjoWyA1DX5Dr1IgWBkG1CUeiRRjkjuStOI2Lt6b2fnyLiZC14z67K+8wqFPyTW5lM
	8Ef81OTAhEnH37RW9Gj995jipq+/ZwbuQh4aFgWjzviJt+n6p/lMaw5P5uqBNJzRWYHFtbsxrTc
	0K96AOT2dktK2bS7HWzzJM/cDGAINaRW935BOHGld5V1CiXEj2XEuRR4s3N/LsN9Wt//xeszBtS
	MoDefT8EN3Y74LqSH8lUHLZM0aE8PkybPRcMFgU4TkHsfM+8C5qZMgOkg8w
X-Received: by 2002:a05:600c:4eca:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-499aa1a7a53mr81886955e9.7.1787150185026;
        Wed, 19 Aug 2026 07:36:25 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:24 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 0/5]  pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
Date: Wed, 19 Aug 2026 17:35:48 +0300
Message-ID: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
clean I3C support, cleanup patches for the pinctrl driver were also
included.

Thank you,
Claudiu

Changes in v5:
- collected tags
- addressed the improvements review comments
- added patch "pinctrl: renesas: rzg2l: Unify the power source handling";
  as a result, patch "  pinctrl: renesas: rzg2l: Add RZ/G3S support for
  selecting the I3C power source" was changed
- dropped device tree patch since it was already applied

Changes in v4:
- dropped patch 1 from v3 as it was already applied

Changes in v3:
- collected tags
- added a fixes patch (patch 1/6)
- dropped already applied patches

Changes in v2:
- collected tags
- dropped patches for configuring I3C standby

Claudiu Beznea (5):
  pinctrl: renesas: rzg2l: Generalize the power source code
  pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
  pinctrl: renesas: rzg2l: Unify the power source handling
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
    power source option
  pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
    power source

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 313 ++++++++++++------
 2 files changed, 216 insertions(+), 99 deletions(-)

-- 
2.43.0

