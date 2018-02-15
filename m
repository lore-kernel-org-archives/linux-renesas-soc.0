Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1162926AbeBOSfO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 13:35:14 -0500
From: Kieran Bingham <kbingham@kernel.org>
To: geert@glider.be, linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [GIT PULL FOR renesas-drivers] d3/i2c-conflict/media
Date: Thu, 15 Feb 2018 18:35:09 +0000
Message-Id: <1518719709-28940-2-git-send-email-kbingham@kernel.org>
In-Reply-To: <1518719709-28940-1-git-send-email-kbingham@kernel.org>
References: <1518719709-28940-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider including this branch in renesas-drivers.

--
Regards

Kieran

The following changes since commit 29422737017b866d4a51014cc7522fa3a99e8852:

  media: rc: get start time just before calling driver tx (2018-02-14 14:17:21 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git d3/i2c-conflict/media

for you to fetch changes up to a22cefa41188bdda128b76d6a067e55b40ce5c22:

  media: adv7604: Add support for i2c_new_secondary_device (2018-02-15 17:31:26 +0000)

----------------------------------------------------------------
Jean-Michel Hautbois (2):
      dt-bindings: media: adv7604: Extend bindings to allow specifying slave map addresses
      media: adv7604: Add support for i2c_new_secondary_device

 .../devicetree/bindings/media/i2c/adv7604.txt      | 18 ++++++-
 drivers/media/i2c/adv7604.c                        | 62 ++++++++++++++--------
 2 files changed, 56 insertions(+), 24 deletions(-)
