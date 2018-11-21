Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45799 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729334AbeKUVEV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 16:04:21 -0500
Received: by mail-pl1-f195.google.com with SMTP id a14so4908703plm.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Nov 2018 02:30:29 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 21 Nov 2018 19:30:48 +0900
Message-Id: <154279624819.29528.954090919447072739.sendpatchset@octo>
Subject: [PATCH 00/05] Test R-Car Gen3 SYSC power domains used by FCPCS and VDPB
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Test R-Car Gen3 SYSC power domains used by FCPCS and VDPB

[PATCH 01/05] Hack FCP driver to poke at FCPCS and VDPB during probe
[PATCH 02/05] arm64: dts: renesas: r8a7795: Add FCPCS+VDPB node for R-Car H3
[PATCH 03/05] arm64: dts: renesas: r8a7796: Add FCPCS+VDPB node for R-Car M3-W
[PATCH 04/05] arm64: dts: renesas: r8a77965: Add FCPCS+VDPB node for R-Car M3-N
[PATCH 05/05] arm64: dts: renesas: r8a77990: Add FCPCS+VDPB node for R-Car E3

These patches temporarily extend the FCP driver to manage power domain
power and poke at FCPCS and VDPB devices after power on and optionally
after power off as well. Access while power off is expected to fail and
is currently disabled by #ifdef wrap.

Example of console printout from H3 ULCB:

[    1.921670] Enabling FCPCS device (Runtime PM on)
[    1.926449] Power-on FCPCS version is 0x00000103
[    1.931117] Power-on VDPB read at offset 0x200 is 0x00000000
[    1.936819] Disabling FCPCS device (Runtime PM off) 
[    1.941853] rcar_sysc_pd_power_off: a2vc1
[    1.945960] sysc power off domain 26: 0000000e -> 0
[    1.950892] rcar_sysc_pd_power_off: a3vc
[    1.954903] sysc power off domain 14: 0000000e -> 0

Register details for FCPCS and VDPB are omitted from the data sheet,
however this code assumes the version register in FCPCS is available
following same register layout as other documented FCP devices.

As can be seen by the printout above, some sort of value is read out when
the power domain is on. Reading out the same register when turned off
triggers an exception on H3 ES2 as expected.

Please note that repeated power on-off-on has not been performed. Also
no verification has been made that devices actually are located in A2VC
instead of for instance A3VC. Since A3VC is parent of A2VC an incorrect
power domain pointer in DT to A2VC while the (rather undocumented) device
is located in A3VC might result in some hidden errors.

The VDPB register access results in all-zero value while powered on. Which
actual register that should be used for poking remains guess work at this
point. Reading VDPB while powered off results in an exception on H3 ES2.

The basic testing performed by this series shows that A2VC power domain
handling for H3 ES2 seems to work as expected.

This series is not intended for upstream merge.

Created as an example of how to test power domains for a certain device.
I hope to use this approach to test IPMMU power domain support in the future.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20181119-v4.20-rc3

 arch/arm64/boot/dts/renesas/r8a7795.dtsi  |    9 ++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  |    9 ++++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi |    9 ++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |    9 ++++++
 drivers/media/platform/rcar-fcp.c         |   42 ++++++++++++++++++++++++++++-
 drivers/soc/renesas/rcar-sysc.c           |    1 
 6 files changed, 78 insertions(+), 1 deletion(-)
