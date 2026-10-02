Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B48D488223;
	Fri,  2 Oct 2026 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940538; cv=none; b=jssrZBDqx04PsZo3/9uLwsr5rXVHRPcizVHaCRKe2ukGeIzUWFeExbuFE1dI4GnRrDbiQSpRGiRPl6ntF4RWHWZO/gMXIvMR8ytFbO7XeKM051H2X5Of1SQoBiDu/CM4wBhpK6sCI2eEtjqBbrtFxUaXgl/Wst2pCuZR8yKmnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940538; c=relaxed/simple;
	bh=N+DEkO0VO54ztW+EdhkRNoF88HHBUlY5YHbtPc/ZVrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qa067C9aZenNdiBEIS8klBOoskqj9FZIvI8uNhfimS/t4vbSRwGuwN43Z2V1vii12dVT8CR7/mzZo63pk3lD0E5EHkHy2F7CWgXvtuAR6V5kDHnsj7Q6Bz41RLQ/oZXT8V453lInX4ZT7Ns6PkocHV+BGArmjHVntcmpw1jCI38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9221F000FF;
	Fri,  2 Oct 2026 11:28:55 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v7.4 (take two)
Date: Fri,  2 Oct 2026 13:28:39 +0200
Message-ID: <cover.1790939713.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790939711.git.geert+renesas@glider.be>
References: <cover.1790939711.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 10eeafc3e90ebbe6627a7d471b86af889d7b07e5:

  soc: renesas: rcar-rst: Add support for RZ/G2M v3.0 (2026-09-07 10:53:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.4-tag2

for you to fetch changes up to a251a759b52082627f2e78068560e29765de1ae7:

  soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N (2026-09-29 10:01:33 +0200)

----------------------------------------------------------------
Renesas driver updates for v7.4 (take two)

  - Select core functionality that will be required for proper operation
    on RZ/G2M v3.0, RZ/G3E, and RZ/V2N.

Thanks for pulling!

----------------------------------------------------------------
Ayman Chaudhry (1):
      soc: renesas: Enable SYSC driver for r8a774a3

Lad Prabhakar (1):
      soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N

 drivers/soc/renesas/Kconfig | 3 +++
 1 file changed, 3 insertions(+)
