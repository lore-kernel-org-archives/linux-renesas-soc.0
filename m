Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6453A5E90;
	Mon,  1 Jun 2026 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319907; cv=none; b=tKuqzxa7AJQdgGDiWrqvx8JYovure7zwGa69H7S3WyQ+oC+n8fAndeZNdhblcO5f4nSW9XA9wsz18/WvBJSIQkwSmYtKO9mntoSrxCcCo+fKFfi3SNRadKTXmYxFxOqQoSKLXwxZtwQ1NBBj+ruEGu2g7wqulMzwnBgIxWv6DHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319907; c=relaxed/simple;
	bh=tMIt9vpn68LCDZbLK6BfNCPZwdcJvF+Rbj5EWvtiTcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtwtHGIA6GlFjuJP0LPuBULjW8jbUEQ8Oogj0zCUJK8jmHksxQFtZZ7zzLJFwuMTQ74Gwo9TJ6ftdLE52a/HRKiByMxZ7FLQmJOtkhVqUfX4Aw3FXd5HMPflVO49BpQckWC59+wFpId18xJtuDhBwIGFm2I/zGQQHiQDxEFOqsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF37F1F00899;
	Mon,  1 Jun 2026 13:18:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:18 +0200
Message-ID: <cover.1780319120.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.178031911driver8.git.geert+renesas@glider.be>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 17e48e7e5f18b45fd4a9411090148aae3b74f7f3:

  soc: renesas: Convert to of_machine_get_match() (2026-05-11 09:56:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.2-tag2

for you to fetch changes up to b4d41ffa750fc3403a4076d17090589d000f13ff:

  soc: renesas: rcar-mfis: Add R-Car V4H/V4M support (2026-05-29 14:42:29 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.2 (take two)

  - Identify the R-Car M3Le SoC,
  - Add Multifunctional Interface (MFIS) support for R-Car V4H and V4M.

Thanks for pulling!

----------------------------------------------------------------
Marek Vasut (1):
      soc: renesas: Identify R-Car R8A779MD M3Le SoC

Wolfram Sang (2):
      dt-bindings: soc: renesas: mfis: Add R-Car V4H/V4M support
      soc: renesas: rcar-mfis: Add R-Car V4H/V4M support

 .../soc/renesas/renesas,r8a78000-mfis.yaml         | 38 ++++++++++++++++++-
 drivers/soc/renesas/rcar-mfis.c                    | 44 +++++++++++++++++++++-
 drivers/soc/renesas/renesas-soc.c                  |  1 +
 3 files changed, 79 insertions(+), 4 deletions(-)
