Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751735AbdFNUX6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 16:23:58 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: geert@glider.be
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL for renesas-drivers] ADV748x v5 driver.
Date: Wed, 14 Jun 2017 21:23:53 +0100
Message-Id: <1497471834-917-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider this pull request for the next renesas-drivers release.

This driver is based on linux-media/master branch

--
Regards

Kieran

The following changes since commit acec3630155763c170c7ae6508cf973355464508:

  [media] s3c-camif: fix arguments position in a function call (2017-06-13 14:21:24 -0300)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/driver

for you to fetch changes up to e261761c366279a26490f3dc8aca7422a73ba720:

  media: i2c: adv748x: add adv748x driver (2017-06-14 15:39:37 +0100)

----------------------------------------------------------------
Kieran Bingham (1):
      media: i2c: adv748x: add adv748x driver

 .../devicetree/bindings/media/i2c/adv748x.txt      |  96 +++
 MAINTAINERS                                        |   6 +
 drivers/media/i2c/Kconfig                          |  11 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/adv748x/Makefile                 |   7 +
 drivers/media/i2c/adv748x/adv748x-afe.c            | 570 ++++++++++++++
 drivers/media/i2c/adv748x/adv748x-core.c           | 831 +++++++++++++++++++++
 drivers/media/i2c/adv748x/adv748x-csi2.c           | 327 ++++++++
 drivers/media/i2c/adv748x/adv748x-hdmi.c           | 651 ++++++++++++++++
 drivers/media/i2c/adv748x/adv748x.h                | 415 ++++++++++
 10 files changed, 2915 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv748x.txt
 create mode 100644 drivers/media/i2c/adv748x/Makefile
 create mode 100644 drivers/media/i2c/adv748x/adv748x-afe.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-core.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-csi2.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x-hdmi.c
 create mode 100644 drivers/media/i2c/adv748x/adv748x.h
