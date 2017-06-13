Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752258AbdFMAoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 20:44:20 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: geert@glider.be
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] media: ADV748x driver
Date: Tue, 13 Jun 2017 01:44:17 +0100
Message-Id: <1497314657-15984-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this driver (based on linux-media/master) for renesas-drivers.

--
Regards

Kieran



The following changes since commit 47f910f0e0deb880c2114811f7ea1ec115a19ee4:

  [media] v4l: subdev: tolerate null in media_entity_to_v4l2_subdev (2017-06-08 16:55:25 -0300)

are available in the git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/for-renesas-drivers

for you to fetch changes up to fdae35a2e755e7d2e06d652c2e64343b7f82fce1:

  media: i2c: adv748x: add adv748x driver (2017-06-13 01:40:24 +0100)

----------------------------------------------------------------
Kieran Bingham (1):
      media: i2c: adv748x: add adv748x driver

 .../devicetree/bindings/media/i2c/adv748x.txt      |  96 +++
 MAINTAINERS                                        |   6 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/adv748x/Makefile                 |   7 +
 drivers/media/i2c/adv748x/adv748x-afe.c            | 571 +++++++++++++
 drivers/media/i2c/adv748x/adv748x-core.c           | 907 +++++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x-csi2.c           | 323 ++++++++
 drivers/media/i2c/adv748x/adv748x-hdmi.c           | 652 +++++++++++++++
 drivers/media/i2c/adv748x/adv748x.h                | 415 ++++++++++
 10 files changed, 2989 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
 create mode 100644 drivers/media/i2c/adv748x/Makefile
 create mode 100644 drivers/media/i2c/adv748x/adv748x-afe.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-core.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-csi2.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-hdmi.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x.h
