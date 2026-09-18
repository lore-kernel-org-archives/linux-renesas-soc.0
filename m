Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8473E40EE;
	Fri, 18 Sep 2026 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724240; cv=none; b=YT4GnWeUXIsdBA+tkPT0PRhXa+9NdbvNQLJlF5KOOOhP16FOAxw3iDxYkDbA/dkVCZHcdG9qsWlf0DjPkb0wbqqiqkwALcqyxGerF0oSPiUj9wu9Nvq+xEokTrO0f6EX6p5Niv8PSbLEvzhem1MWMIGRPc3/OOBsJqdRoqe5/00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724240; c=relaxed/simple;
	bh=W/62TFf5UEJKsmFzakZb0XBQz91pRDqNWkyOkobFuLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbgupZFDcMKYwkv85Xij0muB2mfwKiio5WXeVSoOW2iCes2NoriRItrkVZi3pAjWQC0EWy/ZTvUekFBwy/9ruekzVWQnyTf9vtxEMHo+EgpP7mJ53irO1gVnyo+dzGvwB4HwMJjjVaT5Y2AqjugqKGKudgIlM13DDiEOFQC01xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCC21F0089B;
	Fri, 18 Sep 2026 09:37:17 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v7.4
Date: Fri, 18 Sep 2026 11:37:04 +0200
Message-ID: <cover.1789722872.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789722868.git.geert+renesas@glider.be>
References: <cover.1789722868.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.4-tag1

for you to fetch changes up to 10eeafc3e90ebbe6627a7d471b86af889d7b07e5:

  soc: renesas: rcar-rst: Add support for RZ/G2M v3.0 (2026-09-07 10:53:31 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.4

  - Register the SYSC power sequencer on RZ/G2L,
  - Add hwspinlock support for R-Car V4H, V4M, and X5H,
  - Add initial support for RZ/G2M v3.0,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Ayman Chaudhry (2):
      soc: renesas: Identify RZ/G2M v3.0 SoC
      soc: renesas: rcar-rst: Add support for RZ/G2M v3.0

Biju Das (2):
      soc: renesas: rz-sysc: Register auxiliary device for PWRRDY power sequencer
      soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046

Geert Uytterhoeven (1):
      soc: renesas: Expand MFIS acronym in RCAR_MFIS help description

Wolfram Sang (2):
      soc: renesas: rcar-mfis: Convert spinlock to raw_spinlock
      soc: renesas: rcar-mfis: Add hwspinlock support

 drivers/soc/renesas/Kconfig          | 19 ++++++++---
 drivers/soc/renesas/r9a08g046-sysc.c |  1 +
 drivers/soc/renesas/rcar-mfis.c      | 62 +++++++++++++++++++++++++++++++++---
 drivers/soc/renesas/rcar-rst.c       |  1 +
 drivers/soc/renesas/renesas-soc.c    |  3 ++
 drivers/soc/renesas/rz-sysc.c        |  5 +++
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 7 files changed, 84 insertions(+), 9 deletions(-)
