Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, chris.paterson2@renesas.com,
	Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
Subject: [PATCH v3 0/2] Add CAN & CAN FD pinctrl support for r8a7795 SoC
Date: Fri, 26 Feb 2016 12:37:02 +0000
Message-Id: <1456490224-18124-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

   Thanks for the comments (https://lkml.org/lkml/2016/2/25/531).
   Sorry. I assumed /* EtherAVB */ comment block identifies a set
   & hence inserted above it.

   Changes since v2:
   * Inserted pin block in alphabetical order - this time correctly

   Changes since v1:
   * Inserted pin block in alphabetical order
   * Corrected controller name in comment

Ramesh Shanmugasundaram (2):
  pinctrl: sh-pfc: r8a7795: Add CAN support
  pinctrl: sh-pfc: r8a7795: Add CAN FD support

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

-- 
1.9.1
