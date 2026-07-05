Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159AF78C9C;
	Sun,  5 Jul 2026 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783287355; cv=none; b=hQGvYUj8MA6yT+mVd3UYozlC7raXbNtfKnWZAxbDqx9CWElzx6lsEmB7XocLXy04yZrAwPcFzpq+kq9msyCNwncrp2knypjRobfYjwaRdw8hsnjIatQSS8jxoq0sLD2avP4j5zJHaOB8qYrP+rV5shokypbgwA7Niytmqn5fmcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783287355; c=relaxed/simple;
	bh=9Ys2LdiWk6aqBxpSgpVgyMXpSZ8BTD7IUi+YmaWkyIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBZYaI4aDOZ59rPv6xODdFFh4kmJ8DaZKnkl3EbNFxooAx/4lN8tzTAe9Cu5eNidzzQiHJLpg9ZIvmb7uBKCNZJ+agxCmK71Gjix9s4FOByz5WY1SLXtjeUfKA/k9eAOfYkb3MlovT+4spAFpQqqlH0oEoBGlgYDRsxWVdDNpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X814jWdJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X814jWdJ"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F2E034;
	Sun,  5 Jul 2026 23:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783287296;
	bh=9Ys2LdiWk6aqBxpSgpVgyMXpSZ8BTD7IUi+YmaWkyIs=;
	h=From:To:Cc:Subject:Date:From;
	b=X814jWdJhUUpE63XxgX8y9vpQAxAHYEzk67c00sJ6GPe693n0yAU5c7vleLKRJADx
	 UTRc9VB8GyJDXhBnrKo0aH0BlNd3RSxC7KVjTaQCpbqeYk2v6dm50yu/D2XX3tfrmJ
	 IEO0lF/7Xb1ZscX5GLSsvE73mfSolG0xkxhu/pyY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] drm: bridge: display-connector: Support hardcoding EDID for VGA
Date: Mon,  6 Jul 2026 00:35:38 +0300
Message-ID: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

In a normal use case, the VGA DDC lines are used to read EDID from the
display. On some systems where the connector is internal to the device
and the VGA display is always present, the DDC lines may not be
connected, making display detection and EDID retrieval impossible.

This patch series adds the ability to hardcode EDID in the device tree
for VGA connectors on such systems. Patch 1/4 extends the vga-connector
DT bindings with an "edid" property. Patch 2/4 is a drive-by fix for a
resource leak in the display-connector driver, and patch 3/4 implements
support for the "edid" property in the driver.

I have tested this on a Renesas Salvator-XS M3N development board. The
board has an external VGA connector, but does not conenct the DDC lines,
exhibiting the problem that this series addresses. Patch 4/4
demonstrates how to set EDID in the device tree, for the VGA monitor I
used in my test environment. It is not meant to be merged as the display
is not internal to the device in this case.

Laurent Pinchart (4):
  dt-bindings: display: vga-connector: Allow hardcoding EDID
  drm/bridge: display-connector: Fix I2C adapter resource leak
  drm/bridge: display-connector: Support hardcoded EDID for VGA
    connectors
  [DNI] arm64: dts: renesas: salvator: Add overlay for Dell P1911 VGA
    display

 .../display/connector/vga-connector.yaml      | 15 +++++++
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../dts/renesas/salvator-vga-dell-p1911.dtso  | 21 ++++++++++
 drivers/gpu/drm/bridge/display-connector.c    | 42 ++++++++++++++++---
 4 files changed, 75 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso


base-commit: 44d19b8a7548aa25cbc6ebd5f27e958f7142c36b
-- 
Regards,

Laurent Pinchart

