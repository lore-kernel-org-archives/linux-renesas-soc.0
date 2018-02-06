Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40135 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753572AbeBFWaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 17:30:01 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 0/9] ARM: dts: gen2: add IP core switcher for all busses
Date: Tue,  6 Feb 2018 23:29:49 +0100
Message-Id: <20180206222958.18941-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Here is the updated series to add the I2C IP core switcher to all busses of
Gen2 boards where some kind of switching is possible (mostly to/from GPIO).

These patches were tested locally on Lager and Alt, and remotely on Koelsch,
Porter and Gose. We have no Silk board available but the patch follows the same
style as the other patches. In addition, these patches have been double-checked
by vimdiff-comparing the i2c-bus blobs before and after this patchset.

As discussed previously: the tested boards boot fine. No regression encountered
there. However, changing masters at runtime for HDMI-named busses and PWR-named
busses will likely cause kernel warnings and maybe OOPSes. This is due to the
rebind-issues in the V4L and regulator subsystems. For the former, fixing is
WIP. For the latter, it is unknown how to deal with rebinding in general (but
I'd need to look at this issue again if this is desired). It was decided that
we consider those follow-up problems which should not hold back these patches
anymore. The EXIO named busses seemed to work fine as far as this could be
remotely tested.

Changes since V2:

* rebased to renesas/dt-for-v4.17

Changes since V1:

* fixed I2C4 pinmux for Koelsch and Gose (thanks Geert for the report!)
* rebased to current renesas/dt-for-v4.16
* fixed typo in branch name (s/topc/topic/)

The branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/ip-switch-rework-2018

It is based on renesas/dt-for-v4.17.

Please apply.

Thanks,

   Wolfram

Wolfram Sang (9):
  ARM: dts: lager: use demuxer for IIC2/I2C2
  ARM: dts: lager: use demuxer for IIC3/I2C3
  ARM: dts: koelsch: use demuxer for I2C2
  ARM: dts: koelsch: use demuxer for I2C4
  ARM: dts: porter: use demuxer for I2C2
  ARM: dts: alt: use demuxer for I2C1
  ARM: dts: silk: use demuxer for I2C1
  ARM: dts: gose: use demuxer for I2C2
  ARM: dts: gose: use demuxer for I2C4

 arch/arm/boot/dts/r8a7790-lager.dts   | 295 ++++++++++++++++++++--------------
 arch/arm/boot/dts/r8a7791-koelsch.dts | 232 ++++++++++++++++----------
 arch/arm/boot/dts/r8a7791-porter.dts  | 128 +++++++++------
 arch/arm/boot/dts/r8a7793-gose.dts    | 252 ++++++++++++++++++-----------
 arch/arm/boot/dts/r8a7794-alt.dts     |  53 ++++--
 arch/arm/boot/dts/r8a7794-silk.dts    | 128 +++++++++------
 6 files changed, 662 insertions(+), 426 deletions(-)

-- 
2.11.0
