Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73FE265623
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2026 01:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162832; cv=none; b=s1CZfx3eDWMhS13f4R1VUeZbIpYRt3tb8Wibs2LVkolpflfKv5auldGd6M7O1n+Kb2AxQdnf34cnVMAhp0KjXHe6eLqvWTAjj4M6HuUPmGNAKeO6TghhBUe5pNWKa9FdCdAW74AaajrarDKSFGdGMzfNHUebvac0kGuWePs8aOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162832; c=relaxed/simple;
	bh=+TKwHmStPaVu82Jm2HQtQFykb/qWv5ki2ABjVqZufZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jU346LGRVhQz4eY5uRUyY/43KDog/6pbhgEHcZao4G3XGysue+dZn+ochD6axq0VnkDbom/4MmD//ooataidIPiEPAnWxL6PEIUOV8Hd8VrcToWegKQtcQEjkYQ6GQ47DMQJEHGg7mA83omFZE/FwQtw++K+gU8+jPAI9SwZbFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZKGlYpt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZKGlYpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791162830; x=1822698830;
  h=date:from:to:cc:subject:message-id;
  bh=+TKwHmStPaVu82Jm2HQtQFykb/qWv5ki2ABjVqZufZw=;
  b=ZZKGlYptGnmvk7/wYUDkatX3+k/Qge1SULp3f5LAnF5YKwmPJzPaY2jt
   48j1vYvMSVX3v8mxIwN2TapYXOJVqLw3o4O8L3MZOvquBo1s99MJ2wjp5
   pfW9+pF83PoTPGaF0bOB0WYxazC0S0J4CPzqmmVFUMYKEcu3d7xUW5Vb5
   eCGi0+/vy+47M6J9t+esipPdikaR/xg41ciCrMJNEUw+Egz36LUJ5xiUy
   wgZPdvqHLTX6O0YldzhltcsBhM7d1jwclDH0JOm57QLyeD2GDl3Z4h0UY
   MyJFApM2wcmmy6+m2+VArQQEWtg5iX63RloAqSUf1imXkk37xnUdhcjqI
   A==;
X-CSE-ConnectionGUID: qGWAnfRQQKeZjOMFBjmIVw==
X-CSE-MsgGUID: oeC6+AqGR5CgsKUXbL1o8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94705427"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="94705427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 18:13:50 -0700
X-CSE-ConnectionGUID: Ptj/xMYvS8aglCgGf5z0CQ==
X-CSE-MsgGUID: O5+bm4c8Svq5/tUukn3sSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="279962876"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Oct 2026 18:13:48 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDXGz-00000000VER-3cQ5;
	Mon, 05 Oct 2026 01:13:45 +0000
Date: Mon, 05 Oct 2026 09:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS WITH UNVERIFIED
 WARNING 1320b9000130f6240b4f713b0948dcab4dfd95fa
Message-ID: <202610050923.ZUi1SA9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 1320b9000130f6240b4f713b0948dcab4dfd95fa  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

Unverified Warning (likely false positive, kindly check if interested):

    https://lore.kernel.org/oe-kbuild/202609300815.iHWnpcaG-lkp@intel.com
    https://lore.kernel.org/oe-kbuild/202610031146.wgcpEZWp-lkp@intel.com

    arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
    arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
    arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
    arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
    arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-a.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
    arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot-rs485-b.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
    arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-iiot.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
    arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property

Warning ids grouped by kconfigs:

