Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF2378D86;
	Sat, 28 Mar 2026 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699875; cv=none; b=SYJbIPh/EfkmCYLGqHdzZfgHIZHY8kngXppYHwfMG1wSeMCG5SwzYjkgtk5GX4POcJw6Kq47G9rUpMzXaMI4lOsBn2H680qIz1O5GX80Aqsat3hE5aEbKKmndmgcdN/xe7UR6rrXR9r9WFBiB4a9JznSeNOf02rED/8tMYagHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699875; c=relaxed/simple;
	bh=px/zXvSRuTa2CSP4wiJUws1upKUXioaUric9OepNh6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Veaz6ShUz8wzCa1+DoiX0cXu4ikBo4mQkV5QFSTirK+aGBPvyLBRDX/jCRJz8oPF+zYd9nEiDGvKEDzRArm2r4a1ZlPBD7vULOK50gi9VpfX/ZLHjrB7hGau6QNywrN1nV7WAzoMWXgb/WPjBuIQYeICMowrXpQqtpqhWSmmYtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C749BC19424;
	Sat, 28 Mar 2026 12:11:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:05 +0100
Message-ID: <cover.1774606540.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774606536.git.geert+renesas@glider.be>
References: <cover.1774606536.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b1de9823fdc67a8e9cd0dcf1f6f0e9780d425d4e:

  soc: renesas: rz-sysc: Add SoC identification for RZ/G3L SoC (2026-03-06 13:40:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v7.1-tag2

for you to fetch changes up to abf3502033cfc2797126f054eb081857f8e7e939:

  soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initconst (2026-03-16 11:04:18 +0100)

----------------------------------------------------------------
Renesas driver updates for v7.1 (take two)

  - Mark remaining rz_sysc_init_data structures __initconst.

----------------------------------------------------------------
Lad Prabhakar (3):
      soc: renesas: r9a09g057-sys: Mark rzv2h_sys_init_data as __initconst
      soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data as __initconst
      soc: renesas: r9a09g056-sys: Mark rzv2n_sys_init_data as __initconst

 drivers/soc/renesas/r9a09g047-sys.c | 2 +-
 drivers/soc/renesas/r9a09g056-sys.c | 2 +-
 drivers/soc/renesas/r9a09g057-sys.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
