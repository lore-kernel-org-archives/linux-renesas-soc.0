Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDB7288B1;
	Mon,  8 Jun 2026 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949753; cv=none; b=c5ciBCCZelhudyUJz6mrlFILMHcx5BQL+Y7JjCgZYQgEJTcLAkL79DiD4iM0ikJPoFD8HhmWRqpt29101Ybd45HOoHR1tO5lnFTMIYNhwtfso1mHSdtCaiCKrQ6T2W1ouh1YsexEHNjZZcirYTVDlS4GMLtQ9h+whABo0dquZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949753; c=relaxed/simple;
	bh=mWLjUl0ESFc9wZLxzQ9M+qZzrWCMpspnklX/deFPUEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sX1FWS/heFD700Z/Ju8pPnsg3IlNNndvB5qwXh+OMwhYfhd2nB5TBBPeyUF1rYWIWYN/U69HC5BlxG6/VjSE72xo1R/cOiEWfj4vt/t+KAt6YZIyafCty2p5a85iwKIxYeL5JjauJk1dTEGMrgq0AMtW3XW9L6yGQz28mC51kiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzTnC0HQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzTnC0HQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67C81F00893;
	Mon,  8 Jun 2026 20:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949752;
	bh=z0lS06ccDLkZcLq+KluEw1JQFsFbo9sj1movH1YP68Y=;
	h=From:To:Cc:Subject:Date;
	b=RzTnC0HQ2RNzbVx6bDsauK3hzRzUqjEKeVEXiFnxWqmDtQfP8ra46lzE71ff4iiYR
	 gUxPSK/Rvqqdmg5Y6aeYFYiCYOBfPF0EAzMt3F57f3Z3p5FhwuWEb5Mz7k3dMrLrh7
	 UmBUF1nzwoU3TA28pKpD+gP/gj18BE2qkMKNc6Qcu9ho5YczwkwfmrAlbukROB6Qfe
	 VsQ0Lc8/RjioZ0TKAesssUibrEXwYYvtFPc6J2sQ/APcQmApyB8yhz1Ez5lzzGOULM
	 uIuvSiykcA+otmoMnPtAlxy2eDEORVim6eyI243NCUvBFBA9rgN+C60UdvKLSE3SlV
	 GrOPqvGYSg0kw==
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
Subject: [PATCH v3 00/17] i3c: renesas: Suspend to RAM with power loss and runtime PM
Date: Mon,  8 Jun 2026 23:15:26 +0300
Message-ID: <20260608201543.804902-1-claudiu.beznea@kernel.org>
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

Please note that series need to be applied on top of [1] since
patch "i3c: renesas: Perform Dynamic Address Assignment on resume"
uses i3c_master_reattach_i3c_dev_locked().

Thank you,
Claudiu

Changes in v3:
- re-based on top of series [1] to be able to use
  i3c_master_reattach_i3c_dev_locked()
- used i3c_master_reattach_i3c_dev_locked() on patch
  "i3c: renesas: Perform Dynamic Address Assignment on resume" along with
  grouping the I2C and I3C devices in the driver slot
- collected tags

Changes in v2:
- dropped patch "i3c: renesas: Use the divider 128"
- adjusted the patches title and description where requested in the
  review process
- adjusted the DAA procedure after resume to still properly re-configure
  the controller in case the bus was full before a suspend
- added patch "i3c: renesas: Do not attach devices if xfer failed"
- collected tags

[1] https://lore.kernel.org/linux-i3c/20260525064209.2263045-1-lakshay.piplani@nxp.com/T/#m74ddb24e1e3a8006d933bd6106cc0c4508a11d2c

Claudiu Beznea (17):
  i3c: renesas: Check that the transfer is valid before accessing it
  i3c: renesas: Restore STDBR and EXTBR registers on resume
  i3c: renesas: Follow the reset deassert order used in probe
  i3c: renesas: Reconfigure the DATBAS register on re-attach
  i3c: renesas: Reset the controller on resume
  i3c: renesas: Perform Dynamic Address Assignment on resume
  i3c: renesas: Do not attach devices if xfer failed
  i3c: renesas: Clean DATBAS register on detach
  i3c: renesas: Use reset_control_bulk_{assert, deassert}()
  i3c: renesas: Return immediately if there is no transfer
  i3c: renesas: Follow a unified pattern for transfer and command
    initialization
  i3c: renesas: Drop the explicit memset() call
  i3c: renesas: Update HW registers after SW computations are done
  i3c: renesas: Organize structures to avoid unnecessary padding
  i3c: renesas: Use the "dev_name:irq_name" format for the interrupt
    name
  i3c: renesas: Drop unnecessary tab
  i3c: renesas: Add runtime PM support

 drivers/i3c/master/renesas-i3c.c | 540 +++++++++++++++++++++++--------
 1 file changed, 414 insertions(+), 126 deletions(-)

-- 
2.43.0