recent_errors
|-- arm64-randconfig-2400-20260930
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-emmc.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-microsd.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-a.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-b.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   `-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|-- arm64-randconfig-2401-20260930
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-emmc.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-microsd.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-a.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-b.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   `-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|-- arm64-randconfig-2402-20260929
|   |-- arch-arm64-boot-dts-renesas-r9a07g044c2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-emmc.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-microsd.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-a.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-b.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   `-- arch-arm64-boot-dts-renesas-r9a07g054l2-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|-- arm64-randconfig-2402-20260930
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-emmc.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-microsd.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-a.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-b.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   `-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|-- arm64-randconfig-2403-20260930
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-emmc.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-microsd.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-a.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-b.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   `-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|-- arm64-randconfig-2404-20260930
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-emmc.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-microsd.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-a.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   |-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot-rs485-b.dtb:hub-(usb4b2):peer-hub-is-a-required-property
|   `-- arch-arm64-boot-dts-renesas-r9a07g044l2-hummingboard-iiot.dtb:hub-(usb4b2):peer-hub-is-a-required-property
`-- x86_64-allnoconfig

elapsed time: 7410m

configs tested: 95
configs skipped: 5

tested configs:
alpha                     allnoconfig    gcc-16.1.0
alpha                    allyesconfig    gcc-16.1.0
alpha       randconfig-r2304-20260929    gcc-12.5.0 sparse
arc                       allnoconfig    gcc-16.1.0
arc                      allyesconfig    gcc-16.1.0
arc         randconfig-r2301-20260929    gcc-9.5.0  sparse
arm                       allnoconfig    clang-17
arm         randconfig-r2101-20260930    clang-19   cocci
arm64                    allmodconfig    clang-24
arm64                     allnoconfig    gcc-16.1.0
csky                     allmodconfig    gcc-16.1.0
csky                      allnoconfig    gcc-16.1.0
hexagon                  allmodconfig    clang-24
hexagon                   allnoconfig    clang-24
i386                      allnoconfig    gcc-14
i386         randconfig-2100-20260930    clang-22   cocci
i386         randconfig-2101-20260930    clang-22   cocci
i386         randconfig-2102-20260930    clang-22   cocci
i386         randconfig-2103-20260930    clang-22   cocci
i386         randconfig-2200-20260930    gcc-14     smatch
i386         randconfig-2300-20260930    gcc-14     sparse
i386         randconfig-2301-20260930    clang-22   sparse
i386         randconfig-2302-20260930    gcc-14     sparse
i386        randconfig-r2102-20260930    gcc-12     cocci
i386        randconfig-r2307-20260929    gcc-14     sparse
loongarch                allmodconfig    clang-19
loongarch                 allnoconfig    clang-20
loongarch   randconfig-r2107-20260930    clang-18   cocci
m68k                     allmodconfig    gcc-16.1.0
m68k                      allnoconfig    gcc-16.1.0
m68k        randconfig-r2106-20260930    gcc-14.3.0 cocci
microblaze                allnoconfig    gcc-16.1.0
microblaze               allyesconfig    gcc-16.1.0
mips                      allnoconfig    gcc-16.1.0
mips                     allyesconfig    gcc-16.1.0
nios2                    allmodconfig    gcc-11.5.0
nios2                     allnoconfig    gcc-11.5.0
nios2       randconfig-r2100-20260930    gcc-11.5.0 cocci
nios2       randconfig-r2103-20260930    gcc-9.5.0  cocci
openrisc                 allmodconfig    gcc-16.1.0
openrisc                  allnoconfig    gcc-16.1.0
openrisc                    defconfig    gcc-16.1.0
openrisc    randconfig-r2104-20260930    gcc-9.5.0  cocci
openrisc    randconfig-r2200-20260930    gcc-16.1.0 smatch
parisc                    allnoconfig    gcc-16.1.0
parisc                      defconfig    gcc-16.1.0
powerpc                   allnoconfig    gcc-16.1.0
powerpc64   randconfig-r2105-20260930    gcc-10.5.0 cocci
powerpc64   randconfig-r2308-20260929    gcc-8.5.0  sparse
riscv                    allmodconfig    clang-24
riscv                     allnoconfig    gcc-16.1.0
riscv                    allyesconfig    clang-24
riscv                       defconfig    clang-24
riscv        randconfig-2000-20260929    gcc-11.5.0
riscv        randconfig-2001-20260929    gcc-9.5.0
riscv       randconfig-r2300-20260929    gcc-11.5.0 sparse
s390                      allnoconfig    clang-24
s390                        defconfig    clang-18
s390         randconfig-2000-20260929    clang-24
s390         randconfig-2001-20260929    gcc-8.5.0
s390        randconfig-r2202-20260930    clang-18   smatch
s390        randconfig-r2302-20260929    gcc-8.5.0  sparse
sh                       allmodconfig    gcc-16.1.0
sh                        allnoconfig    gcc-16.1.0
sh           randconfig-2000-20260929    gcc-14.3.0
sh           randconfig-2001-20260929    gcc-16.1.0
sh          randconfig-r2305-20260929    gcc-16.1.0 sparse
sh          randconfig-r2306-20260929    gcc-12.5.0 sparse
sparc                     allnoconfig    gcc-16.1.0
sparc                       defconfig    gcc-16.1.0
sparc        randconfig-2000-20260930    gcc-14.3.0
sparc        randconfig-2001-20260930    gcc-8.5.0
sparc64                  allmodconfig    clang-20
sparc64      randconfig-2000-20260930    gcc-8.5.0
sparc64      randconfig-2001-20260930    gcc-9.5.0
sparc64     randconfig-r2201-20260930    gcc-12.5.0 smatch
um                        allnoconfig    clang-17
um                       allyesconfig    gcc-14
um           randconfig-2000-20260930    clang-24
um           randconfig-2001-20260930    clang-24
x86_64                    allnoconfig    clang-22
x86_64       randconfig-2100-20260930    clang-22   cocci
x86_64       randconfig-2101-20260930    clang-22   cocci
x86_64       randconfig-2102-20260930    gcc-14     cocci
x86_64       randconfig-2103-20260930    clang-22   cocci
x86_64       randconfig-2200-20260930    gcc-14     smatch
x86_64       randconfig-2300-20260930    clang-22   sparse
x86_64       randconfig-2301-20260930    gcc-14     sparse
x86_64       randconfig-2302-20260930    gcc-13     sparse
x86_64      randconfig-r2303-20260929    gcc-14     sparse
xtensa                    allnoconfig    gcc-16.1.0
xtensa                   allyesconfig    gcc-16.1.0
xtensa       randconfig-2000-20260930    gcc-12.5.0
xtensa       randconfig-2001-20260930    gcc-10.5.0
xtensa      randconfig-r2309-20260929    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
