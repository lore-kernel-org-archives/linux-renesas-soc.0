Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46778 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751186AbdH2TI6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 15:08:58 -0400
Date: Tue, 29 Aug 2017 21:08:53 +0200
From: Simon Horman <horms@verge.net.au>
To: ltsi-dev@lists.linuxfoundation.org
Cc: Hisao Munakata <hisao.munakata.vt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL LTSI-4.9] Second Round of Renesas SoCs and Drivers to v4.12
Message-ID: <20170829190853.GA4714@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

This is a submission to LTSI-v4.9.

This series is comprised of a backport v4.9 of the rcar-gen3-thermal driver
to its as of v4.12. This was unintentionally omitted from earlier work
submitted for inclusion in LTSI-4.9.

There are 9 patches.

This is based on a merge of:
* Earlier work posted as
  "[GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.12"
  and is tagged as tags/backport/v4.9.36/snapshot-to-v4.12-flattened
* v4.9.45

It appears to apply cleanly to an ltsi-4.9 tree generated using
scripts/generate_git


The following changes since commit 89dcb9ecf2d34cba6cba23376651476b0273db5d:

  Merge tag 'v4.9.45' into backport/v4.9.45/snapshot-flattened (2017-08-29 20:34:36 +0200)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.45/snapshot2-to-v4.12-flattened

for you to fetch changes up to 0d29576c55e2a72e64f36f66ab8dcd279c345942:

  thermal: rcar_gen3_thermal: add suspend and resume support (2017-08-29 20:35:05 +0200)

----------------------------------------------------------------
Second Round of LTSI-v4.9 Preparation for Renesas SoCs to v4.12

Base:
* v4.9.45
* Backport of various components for Renesas SoCs to v4.12

Component backported in this snapshot:
* rcar-gen3-thermal driver

----------------------------------------------------------------
Niklas Söderlund (7):
      thermal: rcar_gen3_thermal: add delay in .thermal_init on r8a7796
      thermal: rcar_gen3_thermal: remove unneeded mutex
      thermal: rcar_gen3_thermal: check that TSC exists before memory allocation
      thermal: rcar_gen3_thermal: record and check number of TSCs found
      thermal: rcar_gen3_thermal: enable hardware interrupts for trip points
      thermal: rcar_gen3_thermal: store device match data in private structure
      thermal: rcar_gen3_thermal: add suspend and resume support

Wolfram Sang (2):
      thermal: rcar_gen3_thermal: Document the R-Car Gen3
      thermal: rcar_gen3_thermal: Add R-Car Gen3 thermal driver

 .../bindings/thermal/rcar-gen3-thermal.txt         |  56 +++
 drivers/thermal/Kconfig                            |   9 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/rcar_gen3_thermal.c                | 504 +++++++++++++++++++++
 4 files changed, 570 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
 create mode 100644 drivers/thermal/rcar_gen3_thermal.c
