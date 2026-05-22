Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A953CB2CF;
	Fri, 22 May 2026 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445103; cv=none; b=SHCVQeYvP5SdvH+CrLmIdIuB0368v+7cXyIzUDWXGOfa4llDtLyw0O/yLt9sXeUNHBa813xVMqMK75yMFK+wVcyhTzgBJJjKPEgc5P933Ze+DwvSqD1N1seDtxKl9oaWBZAhOVWSBy/1laGwknMCIHXqm5MAkkYpqoaj9R2YQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445103; c=relaxed/simple;
	bh=Gb2R7Q7KxRPa7OvjnnJrmx+h476jjR8xevZrD/43+2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sRcsPJiim7/4JBpnkCAcb3SUUiPLnt9b7SDkwzaa/lX9kxPSaQ9YRLq2QzJLXifzgYsgbKpFOCgnQ1verCEus2IUZTbYW92h9o4cBDDoJkTA5mZLt2Cd+/FTsLXwpFZWJscL0oy1dNbUwQOxI0B59R3oQ53dyJYL4kjHUJZWbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNybE/I7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNybE/I7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 187E61F000E9;
	Fri, 22 May 2026 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445101;
	bh=s6tq9StxoEbiDNdCIQ5hfjPx7p09OfsA8EPreaLNSF8=;
	h=From:To:Cc:Subject:Date;
	b=XNybE/I7GwVDZwSv1DyMKqdqua7C6StYbeQzSxSq79l72DCvyG5UlpVUZQm0lFXQT
	 1gPA+YxQzEa2e4LWUnJHMra/GWVnajUl4W/QjyIUXmdhNViOw1/7bzdCFPxHRgadoV
	 NxRQvVEGAOKSAH2bD/0JXC/YGZ2JuoSy+qij/PJKJurhU8tOlm1suqwLvc0Y+pNQWT
	 dsZJ1sNZNA+ck5d1roGPLrr/nuOzgpm7b5HUuwUa7Topn9bTnzCDChSvCPlqSHleIE
	 YzBr1XhTohUhyRGTPyVSsgluP2u/pBzYrQzLKJ/B8A61exHytMa25J5qQl+wkbVTHe
	 6M3bTiUB1Xj4A==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 00/17] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Fri, 22 May 2026 13:17:58 +0300
Message-ID: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adjusts the suspend to RAM code to handle cases where power
to the connected devices is lost during suspend to RAM. The fixes
included in this series are required for that support.

Along with suspend to RAM support, runtime PM support is also added.
Cleanup patches were included to prepare for clean runtime PM support.

Thank you,
Claudiu

Claudiu Beznea (17):
  i3c: renesas: Check that the transfer is valid before accessing it
  i3c: renesas: Use the divider 128
  i3c: renesas: Restore STDBR and EXTBR registers on resume
  i3c: renesas: Follow the reset deassert order used in probe
  i3c: renesas: Fix re-attach
  i3c: renesas: Reset the controller on resume
  i3c: renesas: Perform Dynamic Address Assignment on resume
  i3c: renesas: Clean DATBAS register on detach
  i3c: renesas: Use reset_control_bulk_{assert, deassert}()
  i3c: renesas: Return immediately if there is nothing to transfer
  i3c: renesas: Follow a unified pattern for transfer and command
    initialization
  i3c: renesas: Drop the explicit memset() call
  i3c: renesas: Update HW registers after SW computations are done
  i3c: renesas: Organize structures to avoid unnecessary padding
  i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
    name
  i3c: renesas: Drop unnecessary tab
  i3c: renesas: Add runtime PM support

 drivers/i3c/master/renesas-i3c.c | 378 ++++++++++++++++++++++---------
 1 file changed, 273 insertions(+), 105 deletions(-)

-- 
2.43.0

