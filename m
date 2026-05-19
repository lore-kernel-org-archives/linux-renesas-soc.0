Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4E352033;
	Tue, 19 May 2026 10:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186971; cv=none; b=Ktmm59vcrrsNsGce84EydDOGxmAKdx8Kmcy4DGFXJzP0WImZ+fMD8B5NISIs37teih7r3fgA10Fij/dX4lmqlj135JhEo7qcpsdP/Ry3a4/kDYOOuSDY7wU0wYUFeZZcpBL1d06WkSJOVnQNJJTKuPSDm+jtnKQeFuUoOYU9nLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186971; c=relaxed/simple;
	bh=NRgoE6xqvdygOt60rwxfQUmDUTz8lChhxwKacCE7oO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXuFjgnXheUKcZE4Y4KWVueBbYN3afj9TPBgzdWQlDYeb46a/vRXYjWHW/Sku3LO3ZpJmdWkkZJY4YbY+ysGbMs5Vka4zvy1Xu7zy7Uoxpegfie/yqZZtvJKy/qYoMrCr1jcGIwDZO4ChyL+QOdQX+/goX4rc9peKwysnx7dcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D40C2BCB3;
	Tue, 19 May 2026 10:36:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v7.2
Date: Tue, 19 May 2026 12:35:58 +0200
Message-ID: <cover.1779185459.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779185457.git.geert+renesas@glider.be>
References: <cover.1779185457.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.2-tag1

for you to fetch changes up to 17e48e7e5f18b45fd4a9411090148aae3b74f7f3:

  soc: renesas: Convert to of_machine_get_match() (2026-05-11 09:56:17 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.2

  - Add Multifunctional Interface (MFIS) mailbox and product register
    support for R-Car X5H,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions for R-Car X5H, which are
shared by driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (5):
      soc: renesas: r9a08g045-sysc: Move common code to a helper
      soc: renesas: r9a08g046-sysc: Move common code to a helper
      soc: renesas: r9a09g047-sys: Move common code to a helper
      soc: renesas: r9a09g056-sys: Move common code to a helper
      soc: renesas: r9a09g057-sys: Move common code to a helper

Geert Uytterhoeven (2):
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag1' into renesas-drivers-for-v7.2
      soc: renesas: Convert to of_machine_get_match()

Wolfram Sang (3):
      dt-bindings: soc: renesas: Document MFIS IP core
      soc: renesas: Add Renesas R-Car MFIS driver
      soc: renesas: Add R-Car X5H PRR support

 .../soc/renesas/renesas,r8a78000-mfis.yaml         | 187 +++++++++++
 drivers/soc/renesas/Kconfig                        |   9 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/r9a08g045-sysc.c               |  33 +-
 drivers/soc/renesas/r9a08g046-sysc.c               |  31 +-
 drivers/soc/renesas/r9a09g047-sys.c                |  34 +-
 drivers/soc/renesas/r9a09g056-sys.c                |  33 +-
 drivers/soc/renesas/r9a09g057-sys.c                |  44 +--
 drivers/soc/renesas/rcar-mfis.c                    | 344 +++++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c                  |  10 +-
 include/dt-bindings/soc/renesas,r8a78000-mfis.h    |  28 ++
 11 files changed, 644 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 drivers/soc/renesas/rcar-mfis.c
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h
