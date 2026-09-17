Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB4F44E66B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 07:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629135; cv=none; b=fdnL1cU6WZed/Epc1qJVx7BsNlhRQaEjkzBbjBXFkUb+o40/HTHDE2nZZKgFTzdDuiQk8MoGsm7OaPASPDe+7Rf5MvyO3rky5aL9SfcpFGIIGTNGlaPy+gr+VmoSrtzT8MMf+oMgKD5UTpTFqmx5+X93aHzRWQ1CpgOOxRoCuMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629135; c=relaxed/simple;
	bh=9Ua/EhYdPh3jYAKVCv2j3H1lWvPlx103HcHm5KevhQY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dIrzn0IEyWr/eqA9Bs01Sjen+hPTyv61Y/qxoGcZNWIfg7nCuZ0jpu/3oLr+LByfcEA8V7nymYihE5G9L58bj7h/Xad2yqCQqDOMmS2dTZouCXlER+nxcW+WS34FZOBPzwDkij+tjZgazjepkPrz1L9saIxWZIFkmkFMioq1ZcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UbwW+fcS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UbwW+fcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=50qK7DjyK4suM+
	t4MLjyj+eojIUTTOPIExYJChdwA2k=; b=UbwW+fcSf8CtCWoshO6RKZ6i6/5I0e
	t92icaJNcJQ3qQJMZQLQujN+we+rtJNeTZvdJy/Qa2hmB2j5PUMQv8nZCz6yfyhf
	g8YAraLKib154ftdb9ivOp+z3z3KmJcartV83AldjNGLOmTI9/lpeFzrPVko+aYg
	w+AKhj0Zizyiu5++9erg+w5YV+BXmu+gIN1xq6BU4D9w5NAp4GOzFAhchjEWD+vh
	HVdF/GP2221XmwXM+bUsQYq2G2hq5QYAzwQNeLIMYeRCMDDIAF+g8M/MPlP0yQSH
	Za0KpXAQ70kXntwNsnkQqG+jEAXb3DNq83taI1a9q+kXDIl4Bwn9ThVw==
Received: (qmail 1890370 invoked from network); 17 Sep 2026 09:12:11 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Sep 2026 09:12:11 +0200
X-UD-Smtp-Session: l3s3148p1@rleegKhbaJwujnsL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/3] dmaengine: rcar-dmac: collection of small missed fixes
Date: Thu, 17 Sep 2026 09:12:05 +0200
Message-ID: <20260917071208.36888-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on this driver, I found that there were these small fixes
contributed in the past but they have not been applied yet. So, I
collected and rebased them, added review tags and minorly improved the
commit messages. Please apply.


Koichiro Den (1):
  dmaengine: rcar-dmac: Add missing dma_descriptor_unmap()

Pan Chuang (1):
  dmaengine: rcar-dmac: Remove redundant dev_err()/dev_err_probe()

Zhang Shurong (1):
  dmaengine: rcar-dmac: Fix PM usage counter imbalance

 drivers/dma/sh/rcar-dmac.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.53.0

