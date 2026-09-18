Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51F3F39F1;
	Fri, 18 Sep 2026 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789724238; cv=none; b=RGc/yWA4WxG5D93AXkEg9f+osv91YTOHr37mtfN1cYzBYz2efOwi3c93ghX6EGBmRxNpqPp/jh7P1qXRsd8iTBbfBTiBHQ2aa8X+ZAI4GPvpPWNmCsutLyF2ljzbQHwqwNHgyKDmvzH+oK7278wgvBsOhVC7YdvGiVJPnwpmVPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789724238; c=relaxed/simple;
	bh=8L6uagqZVfnJLn6py/03/m5GGw3XgjTyB6nZD4OfgOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JoVvQCNzuU+51b4D62599x5n9T7VLNzx6D8+3iSaEnOJL69sSX9rAthLCGnjpEQHczIaH82HhhSuGFO+HAfdjdVn1Lttzs36/x2PAhgvO3bTbq3tANEGcbSlVb3He+i/HHua8OeJpbd2lLo/g0WE+6gXa8yjO9H7aH0iyfhc/vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87F81F00898;
	Fri, 18 Sep 2026 09:37:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM defconfig updates for v7.4
Date: Fri, 18 Sep 2026 11:37:03 +0200
Message-ID: <cover.1789722870.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v7.4-tag1

for you to fetch changes up to 74463c1be2ad066b436209d01dcdf8e717896504:

  ARM: shmobile: defconfig: Refresh for v7.3-rc1 (2026-09-09 10:47:00 +0200)

----------------------------------------------------------------
Renesas ARM defconfig updates for v7.4

  - Refresh the ARM SH-Mobile defconfig for v7.3-rc1.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v7.3-rc1

 arch/arm/configs/shmobile_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
