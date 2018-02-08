Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:51860 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751725AbeBHKeY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Feb 2018 05:34:24 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 00/11] ARM: dts: rcar-gen2: Enable watchdog support
Date: Thu,  8 Feb 2018 11:34:06 +0100
Message-Id: <1518086057-19448-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi all,

This patch series enables the builtin watchdog timer on R-Car Gen2 SoCs
on all supported boards, and builds on top of Fabrizio's "[RFC v4 00/26]
Fix watchdog on Renesas R-Car Gen2 and RZ/G1".  It is marked RFC as it
is known not to work on all SoCs and SoC revisions.

Based on my experiments, there are 3 success/failure modes:

  1. It works!

     This is the case on R-Car M2-N ES1.0 and E2 ES1.0 (tested on gose
     and alt).

  2. The system hangs on watchdog timeout, unless only the first CPU
     core is in use.
     This can be achieved by booting with "maxcpus=1", or by manually
     offlining all secondary CPU cores first:

         for i in /sys/*/*/cpu/cpu[1-9]*; do echo 0 > $i/online; done

     This is the case on R-Car H2 ES1.0 and M2-W ES1.0 (tested on lager
     and koelsch).

  3. The system hangs on watchdog timeout, unless the kernel was built
     with CONFIG_SMP disabled.

     This is the case on R-Car V2H ES1.1 (tested on blanche).
     Presumably the restart part in the new shmobile_boot_vector_gen2 is
     not compatible with R-Car V2H in some way (CPU off/onlining does
     work).

Once we know on which SoCs and revisions it does work, we can add the
proper checks. Right now I'm thinking of adding something like:

    if (IS_ENABLED(CONFIG_SMP) && maxcpus > 1 &&
	soc_device_match(rcar_gen2_wdt_needs_up))
	    return -ENODEV;

to the watchdog's probe function (assumed we can fix
shmobile_boot_vector_gen2 for R-Car V2H, else we need more checks).

For your convenience, Fabrizio's and my series are available in the
topic/rcar-gen2-wdt-v4 resp. topic/rcar-gen2-wdt-v4+ branches of my
renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

shmobile_defconfig should enable all support needed for testing.

Test procedure:

    cat > /dev/watchdog0 & for i in $(seq 100); do echo $i; sleep 1; done

If everything goes well, the board should reboot after 60 seconds.

Note that on several boards there are multiple watchdogs (RWDT and
DA9063 PMIC):

    # ls -l /dev/watchdog*
    crw------- 1 root root  10, 130 Jan  1  2000 /dev/watchdog
    crw------- 1 root root 247,   0 Jan  1  2000 /dev/watchdog0
    crw------- 1 root root 247,   1 Jan  1  2000 /dev/watchdog1

/dev/watchdog always corresponds to /dev/watchdog0.
The first one is usually the RWDT. If you want to be 100% sure, look in
sysfs for devices with the (dynamic!) major matching the /dev/watchdog*
files:

    # find /sys/devices/ -name dev | xargs grep 247:
    /sys/devices/platform/soc/e6020000.watchdog/watchdog/watchdog0/dev:247:0
    /sys/devices/platform/soc/e60b0000.i2c/i2c-6/6-0058/da9063-watchdog/watchdog/watchdog1/dev:247:1

Thanks for testing, especially on newer revisions of R-Car H2, M2-W, and
V2H, and on other boards!

Geert Uytterhoeven (11):
  clk: renesas: r8a7792: Add rwdt clock
  ARM: dts: r8a7792: Add RWDT node
  ARM: dts: r8a7793: Add RWDT node
  ARM: dts: lager: Enable watchdog support
  ARM: dts: koelsch: Enable watchdog support
  ARM: dts: porter: Enable watchdog support
  ARM: dts: blanche: Enable watchdog support
  ARM: dts: wheat: Enable watchdog support
  ARM: dts: gose: Enable watchdog support
  ARM: dts: alt: Enable watchdog support
  ARM: dts: silk: Enable watchdog support

 arch/arm/boot/dts/r8a7790-lager.dts    |  5 +++++
 arch/arm/boot/dts/r8a7791-koelsch.dts  |  5 +++++
 arch/arm/boot/dts/r8a7791-porter.dts   |  5 +++++
 arch/arm/boot/dts/r8a7792-blanche.dts  |  5 +++++
 arch/arm/boot/dts/r8a7792-wheat.dts    |  5 +++++
 arch/arm/boot/dts/r8a7792.dtsi         | 10 ++++++++++
 arch/arm/boot/dts/r8a7793-gose.dts     |  5 +++++
 arch/arm/boot/dts/r8a7793.dtsi         | 10 ++++++++++
 arch/arm/boot/dts/r8a7794-alt.dts      |  5 +++++
 arch/arm/boot/dts/r8a7794-silk.dts     |  5 +++++
 drivers/clk/renesas/r8a7792-cpg-mssr.c |  2 ++
 11 files changed, 62 insertions(+)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
