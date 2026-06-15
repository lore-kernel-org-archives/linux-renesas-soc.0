Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC463F0AA9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528059; cv=none; b=gj80BUrhaQjWhUWAh8/GzzVFpKP5tusWu7Ko4AgpuMgf1bK+klN147Ay3k25LqaNQVYpArDeDrgn0OfwcaTS1/elqcghG33lGpaxaCUv2CIMDImS86F0XHCmocF8oLT2mrLnSO4/1LNk5aSVv37SYIn1w1t3LsD5Jd36SeFLaM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528059; c=relaxed/simple;
	bh=C1o6snL456d12FlzWzw8dXrqetM8B82koukk3q0M3k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kEDLbJhC/d8Z8RRYMY/AXMJW80qk9wekrrCI1rvuaFQID/eNqwgx6raekJTshW3uJoOfzWJAqiLGvQYDHvqgpbRXXfQisFf2dm1imaxzhLdW2WAFkvF3tgQLpowFJkdiMwBylz327/C5SdWc1zzGrvD9BwDDUIuN6jk/9+fRcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WHR433YQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WHR433YQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Wx+ZUCq76mw38W
	AgDzBrYZnLlrvR/EFwZquOCJHQjpU=; b=WHR433YQc0EBc3YBplm2GC8i66ysY8
	3Z2sh9K3oQ0K1FXxHIJPUUiSNp/XNh4sfg9ShiHGDPuzhXCpbStvR2z4vfoQjK4m
	Y/qax+vOml5oElmGfP/K+z5Q89uqTTAwgLDLqrJ9mYG4N1l8PRjBWQ2EGupZDiQM
	sA4t5kf2xtQs+HqDvL8LE9Y+EuD2ZpWhvH3eh1HY/PIa1USjOzzgOJGZ0JV+DVf0
	kuSzNOZah6blzrdCLwwY6+NZNOTeJe8J87Vx0mKcrX3F960fz+51oCI1wPAn7g9a
	sGZteH97tAa/Xb0BmkIc51iHDGwKFQYFM6P/wmcEEd7fXDF29gkJFMMA==
Received: (qmail 3548713 invoked from network); 15 Jun 2026 14:54:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jun 2026 14:54:11 +0200
X-UD-Smtp-Session: l3s3148p1@dNqjUkpUmp0ujntF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Herve Codina <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI and FRAM
Date: Mon, 15 Jun 2026 14:53:52 +0200
Message-ID: <20260615125355.116027-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are the patches to enable the SPI-FRAM with FIFO (no DMA yet, needs
more work) on the RZ/N1D Extension board.

Changes since v1 in the individual patches.

Wolfram Sang (2):
  ARM: dts: renesas: r9a06g032: Describe SPI controllers
  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 25 ++++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      | 84 +++++++++++++++++++
 2 files changed, 109 insertions(+)

-- 
2.47.3

