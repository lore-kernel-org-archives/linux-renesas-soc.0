Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF96311946
	for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Jul 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784399046; cv=none; b=mXulJaCN6IWoUR2+7EqKn56K5S1vnLa+XcgfGV15NFH+WuVs5FzLneHPMK0TawzfLjgVtrQYh6BuJNo4SCSO3lcpovamxD5ALRg5m2mTUplVRQbefjglVbRXzVM0RmsV6DWnt6+nXD/w2DbG+o4Pz5UBvGiQz2uJINdvjEk9GLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784399046; c=relaxed/simple;
	bh=tDAEKXcilQQu36GU9gosicSP8lGSjQvAAuONFR3QTUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TpJYkdUjMnyw9D7ZuTFns2KJ2pQPTBUx61WiIg7XyAcUCqx6ywiF/4XWrSE7TtSZBjTmvEjMXuRgyjg3m5y1fP5/dE1gGk0bfnJOResNUiIuEQUmBhgfGT9u7wbUq9xhrRQpUePGeHZcPaHBj/jdQjklTaKCmx9zkqcQeJbJeC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C4+M8/eG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C4+M8/eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=8W1V2U3Wyu8IxR
	zzTvXua8CgjhnXsBOa4iXJKfI4YBQ=; b=C4+M8/eGXK4rAHrNlVHX0Ygoi26iZr
	qK4Rp6mxFIe/FzGCQ0oAJEAieiCqGORjw7RMyb6sdeK5NTltHVdkYiB5UXkVNPJL
	dm3b88wqC5oRF0+UHwHxNQYwIYSeGKNP6d0eXEvx+3OVlxboEmosG5fXqCBY9Q6v
	d05uKI0xL+Toy/RRirJzOHqi8fiFrp5GLq5oa63GEadIKwZM32aaNbARjgLNLGlB
	RmCDRw4RFjzdOo2Bo7HD6iKWmXtTS6PQTWnce69u1Xob4xiNxZq9CT9tp/bx+A+5
	V15Xssoj/h4LRebLfqRGA3ZheanZgV3feuA6GgNf2uu4e038FAmuVb9A==
Received: (qmail 1821023 invoked from network); 18 Jul 2026 20:24:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Jul 2026 20:24:00 +0200
X-UD-Smtp-Session: l3s3148p1@juf0xuZWrMMujnu6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 0/2] soc: renesas: mfis: add hwspinlock support
Date: Sat, 18 Jul 2026 20:23:53 +0200
Message-ID: <20260718182355.50045-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support hwspinlocks of an MFIS core, we first need to update the
driver to use raw_spinlocks. Patch 1 does this. Patch 2 then adds the
support for hwspinlocks.

Patches are based on linux-next as of 20260714, no more dependencies.
A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock

It has been tested on a SparrowHawk board (R-Car V4H) with one MFIS
instance and an Ironhide board (R-Car X5H) with two MFIS instances.

Changes since v1:

* add patch 1 to use raw_spinlocks (Sashiko)

Wolfram Sang (2):
  soc: renesas: rcar-mfis: convert spinlock to raw_spinlock
  soc: renesas: rcar-mfis: add hwspinlock support

 drivers/soc/renesas/Kconfig     |  2 +-
 drivers/soc/renesas/rcar-mfis.c | 63 ++++++++++++++++++++++++++++++---
 2 files changed, 59 insertions(+), 6 deletions(-)

-- 
2.47.3

