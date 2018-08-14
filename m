Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:32217 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732667AbeHNQk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Aug 2018 12:40:56 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PROTO][PATCH 00/10] R-Car D3 LVDS/HDMI support (with PLL)
Date: Tue, 14 Aug 2018 15:49:54 +0200
Message-Id: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This is a prototype extension of the series "R-Car D3 LVDS/HDMI support"
that includes an up-port of the LVDS PLL support in the BSP.

While this is prototype-quality code, there are in my judgment no serious
hacks in it.  The most significant deviation in behavior between this and
the BSP code is that the LVDS PLL setup is not done in two steps, but in one
go as the LVDS device is enabled.  This was easier to implement, and works
just as fine.

Instructions for testing this are found at
https://elinux.org/User:Uli/D3_HDMI_Test, including links to git trees based
on renesas-drivers and drm-next, as well as config files for each.

CU
Uli


Jacopo Mondi (1):
  drm: rcar-du: lvds: Handle LVDS interface reset

Kieran Bingham (1):
  arm64: dts: renesas: r8a77995: Add LVDS support

Koji Matsuoka (5):
  drm: rcar-du: Add clk_set_rate for external clock device
  drm: rcar-du: Fix digital RGB routing for R8A77995
  drm/bridge: adv7511: Add max-clock, min-vrefresh options
  drm: rcar-du: Fix procedure for extal and dotclkin selection
  arm64: dts: r8a77995-draak: set external clock for DU

Ulrich Hecht (3):
  drm: rcar-du: Add r8a77995 device support
  drm: rcar-du: lvds: LVDS PLL support
  arm64: dts: renesas: r8a77995-draak: add HDMI output

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts |  92 +++++++++-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      |  56 ++++++
 drivers/gpu/drm/bridge/adv7511/adv7511.h       |   7 +
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   |  22 +++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c         |  33 ++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h         |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c          |  28 +++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h          |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c        |  18 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c            | 227 +++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h       |  44 ++++-
 11 files changed, 517 insertions(+), 18 deletions(-)

-- 
2.7.4
