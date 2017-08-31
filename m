Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48550 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751285AbdHaOEx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2017 10:04:53 -0400
Date: Thu, 31 Aug 2017 16:04:47 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL LTSI-4.9] Third Round of Renesas SoCs and Drivers to v4.12
Message-ID: <20170831140447.GA24787@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is a submission to LTSI-v4.9.

This series is comprised of a limited backport to v4.9 of usb core,
ohci-platform, ehci-platform and cs2000.

These were have been suggested after examination and testing of
LTSI-4.9 RC1.

There are 5 patches.

This is based on a merge of:
* Earlier work posted as
  "[GIT PULL LTSI-4.9] Second Round Renesas SoCs and Drivers to v4.12"
  and is tagged as tags/backport/v4.9.45/snapshot2-to-v4.12-flattened
* v4.9.46

It appears to apply cleanly to an ltsi-4.9 tree generated using
scripts/generate_git


The following changes since commit 06ce9c3fa43d22ed328b979562b16216053d031d:

  Merge tag 'v4.9.46' into backport/v4.9.46/snapshot-flattened (2017-08-31 12:31:10 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.46/snapshot3-to-v4.12-flattened

for you to fetch changes up to ea34fab45250defe5605f8ebf4d80872e6022925:

  clk: cs2000: add Suspend/Resume feature (2017-08-31 12:32:25 +0200)

----------------------------------------------------------------
Third Round of LTSI-v4.9 Preparation for Renesas SoCs to v4.12

Base:
* v4.9.46
* Second round of such backports

Components selectively backported in this snapshot:
* usb core
* ohci-platform
* ehci-platform
* cs2000

----------------------------------------------------------------
Khiem Nguyen (1):
      clk: cs2000: add Suspend/Resume feature

Yoshihiro Shimoda (4):
      usb: of: add functions to bind a companion controller
      usb: host: ehci-platform: fix usb 1.1 device is not connected in system resume
      usb: host: ehci-platform: set hcd->phy to avoid phy_get() in usb_add_hcd()
      usb: host: ohci-platform: set hcd->phy to avoid phy_get() in usb_add_hcd()

 Documentation/devicetree/bindings/usb/generic.txt |  1 +
 drivers/clk/clk-cs2000-cp.c                       | 22 ++++++++++++++++++++++
 drivers/usb/core/of.c                             | 23 +++++++++++++++++++++++
 drivers/usb/host/ehci-platform.c                  | 10 ++++++++++
 drivers/usb/host/ohci-platform.c                  |  3 +++
 include/linux/usb/of.h                            |  5 +++++
 6 files changed, 64 insertions(+)
