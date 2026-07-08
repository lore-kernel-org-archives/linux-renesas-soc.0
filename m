Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6081142B32F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531745; cv=none; b=H/5z3rOeOpbEx1isY66E/EJ3q/0CcnbClz4uZrw6YEmHPGsIVtkgSNMgZ2diZEhF9dqSInLltrts/+xGvdPUrTOJ7ctIuqqZAx3SpMbY+bUEjTvNt/bcdqVu4oZuClf2CmzlFX+XMxzTpCqBZmh59ufB6NaZKeaelm6C4HNzbyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531745; c=relaxed/simple;
	bh=mqdUy/NciCvsQP+fZZgbJVmFw5PZUppuPgh4o1YRePY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cQHuG0y4PItwqSVVi4qJDnRuTbgAHGJMsmK8Un655toGZzeKgO0Uc/9anZgEdTq5RtZbVCqBkNirDcRnwp1sR0Okr88SgFRcKK+boxJWORWqHc8ucAayunXtr/BUewKjgyggE3GL7hdL6WEmAfxCmYHJY+Xx++HZxW+3gbzzdCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAJvOHmX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAJvOHmX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-471eeac43bfso971080f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783531743; x=1784136543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8eVmAGQ67IMlG8PbfsxkaEi/7l2sn2WhXjwC0WnRT2o=;
        b=OAJvOHmXIfoLLxCLbnZv6KumI8xVtNCHOs0X+Lr5jWPRjuelwXg50VIEYpNc/G9CFt
         gzVTYuyg6+5P7+i87gSTMOY+8ce1zDCd6ilklyaxjgcWckvNk+3rwwdb1LkrwxLlGSAu
         bUKr3eUaC8rkb7qi/zzPo3vYH943GqA/Z3FrHi4iBBGnM8dwgkV8vfitLC2rOlIyONgY
         NzMQ+lDE6xa011218COl6f6HijoFD1kIjlI4IGQ0DGXSNP066KbWSswGSyjDJieID8Wl
         s1rsZFCUEzqMqaIl9A93d/kXfujGOTBp2CgKLyzRlwoGUMFkcKaTc/0G12pyilgY+kvy
         jflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783531743; x=1784136543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8eVmAGQ67IMlG8PbfsxkaEi/7l2sn2WhXjwC0WnRT2o=;
        b=N1fpTvfS7HxNcsMiLknpwssefRgbd1qBBZrMHMQwaBwuhnVVs4OHqtpNTxX75LCH2q
         K4/U31QiQn5Q15jyGMaykPaOXP9y8rhY3fjMzzHxOefhQiXFZHE2UfE7v27mOWCse17L
         8vcK239DPUNLU+bxR26hBX5fDZC7euJADeEHCryjre9kkVOC7aqYFzA4BvDbYKEYGizh
         kPOQn0rr2P8gXu1qozs0Kbt3dtbBKpid4oqAP6BhOKVG2IMj5OanBWmmSRzaxf8tqiGX
         EktCXY4qssaxmHUXV4HqEzBoHYT47QB+d7ywSQ+tiOp1TClN3AfwR0OaOeUiCtH42P9X
         5YWg==
X-Gm-Message-State: AOJu0Yxpx/Tx/1lsXCcxKhWyUb+6dcTrocBXkBsMXSH8Q7rCCB37hyTj
	bskrZS/DziOzaLSkN3B95x9YXwmz86+5TwjjJ1iMPyqtsIwnCUIIHuMK
X-Gm-Gg: AfdE7cmSJQpuXOcxsM2PDThxBH6yU9Z7+JG/x/kSVESpWeq70jJLGtH/0DEsFjLLMMq
	RPNlNW8lc6ZB6yc+Ui0qgxVaqbpJhfyG7BCbl9NO8EzJNyIG7tuuImxYWEC6YTwO2/wZpgRV3lS
	W9agR2gF5gudciHVKX67r6bwvMZLW3fAbl5fyhFEFy0vmFO+MkA7IAnifdoIfOvKS1QwdsSQ4NC
	qM57lXYMcUJmr5WXE7+rVL/qU++mQDULEITgZIBZVwc9cP10p7eBGTIepLSUjh2Pl794fQvuqwM
	oZ1iev0eCA0uPZaqKF0sA9/RCd7wBotz/pmJLFTB/+k5hSIwgh3d0mH1PN6XW6EaDhpEIOLO5RM
	3hq9QyJqIpUi0JkESu/Z/bRU/Mk2kT9z1rSFyms4H1KbMCJBFiMJT7Z4nLitazPdMrDRj5Dm/7h
	/UzX14EQUj93DEsaqYLfRSW4Blrb1on7p75j2gQ9F6xPtMVNrMNVEldOvlY29EES2daIrKfgbIM
	iPJaP/rZ/SbqGpOHFOQUEkWCIU=
X-Received: by 2002:a05:6000:2285:b0:475:f0c2:75ac with SMTP id ffacd0b85a97d-47df07baa0cmr4140457f8f.61.1783531742864;
        Wed, 08 Jul 2026 10:29:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm46588469f8f.2.2026.07.08.10.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:29:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Fix PCIe dma-ranges for RZ/V2N and RZ/G3E SoCs
Date: Wed,  8 Jul 2026 18:28:47 +0100
Message-ID: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch fixes the PCIe dma-ranges for RZ/V2N and RZ/G3E SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space code
  arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.54.0

