Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF1F37266C;
	Fri, 13 Mar 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773400388; cv=none; b=maqOTYj81lw9DoXXLP+7fvwKKGwdsDvzvxzCt64X34MEeDze4DPmIq54iKH3OoTmTvvot2uBFy2Vthjta6R6SMO6g1cZ0RtKi2DjxBio7KFWBPSAh0Bdm3PpldZ0TYt2wY8e7ztSCPMqP/mejAt8rErdzPYvVhMyApc+vMzwFic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773400388; c=relaxed/simple;
	bh=24ZwHrdsWY5gVi6YX1lCeGYD6+QEMDixqXhlNlCt8WE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASYrCmbUSqu7YfBQfOr8ZfBFPxM+ZoRZ7Xv1+ksRk7/QlC5YUSpL/AaN/hK4V5i4WzQlF6AyRLLRCckwdFfFJWW+1BytannSqcybYhj3y/5M1CUQDU+jTK45HZP+64UasfaecCMHLOyVJgJc64km39Hhyo6/yN5KJjdooS+6cko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B46C19421;
	Fri, 13 Mar 2026 11:13:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v7.1
Date: Fri, 13 Mar 2026 12:12:58 +0100
Message-ID: <cover.1773399671.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.1-tag1

for you to fetch changes up to b1de9823fdc67a8e9cd0dcf1f6f0e9780d425d4e:

  soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC (2026-03-06 13:40:12 +0100)

----------------------------------------------------------------
Renesas driver updates for v7.1

  - Initial support for the Renesas RZ/G3L (R9A08G046) SoC.

----------------------------------------------------------------
Biju Das (1):
      soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC

 drivers/soc/renesas/Kconfig          | 12 +++++
 drivers/soc/renesas/Makefile         |  1 +
 drivers/soc/renesas/r9a08g046-sysc.c | 91 ++++++++++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |  3 ++
 drivers/soc/renesas/rz-sysc.h        |  1 +
 5 files changed, 108 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a08g046-sysc.c
