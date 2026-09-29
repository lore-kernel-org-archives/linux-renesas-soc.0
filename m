Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968BC544D64
	for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 17:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790704143; cv=none; b=fN3rkaE9tYe9UbiXtIwzFSYRktOBQXLc3k26YqKuhvk7S9x1Nhb8ES4YIsdFlywddzlUCrB6qddYbtE2expHFC0OfC4/X2ptqLUkbSJswhg0BzWNL3H7BFBCYJtLv1AHcUTDjEfZYZCqds34cqBRWucURAlCwMXNLA28I9Dswvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790704143; c=relaxed/simple;
	bh=t9EPheqgzHuC8mnTWing4TF7R7gj8ZM+JWJYW+RQ374=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KuWXAXObMHWa7pWboEWquz9LgOUXwXFU7p0gQpg/hgA+7ROvVMjYLfIeQxBM22LF7Diz+0EyTcnXMMCiCy4IW5bfpTwhbV+F8bblebJGCRV+xY8yIAJvGhwoRgcQ7RoCRD7swnSBftsvkq4E6ZF5CJuJpe8fpNJeX3wraDsGFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gylo0BHs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gylo0BHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790704141; x=1822240141;
  h=date:from:to:cc:subject:message-id;
  bh=t9EPheqgzHuC8mnTWing4TF7R7gj8ZM+JWJYW+RQ374=;
  b=gylo0BHsjBlHThxytBfQBPMeeJMSh4Ct9d9k7o/tG5/HNh+QDV2KGL/5
   vGDG3JazFRV0R0iIgiiwERoeEBHoKuCegzJZEhLa+hSrDShgH4yEz2xHP
   D9BjjKU8FATCfyAMw/x1SitXX3RP1HFtFFOkCgY5mcRjhlSFhAmnwxpwN
   NybAE40DF+80GjopT+DpWEOYwXNWnls+B362lgXZfXHkkx7SQNnBfHK5+
   Kc+Mup3BZY/oasALLZDsI2elU8f+TeF1FOQigLG5yj9LYgPxyle9qoSiZ
   4vYpiWfPr9Vx+0pob54sSqRk6zpFkUfX6muQDS70mrb8aYCXA3wPK7JAr
   A==;
X-CSE-ConnectionGUID: AhEV5c0ZRDGFRbwn8C37Sg==
X-CSE-MsgGUID: R/TEhr4ATHu+3vVfosyx6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="116961087"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="116961087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 10:49:01 -0700
X-CSE-ConnectionGUID: iLUr24dtSc6TVKvUaa8CpA==
X-CSE-MsgGUID: finiZkGpTy60Zw3ITk6qyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="273215038"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Sep 2026 10:48:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBbwn-00000000PaJ-1rZa;
	Tue, 29 Sep 2026 17:48:57 +0000
Date: Wed, 30 Sep 2026 01:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 dab5a1635b2a2d3cafd1c7e7c0377fe1c42bc499
Message-ID: <202609300117.w2MbYFcp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: dab5a1635b2a2d3cafd1c7e7c0377fe1c42bc499  Merge branch 'renesas-dts-for-v7.4' into renesas-next

elapsed time: 947m

configs tested: 275
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20260929    gcc-16.1.0 cocci
alpha                randconfig-r2104-20260929    gcc-11.5.0 cocci
alpha                randconfig-r2107-20260929    gcc-11.5.0 cocci
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
arm64                randconfig-r2306-20260929    clang-19   sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260929    clang-24
csky                  randconfig-1001-20260929    clang-24
csky                 randconfig-r2309-20260929    clang-19   sparse
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
nios2                randconfig-r2106-20260929    gcc-11.5.0 cocci
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
parisc               randconfig-r2105-20260929    gcc-11.5.0 cocci
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
s390                 randconfig-r2307-20260929    clang-19   sparse
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
sparc64              randconfig-r2308-20260929    clang-19   sparse
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
