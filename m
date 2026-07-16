Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEF33CEB92;
	Thu, 16 Jul 2026 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196235; cv=none; b=I7Ny13qrkUh5ZnEhMOo9U3igb7bZNt9ZrPyKYDU4k/T7SEOHalq7e658iiEON+Ep/D9IdggHwbeiq6Y07VC/ZKzbJ8Dilpq+QhYJUsLurJVmRtw/f9sbnyg2F6V6hRScX6h5TfMH9geV6KVD0q2Pki0HT7v6KvHp4iNbwJyAqvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196235; c=relaxed/simple;
	bh=jDv2JvNTfRoqAYc5EfnQAQUHRkSuMjVYoRnXa+s4zJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfgcWFe0qxQ/A7AJSPI1t1zqFqowcOhdl45MKh5SWtH+DlB0V5z4j1vqvWlWkGBPhvRtY+AaIjiruG8XNXNHlKsLJMHyMJ0B5tARBdH7LelxUH/jXP/i6M0ajK8MbCRWFyp/hI8oBioiHMbktMeYJosCjSQryO48xPbIRFymvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423081F00A3A;
	Thu, 16 Jul 2026 10:03:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v7.3
Date: Thu, 16 Jul 2026 12:03:42 +0200
Message-ID: <cover.1784194405.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784194401.git.geert+renesas@glider.be>
References: <cover.1784194401.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.3-tag1

for you to fetch changes up to 07231087d5e24c4d9c578c824b96f8af913f7324:

  soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS" (2026-07-16 10:03:33 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.3

  - Drop duplicate default for ARCH_R8A78000.

Note that this commit was just rebased, as I had accidentally queued it
on the wrong branch.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: renesas: r8a78000: Drop duplicate "default ARCH_RENESAS"

 drivers/soc/renesas/Kconfig | 1 -
 1 file changed, 1 deletion(-)
