Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1162445AbeBOSfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 13:35:13 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: geert@glider.be, linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] d3/i2c-conflict/drm
Date: Thu, 15 Feb 2018 18:35:08 +0000
Message-Id: <1518719709-28940-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this branch in renesas-drivers.

--
Regards

Kieran

The following changes since commit 94fc27ac487a80daf42f97b1a0503d029f3c1325:

  Merge tag 'drm-intel-next-fixes-2018-02-07' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2018-02-08 08:21:37 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git d3/i2c-conflict/drm

for you to fetch changes up to 21dc5df16073e4ec91b478ac95913daaa088c81b:

  drm: adv7511: Add support for i2c_new_secondary_device (2018-02-15 17:30:23 +0000)

----------------------------------------------------------------
Kieran Bingham (2):
      dt-bindings: adv7511: Extend bindings to allow specifying slave map addresses
      drm: adv7511: Add support for i2c_new_secondary_device

 .../bindings/display/bridge/adi,adv7511.txt        | 18 ++++++++--
 drivers/gpu/drm/bridge/adv7511/adv7511.h           |  6 ++++
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       | 42 ++++++++++++++--------
 3 files changed, 49 insertions(+), 17 deletions(-)
