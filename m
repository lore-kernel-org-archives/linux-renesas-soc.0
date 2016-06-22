Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:62095 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752719AbcFVMiu (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 22 Jun 2016 08:38:50 -0400
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: mkl@pengutronix.de, wg@grandegger.com, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: ulrich.hecht+renesas@gmail.com, horms@verge.net.au,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	chris.paterson2@renesas.com, magnus.damm@gmail.com,
	socketcan@hartkopp.net,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH v2 0/2] can: rcar_canfd: Add Classical CAN & lower state transition support
Date: Wed, 22 Jun 2016 13:31:45 +0100
Message-Id: <1466598707-44076-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
In-Reply-To: <1466434007-50873-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
References: <1466434007-50873-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on latest can-next(tag:linux-can-next-for-4.8-20160617).

Changes since v1:
 - property named changed from "can-nofd" to "no-can-fd" (Rob H)
 - added new patch(0002) that support lower state transitions (Wolfgang G)
   (http://marc.info/?l=linux-can&m=146650325116971&w=2)

Ramesh Shanmugasundaram (2):
  can: rcar_canfd: Add Classical CAN only mode support
  can: rcar_canfd: Add back-to-error-active support

 .../devicetree/bindings/net/can/rcar_canfd.txt     |  21 +-
 drivers/net/can/rcar/rcar_canfd.c                  | 429 ++++++++++++++-------
 2 files changed, 310 insertions(+), 140 deletions(-)

-- 
1.9.1
