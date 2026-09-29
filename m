Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A654488F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 17:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704147; cv=none; b=CofRekMY07dqxAUOYME0S2hQPQI/ipAS7rexi3sgX6kpQ5LuumgPKZfARbe1tkgRJpcLD4CJAis+p8kbLAUgu+mzeAY72hcmFCb22veX3Jds9Vk4M4Tl+q+SLGyqQFLB05t2Mwh0ETY43YGy0Kt3uWrrtfgBFPb62JS4szxAYiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704147; c=relaxed/simple;
	bh=k4PG4ar9IorvhYf/+RSXcWwlhvz7m8MIcVy2s+kwL70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VLr8MOvMCyfGlV/wALLrdF+qP4/wQII9bJ1+nA8wCgYa4h59OrkKPFu4lJJXQyMAJuVThsXqujuFnkwvtZkd3U5p1U0wEkVnEVZKTG8j9MVKcEEXkOHWaAIsby329IoIEoxrwUg6XrqV+sNu5fbiKVvwr4WQ0mQZqJ92Axn5+rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bVVu7vLF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bVVu7vLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790704145; x=1822240145;
  h=date:from:to:cc:subject:message-id;
  bh=k4PG4ar9IorvhYf/+RSXcWwlhvz7m8MIcVy2s+kwL70=;
  b=bVVu7vLFP+DOHo4U58Rn/1kBmSOGnjkBq7RYwEIBnQ+o5zf+LyZwnZ53
   hFQ/xpfXRNm7eU7Pwj3KpkMyQo++MO6wqVSi0Y+ASKyX3qSrbvJ3CYjeZ
   Xci+2s/qM6Wn8yhCgWxbJQbWTYkDniArakYxPr3P9n1HqwwcYrYQT6yu4
   LtM9HrFqhaL+cv9l4PM8Yvep6h9loyLMjt9UIV1p3Pkkaf8Njx5nCLpdf
   AWIUbZIHfeIJyTkBiIF3YIJoIZXIYW+Dm3RXGU4TxepYmJwIVs2bPUXSj
   PeFTi4UPyUx6F30gnePVgcLvXdq6hRWUAwRm11BjzT6AEtL3TP39fF8LU
   Q==;
X-CSE-ConnectionGUID: 4byPiZWoTsCcVb3fOZ2DjA==
X-CSE-MsgGUID: iZ12XfBLS1qLA1fgLwOKNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102104594"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="102104594"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:49:00 -0700
X-CSE-ConnectionGUID: SB0oLT7FRWK8dUkwV3GxAw==
X-CSE-MsgGUID: foKuyEdMTBm9rxC+3GUmkA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Sep 2026 10:48:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBbwm-00000000PaG-1oku;
	Tue, 29 Sep 2026 17:48:56 +0000
Date: Wed, 30 Sep 2026 01:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 c288cc2000334cb31de0737c8e81ab5cd26ef3bb
Message-ID: <202609300101.qrYGrqZc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: c288cc2000334cb31de0737c8e81ab5cd26ef3bb  Merge branch 'renesas-next', tag 'v7.3-rc5' into renesas-devel

elapsed time: 947m

