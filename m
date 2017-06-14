Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751664AbdFNUX5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 16:23:57 -0400
From: Kieran Bingham <kbingham@kernel.org>
To: geert@glider.be
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL for renesas-drivers] ADV748x v5 device-tree.
Date: Wed, 14 Jun 2017 21:23:54 +0100
Message-Id: <1497471834-917-2-git-send-email-kbingham@kernel.org>
In-Reply-To: <1497471834-917-1-git-send-email-kbingham@kernel.org>
References: <1497471834-917-1-git-send-email-kbingham@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Please consider this pull request for the next renesas-drivers release.

This DT update is based on Simon's horms/next branch, but is also dependant
upon Niklas' VIN driver DT nodes being integrated.

--
Regards

Kieran

The following changes since commit ab4321dedd764fb6d8fad3463a93b491aabe669d:

  Merge branches 'arm64-dt-for-v4.13', 'drivers-for-v4.13' and 'soc-for-v4.13' into next (2017-06-14 11:05:24 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git adv748x/dt

for you to fetch changes up to eb130d9433e9cd5b6b0f33715df18697460012ee:

  arm64: dts: renesas: salvator-x: Add ADV7482 support (2017-06-14 15:46:42 +0100)

----------------------------------------------------------------
Kieran Bingham (1):
      arm64: dts: renesas: salvator-x: Add ADV7482 support

 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 123 +++++++++++++++++++++++
 1 file changed, 123 insertions(+)
