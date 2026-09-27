Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE113E866B
	for <linux-renesas-soc@vger.kernel.org>; Sun, 27 Sep 2026 23:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553371; cv=none; b=DGqiKovCzYESYnDjBk8wgx/s/bzE9y9c1P76xLESARGcVNHvxcG6KTIPITX4q15h1rDHkyizH8CaTpEgvQa/0C6SUChL+Vby9wZHLfRrhZlSgty1kkM/FgBicu2dNddxjr69LejJhZImVRljlIySeEL3If5EPAHHeWZP+gI+L8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553371; c=relaxed/simple;
	bh=h8XXFBuLzFM0vG1nHkHj0RW8XNDrsyQDdgdqxmGKqiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rnfwvCkzIillwlymF3swAqDnjmE/yIXovZLeFz7WgG09Oc9+XH80KW5VluwNhIY+aVSFwz7Om5gW1UWGpGOwf40xo/iKLfn5D7J8/7o2BFxQX/Z67aBjPuVBltSDRa9YJI5MKCdgCEE5pFbFny9WwvLxlS8TwPIL56bj24JkHWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NyNu5yg2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyNu5yg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790553366; x=1822089366;
  h=date:from:to:cc:subject:message-id;
  bh=h8XXFBuLzFM0vG1nHkHj0RW8XNDrsyQDdgdqxmGKqiY=;
  b=NyNu5yg2B5HODEmKenhxTtL8AsXGFTddNOb32o5VFlWNBfg0HWTOVMiT
   2tVr0YVqDcC9XmcpSuxlGu/4IOS49SZ5ayBP9GcVlQa+k0nxdmyZl5CM3
   +yPt2oFCLKzvM01g+Pia9CuehjvEP44/sasyNHpq8LAWG6c78ZYO9oPGA
   7BZafNtMKuoAHJEhBeJHoBE8dWUsjVFBBvaEGpHRSaFqF4Re2vXTG9jZY
   GRG5f0hvHST5u+FS0oyonKQpxLmeiNr6yOrL7GacGk0H9xpX9kSZWjeWo
   M3rRTp34ks2n/mD2o3Tcsn39Af80rqf/HgZh86dSMXlA0i78jEP+xOzgp
   g==;
X-CSE-ConnectionGUID: JCTSgGShQNetC+ys8mhfyQ==
X-CSE-MsgGUID: WEO8iJnUSH28oQEdb1XGTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90115942"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="90115942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 16:56:00 -0700
X-CSE-ConnectionGUID: ARhBFtX3RP6J4Fg/PVsDLA==
X-CSE-MsgGUID: dUh+EBBnSNmvL9tpg7a4dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="274947882"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2026 16:55:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAyiq-00000000NHC-0MoN;
	Sun, 27 Sep 2026 23:55:56 +0000
Date: Mon, 28 Sep 2026 07:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic:rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-wip]
 BUILD SUCCESS WITH UNVERIFIED WARNING
 61382c1026cdebbf608e3aecb95c11d1cdbb9bb2
Message-ID: <202609280717.J95IrDzW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4-wip
branch HEAD: 61382c1026cdebbf608e3aecb95c11d1cdbb9bb2  --- R-Car X5H Ironhide pin control -------------------------------

