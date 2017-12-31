Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34562 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750913AbdLaLXb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 06:23:31 -0500
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 0/9] ARM: dts: gen2: add IP core switcher for all busses
Date: Sun, 31 Dec 2017 12:23:11 +0100
Message-Id: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
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

Changes since V1:

* fixed I2C4 pinmux for Koelsch and Gose (thanks Geert for the report!)
* rebased to current renesas/dt-for-v4.16
* fixed typo in branch name (s/topc/topic/)

The branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/ip-switch-rework-2017

It is based on v4.15-rc1 + renesas/dt-for-v4.16 merged in.

Please review, comment...

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

 arch/arm/boot/dts/r8a7790-lager.dts   | 279 ++++++++++++++++++++--------------
 arch/arm/boot/dts/r8a7791-koelsch.dts | 232 +++++++++++++++++-----------
 arch/arm/boot/dts/r8a7791-porter.dts  | 128 +++++++++-------
 arch/arm/boot/dts/r8a7793-gose.dts    | 252 ++++++++++++++++++------------
 arch/arm/boot/dts/r8a7794-alt.dts     |  53 +++++--
 arch/arm/boot/dts/r8a7794-silk.dts    | 128 +++++++++-------
 6 files changed, 654 insertions(+), 418 deletions(-)

-- 
2.11.0
