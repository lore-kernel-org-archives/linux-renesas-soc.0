Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, chris.paterson2@renesas.com,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH 0/2] CAN & CAN FD pinctrl support for r8a7795 SoC
Date: Thu, 25 Feb 2016 16:48:51 +0000
Message-Id: <1456418933-3948-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set adds CAN & CAN FD pinctrl support for r8a7795 SoC.

This set is based on linux-next repo(tag: next-20160225).

Ramesh Shanmugasundaram (2):
  pinctrl: sh-pfc: r8a7795: Add CAN support
  pinctrl: sh-pfc: r8a7795: Add CAN FD support

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 102 +++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

-- 
1.9.1
