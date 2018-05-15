Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36770 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752421AbeEOMUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 08:20:46 -0400
Received: by mail-wm0-f65.google.com with SMTP id n10-v6so723948wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 May 2018 05:20:46 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/5] R-Car D3 LVDS/HDMI support
Date: Tue, 15 May 2018 14:20:35 +0200
Message-Id: <1526386840-15368-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This adds D3 support to the DU and LVDS drivers, not including LVDS PLL
support.

It also adds LVDS encoders to the D3 device tree, and LVDS decoder, HDMI
encoder and HDMI output connector to the Draak device tree.

In theory that should be good enough to provide HDMI output on the Draak
board, but in practice the lack of LVDS PLL support prevents generation of
close-enough dot clock frequencies.

This series is based on renesas-drivers-2018-05-02-v4.17-rc3 and requires
Jacopo's "drm: bridge: Add thc63lvd1024 LVDS decoder driver" patch.

CU
Uli


Kieran Bingham (1):
  arm64: dts: renesas: r8a77995: Add LVDS support

Koji Matsuoka (1):
  drm: rcar-du: Add r8a77995 device support

Ulrich Hecht (3):
  drm: rcar-du: lvds: Add R8A77995 support
  arm64: dts: renesas: r8a77995-draak: add HDMI output
  arm64: dts: renesas: r8a77995-draak: add X12 input dot clock

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 91 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 56 ++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c          | 26 ++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c            |  6 ++
 4 files changed, 179 insertions(+)

-- 
2.7.4
