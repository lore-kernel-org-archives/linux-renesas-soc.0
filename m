Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0037B025;
	Fri,  3 Apr 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206110; cv=none; b=JymXnTDrvfgQPcbSOKxLY1mmLfpKg+wU+0LhYqHE4YyRgCAu2fy84dCejYJzqF6y7Toyq4zBasDVIo/SsqouG2WJ83mpiWVDMbkl3KURv810T2lqE3rKM9csuwtE0B3pZsIdeLaj/GGPPhYHYKEamYpk9Pn95lnCCV66/aR4nLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206110; c=relaxed/simple;
	bh=re0JBZsd8vFNZr3fr3OKWjBU3vmeAf0fLRgH4Xtylx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e6yrfNA5KJnn59zKh58YYBQQtuq22qeIKJ8DFBvy4YHB7n9x3vE5S4F4G91uELqr8KeDZvwEqPPVAguk6jeCe+6vvnBOSbVIfNWUzvDl0Xgw/RVlqT22iaotqe/NZ8LsBYzC/i3giDvaem2Zl9I+yz4tiuZ+XrfYn3lcmQ5J73M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67FAC4CEF7;
	Fri,  3 Apr 2026 08:48:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] irqchip/renesas-rzv2h: Cleanups
Date: Fri,  3 Apr 2026 10:48:20 +0200
Message-ID: <cover.1775205874.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains some cleanups for the RZ/V2H interrupt
controller driver.  It has been compile-tested only.

Thanks for your comments!

Geert Uytterhoeven (3):
  irqchip/renesas-rzv2h: Kill swint_idx[]
  irqchip/renesas-rzv2h: Kill swint_names[]
  irqchip/renesas-rzv2h: Kill icu_err string

 drivers/irqchip/irq-renesas-rzv2h.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