configs tested: 267
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20260929    gcc-16.1.0 cocci
alpha                randconfig-r2107-20260929    gcc-15.2.0 cocci
alpha                randconfig-r2200-20260929    gcc-11.5.0 smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                         nsim_700_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260929    clang-17
arc                   randconfig-1001-20260929    clang-17
arc                  randconfig-r2303-20260929    gcc-8.5.0  sparse
arc                            tb10x_defconfig    gcc-16.1.0
arc                     vdk_hs38_smp_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.1.0
arm                          at91_dt_defconfig    gcc-16.1.0
arm                         clps711x_defconfig    gcc-16.1.0
arm                                  defconfig    gcc-16.1.0
arm                       footbridge_defconfig    gcc-16.1.0
arm                              mxs_defconfig    gcc-16.1.0
arm                          orion5x_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260929    clang-17
arm                   randconfig-1001-20260929    clang-17
arm                   randconfig-1002-20260929    clang-17
arm                   randconfig-1003-20260929    clang-17
arm                  randconfig-r2100-20260929    gcc-9.5.0  cocci
arm                         spear6xx_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260929    clang-24
arm64                 randconfig-1001-20260929    clang-24
arm64                 randconfig-1002-20260929    clang-24
arm64                 randconfig-1003-20260929    clang-24
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260929    clang-24
csky                  randconfig-1001-20260929    clang-24
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260929    gcc-8.5.0
hexagon               randconfig-1001-20260929    gcc-8.5.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260929    clang-22
i386        buildonly-randconfig-1001-20260929    clang-22
i386        buildonly-randconfig-1002-20260929    clang-22
i386        buildonly-randconfig-1003-20260929    clang-22
i386        buildonly-randconfig-1004-20260929    clang-22
i386        buildonly-randconfig-1005-20260929    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260929    gcc-13
i386                  randconfig-1001-20260929    gcc-13
i386                  randconfig-1002-20260929    gcc-13
i386                  randconfig-1003-20260929    gcc-13
i386                  randconfig-1004-20260929    gcc-13
i386                  randconfig-1005-20260929    gcc-13
i386                  randconfig-1006-20260929    gcc-13
i386                  randconfig-1007-20260929    gcc-14
i386                  randconfig-1008-20260929    gcc-14
i386                  randconfig-1009-20260929    gcc-14
i386                  randconfig-1010-20260929    gcc-14
i386                  randconfig-1011-20260929    gcc-14
i386                  randconfig-1012-20260929    gcc-14
i386                  randconfig-1013-20260929    gcc-14
i386                  randconfig-2100-20260929    clang-22   cocci
i386                  randconfig-2101-20260929    clang-22   cocci
i386                  randconfig-2102-20260929    clang-22   cocci
i386                  randconfig-2103-20260929    clang-22   cocci
i386                  randconfig-2200-20260929    gcc-14     smatch
i386                  randconfig-2300-20260929    gcc-14     sparse
i386                  randconfig-2301-20260929    gcc-14     sparse
i386                  randconfig-2302-20260929    gcc-14     sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260929    gcc-8.5.0
loongarch             randconfig-1001-20260929    gcc-8.5.0
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          amcore_defconfig    gcc-16.1.0
m68k                        bvme6000_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                             gpr_defconfig    gcc-16.1.0
mips                            ip30_defconfig    gcc-16.1.0
mips                       loongson3_defconfig    gcc-16.1.0
mips                       malta_kvm_defconfig    gcc-16.1.0
mips                 randconfig-r2202-20260929    gcc-12.5.0 smatch
mips                 randconfig-r2300-20260929    gcc-8.5.0  sparse
mips                 randconfig-r2308-20260929    gcc-11.5.0 sparse
nios2                          10m50_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260929    gcc-8.5.0
nios2                 randconfig-1001-20260929    gcc-8.5.0
nios2                randconfig-r2101-20260929    gcc-9.5.0  cocci
openrisc                          alldefconfig    gcc-16.1.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260929    gcc-8.5.0
parisc                randconfig-1001-20260929    gcc-8.5.0
parisc               randconfig-r2309-20260929    gcc-11.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                      akebono_defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                       chrp32_defconfig    gcc-16.1.0
powerpc                     gamecube_defconfig    gcc-16.1.0
powerpc                         icon_defconfig    gcc-16.1.0
powerpc                      ksi8560_defconfig    gcc-16.1.0
powerpc                    motionpro_defconfig    gcc-16.1.0
powerpc                  mpc837x_rdb_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260929    gcc-8.5.0
powerpc               randconfig-1001-20260929    gcc-8.5.0
powerpc              randconfig-r2102-20260929    gcc-16.1.0 cocci
powerpc              randconfig-r2201-20260929    gcc-10.5.0 smatch
powerpc              randconfig-r2202-20260929    clang-24   smatch
powerpc                     socrates_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260929    gcc-8.5.0
powerpc64             randconfig-1001-20260929    gcc-8.5.0
powerpc64            randconfig-r2104-20260929    gcc-15.2.0 cocci
powerpc64            randconfig-r2106-20260929    gcc-15.2.0 cocci
powerpc64            randconfig-r2307-20260929    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260929    clang-24
riscv                 randconfig-1001-20260929    clang-24
riscv                 randconfig-2000-20260929    gcc-11.5.0
riscv                 randconfig-2001-20260929    gcc-11.5.0
riscv                randconfig-r2100-20260929    gcc-16.1.0 cocci
riscv                randconfig-r2102-20260929    gcc-9.5.0  cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260929    clang-24
s390                  randconfig-1001-20260929    clang-24
s390                  randconfig-2000-20260929    gcc-11.5.0
s390                  randconfig-2001-20260929    gcc-11.5.0
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.1.0
sh                           kfr2r09_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260929    clang-24
sh                    randconfig-1001-20260929    clang-24
sh                    randconfig-2000-20260929    gcc-11.5.0
sh                    randconfig-2001-20260929    gcc-11.5.0
sh                   randconfig-r2201-20260929    gcc-16.1.0 smatch
sh                   randconfig-r2305-20260929    gcc-8.5.0  sparse
sh                            se7343_defconfig    gcc-16.1.0
sh                            se7705_defconfig    gcc-16.1.0
sh                            se7721_defconfig    gcc-16.1.0
sh                            se7722_defconfig    gcc-16.1.0
sh                    secureedge5410_defconfig    gcc-16.1.0
sh                            sh2007_defconfig    gcc-16.1.0
sh                         sh7757lcr_defconfig    gcc-16.1.0
sh                         sh7785lcr_defconfig    gcc-16.1.0
sh                              shx3_defconfig    gcc-16.1.0
sh                             titan_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260929    gcc-14
sparc                 randconfig-1001-20260929    gcc-14
sparc                 randconfig-2000-20260929    gcc-12.5.0
sparc                 randconfig-2001-20260929    gcc-12.5.0
sparc                randconfig-r2101-20260929    gcc-16.1.0 cocci
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260929    gcc-14
sparc64               randconfig-1001-20260929    gcc-14
sparc64               randconfig-2000-20260929    gcc-12.5.0
sparc64               randconfig-2001-20260929    gcc-12.5.0
sparc64              randconfig-r2103-20260929    gcc-9.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260929    gcc-14
um                    randconfig-1001-20260929    gcc-14
um                    randconfig-2000-20260929    gcc-12.5.0
um                    randconfig-2001-20260929    gcc-12.5.0
um                   randconfig-r2306-20260929    gcc-11.5.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260929    clang-22
x86_64      buildonly-randconfig-1001-20260929    clang-22
x86_64      buildonly-randconfig-1002-20260929    clang-22
x86_64      buildonly-randconfig-1003-20260929    clang-22
x86_64      buildonly-randconfig-1004-20260929    clang-22
x86_64      buildonly-randconfig-1005-20260929    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260929    clang-22
x86_64                randconfig-1001-20260929    clang-22
x86_64                randconfig-1002-20260929    clang-22
x86_64                randconfig-1003-20260929    clang-22
x86_64                randconfig-1004-20260929    clang-22
x86_64                randconfig-1005-20260929    clang-22
x86_64                randconfig-1006-20260929    gcc-13
x86_64                randconfig-1007-20260929    gcc-13
x86_64                randconfig-1008-20260929    gcc-13
x86_64                randconfig-1009-20260929    gcc-13
x86_64                randconfig-1010-20260929    gcc-13
x86_64                randconfig-1011-20260929    gcc-13
x86_64                randconfig-1012-20260929    clang-22
x86_64                randconfig-1013-20260929    clang-22
x86_64                randconfig-1014-20260929    clang-22
x86_64                randconfig-1015-20260929    clang-22
x86_64                randconfig-1016-20260929    clang-22
x86_64                randconfig-1017-20260929    clang-22
x86_64                randconfig-2100-20260929    clang-22   cocci
x86_64                randconfig-2101-20260929    clang-22   cocci
x86_64                randconfig-2102-20260929    clang-22   cocci
x86_64                randconfig-2103-20260929    clang-22   cocci
x86_64                randconfig-2200-20260929    clang-22   smatch
x86_64                randconfig-2300-20260929    gcc-14     sparse
x86_64                randconfig-2301-20260929    gcc-14     sparse
x86_64                randconfig-2302-20260929    gcc-14     sparse
x86_64               randconfig-r2302-20260929    gcc-8.5.0  sparse
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
xtensa                randconfig-1000-20260929    gcc-14
xtensa                randconfig-1001-20260929    gcc-14
xtensa                randconfig-2000-20260929    gcc-12.5.0
xtensa                randconfig-2001-20260929    gcc-12.5.0
xtensa               randconfig-r2105-20260929    gcc-15.2.0 cocci
xtensa               randconfig-r2301-20260929    gcc-8.5.0  sparse
xtensa               randconfig-r2304-20260929    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