Unverified Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202609251958.yyy5pE7O-lkp@intel.com

    arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
    arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupts: [[0, 698, 1], [0, 699, 1], [0, 700, 1], [0, 701, 4], [0, 702, 4]] is too short
    arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupt-names: ['adi', 'gbadi', 'gcadi', 'cmpai', 'cmpbi'] is too short
    arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: adc@90014000 (renesas,r9a09g077-adc): interrupts: [[0, 698, 1], [0, 699, 1], [0, 700, 1], [0, 701, 4], [0, 702, 4]] is too short

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-2400-20260925
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   `-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|-- arm64-randconfig-2400-20260927
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   `-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|-- arm64-randconfig-2401-20260927
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   `-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|-- arm64-randconfig-2402-20260927
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   `-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|-- arm64-randconfig-2403-20260927
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
|   |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
|   `-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
`-- arm64-randconfig-2404-20260927
    |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
    |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short
    |-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupt-names:adi-gbadi-gcadi-cmpai-cmpbi-is-too-short
    `-- arch-arm64-boot-dts-renesas-r9a09g077m44-rzt2h-evk.dtb:adc-(renesas-r9a09g077-adc):interrupts:is-too-short

elapsed time: 2417m

configs tested: 412
configs skipped: 2

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20260927    gcc-8.5.0  cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                           axs103_defconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260926    clang-24
arc                   randconfig-1000-20260927    gcc-11.5.0
arc                   randconfig-1000-20260928    clang-24
arc                   randconfig-1001-20260926    clang-24
arc                   randconfig-1001-20260927    gcc-11.5.0
arc                   randconfig-1001-20260928    clang-24
arc                  randconfig-r2309-20260927    gcc-11.5.0 sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                       jornada720_defconfig    clang-24
arm                         keystone_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260926    clang-24
arm                   randconfig-1000-20260927    gcc-11.5.0
arm                   randconfig-1000-20260928    clang-24
arm                   randconfig-1001-20260926    clang-24
arm                   randconfig-1001-20260927    gcc-11.5.0
arm                   randconfig-1001-20260928    clang-24
arm                   randconfig-1002-20260926    clang-24
arm                   randconfig-1002-20260927    gcc-11.5.0
arm                   randconfig-1002-20260928    clang-24
arm                   randconfig-1003-20260926    clang-24
arm                   randconfig-1003-20260927    gcc-11.5.0
arm                   randconfig-1003-20260928    clang-24
arm                  randconfig-r2107-20260927    clang-17   cocci
arm                  randconfig-r2107-20260927    gcc-8.5.0  cocci
arm                  randconfig-r2300-20260927    clang-22   sparse
arm                  randconfig-r2304-20260927    clang-22   sparse
arm                           sp7021_defconfig    gcc-11.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260926    gcc-8.5.0
arm64                 randconfig-1000-20260927    clang-17
arm64                 randconfig-1000-20260928    gcc-15.2.0
arm64                 randconfig-1001-20260926    gcc-8.5.0
arm64                 randconfig-1001-20260927    clang-17
arm64                 randconfig-1001-20260928    gcc-15.2.0
arm64                 randconfig-1002-20260926    gcc-8.5.0
arm64                 randconfig-1002-20260927    clang-17
arm64                 randconfig-1002-20260928    gcc-15.2.0
arm64                 randconfig-1003-20260926    gcc-8.5.0
arm64                 randconfig-1003-20260927    clang-17
arm64                 randconfig-1003-20260928    gcc-15.2.0
arm64                randconfig-r2305-20260927    gcc-15.2.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260926    gcc-8.5.0
csky                  randconfig-1000-20260927    clang-17
csky                  randconfig-1000-20260928    gcc-15.2.0
csky                  randconfig-1001-20260926    gcc-8.5.0
csky                  randconfig-1001-20260927    clang-17
csky                  randconfig-1001-20260928    gcc-15.2.0
csky                 randconfig-r2106-20260927    clang-17   cocci
csky                 randconfig-r2300-20260927    gcc-15.2.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260926    gcc-10.5.0
hexagon               randconfig-1000-20260927    gcc-11.5.0
hexagon               randconfig-1000-20260928    gcc-8.5.0
hexagon               randconfig-1001-20260926    gcc-10.5.0
hexagon               randconfig-1001-20260927    gcc-11.5.0
hexagon               randconfig-1001-20260928    gcc-8.5.0
hexagon              randconfig-r2104-20260927    clang-24   cocci
hexagon              randconfig-r2201-20260927    clang-24   smatch
hexagon              randconfig-r2304-20260927    gcc-15.2.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260926    gcc-14
i386        buildonly-randconfig-1000-20260927    clang-22
i386        buildonly-randconfig-1000-20260928    clang-22
i386        buildonly-randconfig-1001-20260926    gcc-14
i386        buildonly-randconfig-1001-20260927    clang-22
i386        buildonly-randconfig-1001-20260928    clang-22
i386        buildonly-randconfig-1002-20260926    gcc-14
i386        buildonly-randconfig-1002-20260927    clang-22
i386        buildonly-randconfig-1002-20260928    clang-22
i386        buildonly-randconfig-1003-20260926    gcc-14
i386        buildonly-randconfig-1003-20260927    clang-22
i386        buildonly-randconfig-1003-20260928    clang-22
i386        buildonly-randconfig-1004-20260926    gcc-14
i386        buildonly-randconfig-1004-20260927    clang-22
i386        buildonly-randconfig-1004-20260928    clang-22
i386        buildonly-randconfig-1005-20260926    gcc-14
i386        buildonly-randconfig-1005-20260927    clang-22
i386        buildonly-randconfig-1005-20260928    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260927    clang-22
i386                  randconfig-1000-20260928    gcc-14
i386                  randconfig-1001-20260927    clang-22
i386                  randconfig-1001-20260928    gcc-14
i386                  randconfig-1002-20260927    clang-22
i386                  randconfig-1002-20260928    gcc-14
i386                  randconfig-1003-20260927    clang-22
i386                  randconfig-1003-20260928    gcc-14
i386                  randconfig-1004-20260927    clang-22
i386                  randconfig-1004-20260928    gcc-14
i386                  randconfig-1005-20260927    clang-22
i386                  randconfig-1005-20260928    gcc-14
i386                  randconfig-1006-20260927    clang-22
i386                  randconfig-1006-20260928    gcc-14
i386                  randconfig-1007-20260926    gcc-14
i386                  randconfig-1007-20260927    gcc-14
i386                  randconfig-1008-20260926    gcc-14
i386                  randconfig-1008-20260927    gcc-14
i386                  randconfig-1009-20260926    gcc-14
i386                  randconfig-1009-20260927    gcc-14
i386                  randconfig-1010-20260926    gcc-14
i386                  randconfig-1010-20260927    gcc-14
i386                  randconfig-1011-20260926    gcc-14
i386                  randconfig-1011-20260927    gcc-14
i386                  randconfig-1012-20260926    gcc-14
i386                  randconfig-1012-20260927    gcc-14
i386                  randconfig-1013-20260926    gcc-14
i386                  randconfig-1013-20260927    gcc-14
i386                  randconfig-2100-20260927    clang-22   cocci
i386                  randconfig-2101-20260927    clang-22   cocci
i386                  randconfig-2102-20260927    clang-22   cocci
i386                  randconfig-2103-20260927    clang-22   cocci
i386                  randconfig-2200-20260927    clang-22   smatch
i386                  randconfig-2300-20260927    clang-22   sparse
i386                  randconfig-2301-20260927    clang-22   sparse
i386                  randconfig-2302-20260927    clang-22   sparse
i386                 randconfig-r2101-20260927    gcc-8.5.0  cocci
i386                 randconfig-r2107-20260927    clang-24   cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260926    gcc-10.5.0
loongarch             randconfig-1000-20260927    gcc-11.5.0
loongarch             randconfig-1000-20260928    gcc-8.5.0
loongarch             randconfig-1001-20260926    gcc-10.5.0
loongarch             randconfig-1001-20260927    gcc-11.5.0
loongarch             randconfig-1001-20260928    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5208evb_defconfig    gcc-11.5.0
m68k                         m5407c3_defconfig    clang-24
m68k                       m54418evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2301-20260927    gcc-15.2.0 sparse
m68k                 randconfig-r2306-20260927    gcc-11.5.0 sparse
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20260927    gcc-8.5.0  cocci
microblaze           randconfig-r2202-20260927    gcc-13.4.0 smatch
microblaze           randconfig-r2304-20260927    clang-24   sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm47xx_defconfig    gcc-11.5.0
mips                   cavium_octeon_defconfig    gcc-16.1.0
mips                          cobalt_defconfig    gcc-16.1.0
mips                            ip22_defconfig    clang-24
mips                 malta_qemu_32r6_defconfig    clang-24
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                 randconfig-r2103-20260927    gcc-8.5.0  cocci
mips                 randconfig-r2305-20260927    clang-22   sparse
mips                 randconfig-r2305-20260927    clang-24   sparse
mips                 randconfig-r2307-20260927    gcc-11.5.0 sparse
nios2                             alldefconfig    gcc-11.5.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260926    gcc-10.5.0
nios2                 randconfig-1000-20260927    gcc-11.5.0
nios2                 randconfig-1000-20260928    gcc-8.5.0
nios2                 randconfig-1001-20260926    gcc-10.5.0
nios2                 randconfig-1001-20260927    gcc-11.5.0
nios2                 randconfig-1001-20260928    gcc-8.5.0
nios2                randconfig-r2103-20260927    gcc-8.5.0  cocci
nios2                randconfig-r2303-20260927    clang-22   sparse
nios2                randconfig-r2303-20260927    gcc-15.2.0 sparse
nios2                randconfig-r2308-20260927    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2101-20260927    gcc-13.4.0 cocci
openrisc             randconfig-r2106-20260927    clang-24   cocci
openrisc             randconfig-r2200-20260927    gcc-16.1.0 smatch
openrisc             randconfig-r2300-20260927    clang-24   sparse
openrisc             randconfig-r2301-20260927    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260926    clang-24
parisc                randconfig-1000-20260927    clang-24
parisc                randconfig-1000-20260928    clang-24
parisc                randconfig-1001-20260926    clang-24
parisc                randconfig-1001-20260927    clang-24
parisc                randconfig-1001-20260928    clang-24
parisc               randconfig-r2100-20260927    gcc-8.5.0  cocci
parisc               randconfig-r2103-20260927    gcc-13.4.0 cocci
parisc               randconfig-r2104-20260927    gcc-8.5.0  cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                     ge_imp3a_defconfig    gcc-16.1.0
powerpc                   iss476-smp_defconfig    clang-24
powerpc               randconfig-1000-20260926    clang-24
powerpc               randconfig-1000-20260927    clang-24
powerpc               randconfig-1000-20260928    clang-24
powerpc               randconfig-1001-20260926    clang-24
powerpc               randconfig-1001-20260927    clang-24
powerpc               randconfig-1001-20260928    clang-24
powerpc              randconfig-r2105-20260927    clang-17   cocci
powerpc              randconfig-r2302-20260927    gcc-15.2.0 sparse
powerpc                      taishan_defconfig    clang-24
powerpc                      tqm8541_defconfig    gcc-11.5.0
powerpc                      tqm8548_defconfig    gcc-11.5.0
powerpc                      tqm8555_defconfig    gcc-11.5.0
powerpc64             randconfig-1000-20260926    clang-24
powerpc64             randconfig-1000-20260927    clang-24
powerpc64             randconfig-1000-20260928    clang-24
powerpc64             randconfig-1001-20260926    clang-24
powerpc64             randconfig-1001-20260927    clang-24
powerpc64             randconfig-1001-20260928    clang-24
powerpc64            randconfig-r2102-20260927    gcc-13.4.0 cocci
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260927    gcc-16.1.0
riscv                 randconfig-1000-20260928    clang-24
riscv                 randconfig-1001-20260927    gcc-16.1.0
riscv                 randconfig-1001-20260928    clang-24
riscv                 randconfig-2000-20260927    clang-24
riscv                 randconfig-2001-20260927    clang-24
riscv                randconfig-r2201-20260927    gcc-8.5.0  smatch
riscv                randconfig-r2301-20260927    clang-22   sparse
riscv                randconfig-r2307-20260927    clang-24   sparse
riscv                randconfig-r2308-20260927    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260927    gcc-16.1.0
s390                  randconfig-1000-20260928    clang-24
s390                  randconfig-1001-20260927    gcc-16.1.0
s390                  randconfig-1001-20260928    clang-24
s390                  randconfig-2000-20260927    clang-24
s390                  randconfig-2001-20260927    clang-24
s390                 randconfig-r2105-20260927    gcc-8.5.0  cocci
s390                 randconfig-r2202-20260927    clang-24   smatch
s390                 randconfig-r2302-20260927    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                             migor_defconfig    clang-24
sh                    randconfig-1000-20260927    gcc-16.1.0
sh                    randconfig-1000-20260928    clang-24
sh                    randconfig-1001-20260927    gcc-16.1.0
sh                    randconfig-1001-20260928    clang-24
sh                    randconfig-2000-20260927    clang-24
sh                    randconfig-2001-20260927    clang-24
sh                   randconfig-r2200-20260927    gcc-13.4.0 smatch
sh                           sdk7780_defconfig    gcc-16.1.0
sh                              sh03_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260926    gcc-14
sparc                 randconfig-1000-20260927    clang-24
sparc                 randconfig-1000-20260928    clang-17
sparc                 randconfig-1001-20260926    gcc-14
sparc                 randconfig-1001-20260927    clang-24
sparc                 randconfig-1001-20260928    clang-17
sparc                 randconfig-2000-20260927    gcc-16.1.0
sparc                 randconfig-2001-20260927    gcc-16.1.0
sparc                randconfig-r2105-20260927    clang-24   cocci
sparc                randconfig-r2106-20260927    gcc-8.5.0  cocci
sparc                randconfig-r2306-20260927    clang-24   sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260926    gcc-14
sparc64               randconfig-1000-20260927    clang-24
sparc64               randconfig-1000-20260928    clang-17
sparc64               randconfig-1001-20260926    gcc-14
sparc64               randconfig-1001-20260927    clang-24
sparc64               randconfig-1001-20260928    clang-17
sparc64               randconfig-2000-20260927    gcc-16.1.0
sparc64               randconfig-2001-20260927    gcc-16.1.0
sparc64              randconfig-r2101-20260927    gcc-8.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260926    gcc-14
um                    randconfig-1000-20260927    clang-24
um                    randconfig-1000-20260928    clang-17
um                    randconfig-1001-20260926    gcc-14
um                    randconfig-1001-20260927    clang-24
um                    randconfig-1001-20260928    clang-17
um                    randconfig-2000-20260927    gcc-16.1.0
um                    randconfig-2001-20260927    gcc-16.1.0
um                   randconfig-r2202-20260927    gcc-14     smatch
um                   randconfig-r2302-20260927    clang-22   sparse
um                   randconfig-r2303-20260927    clang-24   sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260927    gcc-14
x86_64      buildonly-randconfig-1000-20260928    gcc-14
x86_64      buildonly-randconfig-1001-20260927    gcc-14
x86_64      buildonly-randconfig-1001-20260928    gcc-14
x86_64      buildonly-randconfig-1002-20260927    gcc-14
x86_64      buildonly-randconfig-1002-20260928    gcc-14
x86_64      buildonly-randconfig-1003-20260927    gcc-14
x86_64      buildonly-randconfig-1003-20260928    gcc-14
x86_64      buildonly-randconfig-1004-20260927    gcc-14
x86_64      buildonly-randconfig-1004-20260928    gcc-14
x86_64      buildonly-randconfig-1005-20260927    gcc-14
x86_64      buildonly-randconfig-1005-20260928    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260926    gcc-14
x86_64                randconfig-1000-20260927    clang-22
x86_64                randconfig-1000-20260928    gcc-14
x86_64                randconfig-1001-20260926    gcc-14
x86_64                randconfig-1001-20260927    clang-22
x86_64                randconfig-1001-20260928    gcc-14
x86_64                randconfig-1002-20260926    gcc-14
x86_64                randconfig-1002-20260927    clang-22
x86_64                randconfig-1002-20260928    gcc-14
x86_64                randconfig-1003-20260926    gcc-14
x86_64                randconfig-1003-20260927    clang-22
x86_64                randconfig-1003-20260928    gcc-14
x86_64                randconfig-1004-20260926    gcc-14
x86_64                randconfig-1004-20260927    clang-22
x86_64                randconfig-1004-20260928    gcc-14
x86_64                randconfig-1005-20260926    gcc-14
x86_64                randconfig-1005-20260927    clang-22
x86_64                randconfig-1005-20260928    gcc-14
x86_64                randconfig-1006-20260926    gcc-14
x86_64                randconfig-1006-20260927    clang-22
x86_64                randconfig-1006-20260928    gcc-14
x86_64                randconfig-1007-20260926    gcc-14
x86_64                randconfig-1007-20260927    clang-22
x86_64                randconfig-1007-20260928    gcc-14
x86_64                randconfig-1008-20260926    gcc-14
x86_64                randconfig-1008-20260927    clang-22
x86_64                randconfig-1008-20260928    gcc-14
x86_64                randconfig-1009-20260926    gcc-14
x86_64                randconfig-1009-20260927    clang-22
x86_64                randconfig-1009-20260928    gcc-14
x86_64                randconfig-1010-20260926    gcc-14
x86_64                randconfig-1010-20260927    clang-22
x86_64                randconfig-1010-20260928    gcc-14
x86_64                randconfig-1011-20260926    gcc-14
x86_64                randconfig-1011-20260927    clang-22
x86_64                randconfig-1011-20260928    gcc-14
x86_64                randconfig-1012-20260927    clang-22
x86_64                randconfig-1013-20260927    clang-22
x86_64                randconfig-1014-20260927    clang-22
x86_64                randconfig-1015-20260927    clang-22
x86_64                randconfig-1016-20260927    clang-22
x86_64                randconfig-1017-20260927    clang-22
x86_64                randconfig-2100-20260927    clang-22   cocci
x86_64                randconfig-2101-20260927    clang-22   cocci
x86_64                randconfig-2102-20260927    clang-22   cocci
x86_64                randconfig-2103-20260927    clang-22   cocci
x86_64                randconfig-2200-20260927    gcc-14     smatch
x86_64                randconfig-2300-20260927    clang-22   sparse
x86_64                randconfig-2300-20260927    gcc-14     sparse
x86_64                randconfig-2301-20260927    clang-22   sparse
x86_64                randconfig-2301-20260927    gcc-14     sparse
x86_64                randconfig-2302-20260927    clang-22   sparse
x86_64                randconfig-2302-20260927    gcc-13     sparse
x86_64               randconfig-r2202-20260927    gcc-13     smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20260926    gcc-14
xtensa                randconfig-1000-20260927    clang-24
xtensa                randconfig-1000-20260928    clang-17
xtensa                randconfig-1001-20260926    gcc-14
xtensa                randconfig-1001-20260927    clang-24
xtensa                randconfig-1001-20260928    clang-17
xtensa                randconfig-2000-20260927    gcc-16.1.0
xtensa                randconfig-2001-20260927    gcc-16.1.0
xtensa               randconfig-r2100-20260927    gcc-13.4.0 cocci
xtensa               randconfig-r2104-20260927    clang-17   cocci
xtensa               randconfig-r2201-20260927    gcc-16.1.0 smatch
xtensa               randconfig-r2309-20260927    clang-24   sparse
xtensa                     smp_lx200_defconfig    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
