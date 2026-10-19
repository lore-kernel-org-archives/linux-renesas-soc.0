Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3D1A5B9E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380011; cv=none; b=INqtRD+NeYuRzvpvjKv7E8JvmYgi/RX36v7nB1j9yWAuVoCpFzwLIDyiPJhXOgk2RU9HUUR6Oz1B1vsR8pGxNox2K2sekkhonB732cIlGS7Tl+a1JZ0Z+XDmOnWm7oD70z9V5HIiZ/82gEvo0ZM780WCxPcSNTeBKYGsUTg7PNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380011; c=relaxed/simple;
	bh=T2M7taRIjK/KN9OWDZI+hRbMiFTHxEjIeD2QG6jN8as=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BKnYUmTnW652TykMCzFcTPyE4ToCRFw3pnasDrzWQIYdjqZxp03BdGwixPIjr8qsyQsR032lpv1UQgCXZTxFgPR3EabliV4lWXdaNpSCH7N3Dr+yjZvOnsC0Z+MwxzAHfZSUYd8klGCOU+9yAGOPG4vmkO2u09fgr/MzWJfmpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZ21N8Yw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZ21N8Yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792380009; x=1823916009;
  h=date:from:to:cc:subject:message-id;
  bh=T2M7taRIjK/KN9OWDZI+hRbMiFTHxEjIeD2QG6jN8as=;
  b=VZ21N8Yw8c3GsJu1HWFm33+nhdsMiV1zHq1i6M5FKyJnCPGxE5+mWwyp
   CT6Gg/1eWZdNDAUZbUMJCb5VkeI6td0TSQ8Q0vXyVUyasBg+iz9Sdb77e
   mc31vKRgsi2cYTxJqTAoRNPZGqVWEFxqAht728vhB/J7J3eKxDUtd37Yy
   uk09kfhM7Rx6YeXgObFr4rlIFQ/aOv17teOXYZfPmJDqkcA827WYrsPhI
   37mkcu38ySYJWLoDln5JCLyA39hry10+vAcAdfEoQyRU7W/cTPBGw7oXb
   AxBM5pfzk6gyTuatm+KDgpnNYjNEAZpdx0rO4RQ+Or7p/xM3rjqKEnUxy
   A==;
X-CSE-ConnectionGUID: lLsjXrCLSieNt3xKIg4bRQ==
X-CSE-MsgGUID: x0HJVKkfRZyFbG+69K2uxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="963687"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="963687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 20:20:08 -0700
X-CSE-ConnectionGUID: 1NnNLZ8lRRe5VDC74Fotmg==
X-CSE-MsgGUID: 7tMwqzE1SUeDeT4KW5atSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2891154"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2026 20:20:06 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIduu-00000000LBO-0x6N;
	Mon, 19 Oct 2026 03:20:04 +0000
Date: Mon, 19 Oct 2026 11:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic:rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4]
 BUILD SUCCESS 6851f2a7fd6b27b19717c66c305017021840f955
Message-ID: <202610191142.S1Ue10PD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v4
branch HEAD: 6851f2a7fd6b27b19717c66c305017021840f955  --- R-Car X5H Ironhide pin control -------------------------------

elapsed time: 1297m

configs tested: 302
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                randconfig-r2306-20261017    gcc-9.5.0  sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261019    clang-21
arc                   randconfig-1001-20261019    clang-21
arc                   randconfig-2000-20261017    gcc-15.2.0
arc                   randconfig-2001-20261017    gcc-13.4.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261019    clang-21
arm                   randconfig-1001-20261019    clang-21
arm                   randconfig-1002-20261019    clang-21
arm                   randconfig-1003-20261019    clang-21
arm                   randconfig-2000-20261017    gcc-8.5.0
arm                   randconfig-2001-20261017    gcc-8.5.0
arm                  randconfig-r2202-20261017    clang-24   smatch
arm                  randconfig-r2305-20261017    gcc-8.5.0  sparse
arm                        spear13xx_defconfig    clang-24
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261019    clang-24
arm64                 randconfig-1001-20261019    clang-24
arm64                 randconfig-1002-20261019    clang-24
arm64                 randconfig-1003-20261019    clang-24
arm64                 randconfig-2000-20261017    clang-17
arm64                 randconfig-2001-20261017    gcc-10.5.0
arm64                randconfig-r2101-20261017    clang-24   cocci
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261019    clang-24
csky                  randconfig-1001-20261019    clang-24
csky                  randconfig-2000-20261017    gcc-15.2.0
csky                  randconfig-2001-20261017    gcc-9.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261019    clang-24
hexagon               randconfig-1001-20261019    clang-24
hexagon               randconfig-2000-20261017    clang-24
hexagon               randconfig-2001-20261017    clang-24
hexagon              randconfig-r2303-20261017    clang-24   sparse
i386                               allnoconfig    gcc-16.2.0
i386        buildonly-randconfig-1000-20261018    clang-22
i386        buildonly-randconfig-1000-20261019    clang-22
i386        buildonly-randconfig-1001-20261018    clang-22
i386        buildonly-randconfig-1001-20261019    clang-22
i386        buildonly-randconfig-1002-20261018    clang-22
i386        buildonly-randconfig-1002-20261019    clang-22
i386        buildonly-randconfig-1003-20261018    clang-22
i386        buildonly-randconfig-1003-20261019    clang-22
i386        buildonly-randconfig-1004-20261018    clang-22
i386        buildonly-randconfig-1004-20261019    clang-22
i386        buildonly-randconfig-1005-20261018    clang-22
i386        buildonly-randconfig-1005-20261019    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261019    clang-22
i386                  randconfig-1001-20261019    clang-22
i386                  randconfig-1002-20261019    clang-22
i386                  randconfig-1003-20261019    clang-22
i386                  randconfig-1004-20261019    clang-22
i386                  randconfig-1005-20261019    clang-22
i386                  randconfig-1006-20261019    clang-22
i386                  randconfig-1007-20261018    gcc-14
i386                  randconfig-1008-20261018    gcc-14
i386                  randconfig-1009-20261018    gcc-14
i386                  randconfig-1010-20261018    gcc-14
i386                  randconfig-1011-20261018    gcc-14
i386                  randconfig-1012-20261018    gcc-14
i386                  randconfig-1013-20261018    gcc-14
i386                  randconfig-2000-20261017    clang-22
i386                  randconfig-2001-20261017    clang-22
i386                  randconfig-2100-20261017    gcc-14     cocci
i386                  randconfig-2100-20261018    gcc-14     cocci
i386                  randconfig-2101-20261017    clang-22   cocci
i386                  randconfig-2101-20261018    gcc-14     cocci
i386                  randconfig-2102-20261017    clang-22   cocci
i386                  randconfig-2102-20261018    gcc-14     cocci
i386                  randconfig-2103-20261017    gcc-14     cocci
i386                  randconfig-2103-20261018    gcc-14     cocci
i386                  randconfig-2104-20261017    gcc-14     cocci
i386                  randconfig-2104-20261018    gcc-14     cocci
i386                  randconfig-2105-20261017    gcc-14     cocci
i386                  randconfig-2105-20261018    gcc-14     cocci
i386                  randconfig-2200-20261017    clang-22   smatch
i386                  randconfig-2300-20261017    clang-22   sparse
i386                  randconfig-2300-20261018    clang-22   sparse
i386                  randconfig-2301-20261017    clang-22   sparse
i386                  randconfig-2301-20261018    clang-22   sparse
i386                  randconfig-2302-20261017    gcc-14     sparse
i386                  randconfig-2302-20261018    clang-22   sparse
i386                 randconfig-r2100-20261017    clang-22   cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch                 loongson32_defconfig    clang-24
loongarch             randconfig-1000-20261019    clang-24
loongarch             randconfig-1001-20261019    clang-24
loongarch             randconfig-2000-20261017    clang-24
loongarch             randconfig-2001-20261017    clang-24
loongarch            randconfig-r2105-20261017    gcc-16.1.0 cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                             mac_defconfig    gcc-16.2.0
m68k                 randconfig-r2110-20261017    gcc-16.1.0 cocci
m68k                 randconfig-r2201-20261017    gcc-12.5.0 smatch
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2302-20261017    gcc-9.5.0  sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        rbtx49xx_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261019    clang-24
nios2                 randconfig-1001-20261019    clang-24
nios2                 randconfig-2000-20261017    gcc-11.5.0
nios2                 randconfig-2001-20261017    gcc-9.5.0
nios2                randconfig-r2309-20261017    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc             randconfig-r2304-20261017    gcc-10.5.0 sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261018    clang-24
parisc                randconfig-1000-20261019    gcc-8.5.0
parisc                randconfig-1001-20261018    clang-24
parisc                randconfig-1001-20261019    gcc-8.5.0
parisc                randconfig-2000-20261017    gcc-9.5.0
parisc                randconfig-2001-20261017    gcc-15.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                       cm5200_defconfig    clang-24
powerpc               randconfig-1000-20261018    clang-24
powerpc               randconfig-1000-20261019    gcc-8.5.0
powerpc               randconfig-1001-20261018    clang-24
powerpc               randconfig-1001-20261019    gcc-8.5.0
powerpc               randconfig-2000-20261017    clang-24
powerpc               randconfig-2001-20261017    gcc-16.1.0
powerpc              randconfig-r2311-20261017    gcc-11.5.0 sparse
powerpc                      tqm8548_defconfig    clang-24
powerpc64             randconfig-1000-20261018    clang-24
powerpc64             randconfig-1000-20261019    gcc-8.5.0
powerpc64             randconfig-1001-20261018    clang-24
powerpc64             randconfig-1001-20261019    gcc-8.5.0
powerpc64             randconfig-2000-20261017    gcc-8.5.0
powerpc64             randconfig-2001-20261017    clang-24
powerpc64            randconfig-r2104-20261017    clang-21   cocci
powerpc64            randconfig-r2200-20261017    gcc-11.5.0 smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261018    clang-17
riscv                 randconfig-1000-20261019    gcc-11.5.0
riscv                 randconfig-1001-20261018    clang-17
riscv                 randconfig-1001-20261019    gcc-11.5.0
riscv                 randconfig-2000-20261017    gcc-14.3.0
riscv                 randconfig-2001-20261017    gcc-12.5.0
riscv                randconfig-r2307-20261017    gcc-12.5.0 sparse
riscv                randconfig-r2310-20261017    gcc-9.5.0  sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261018    clang-17
s390                  randconfig-1000-20261019    gcc-11.5.0
s390                  randconfig-1001-20261018    clang-17
s390                  randconfig-1001-20261019    gcc-11.5.0
s390                  randconfig-2000-20261017    gcc-8.5.0
s390                  randconfig-2001-20261017    clang-21
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                           landisk_defconfig    clang-24
sh                           r7785rp_defconfig    clang-24
sh                    randconfig-1000-20261018    clang-17
sh                    randconfig-1000-20261019    gcc-11.5.0
sh                    randconfig-1001-20261018    clang-17
sh                    randconfig-1001-20261019    gcc-11.5.0
sh                    randconfig-2000-20261017    gcc-15.2.0
sh                    randconfig-2001-20261017    gcc-16.1.0
sh                           rsk7264_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    clang-24
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261019    clang-20
sparc                 randconfig-1001-20261019    clang-20
sparc                 randconfig-2000-20261017    gcc-15.2.0
sparc                 randconfig-2001-20261017    gcc-8.5.0
sparc                randconfig-r2108-20261017    gcc-15.2.0 cocci
sparc                randconfig-r2109-20261017    gcc-16.1.0 cocci
sparc                randconfig-r2300-20261017    gcc-13.4.0 sparse
sparc                        sparc64_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261019    clang-20
sparc64               randconfig-1001-20261019    clang-20
sparc64               randconfig-2000-20261017    clang-24
sparc64               randconfig-2001-20261017    clang-20
sparc64              randconfig-r2102-20261017    gcc-8.5.0  cocci
sparc64              randconfig-r2103-20261017    gcc-8.5.0  cocci
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261019    clang-20
um                    randconfig-1001-20261019    clang-20
um                    randconfig-2000-20261017    gcc-14
um                    randconfig-2001-20261017    gcc-14
um                   randconfig-r2106-20261017    gcc-14     cocci
um                   randconfig-r2301-20261017    gcc-14     sparse
um                   randconfig-r2308-20261017    clang-19   sparse
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64      buildonly-randconfig-1000-20261019    clang-22
x86_64      buildonly-randconfig-1001-20261019    clang-22
x86_64      buildonly-randconfig-1002-20261019    clang-22
x86_64      buildonly-randconfig-1003-20261019    clang-22
x86_64      buildonly-randconfig-1004-20261019    clang-22
x86_64      buildonly-randconfig-1005-20261019    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261018    clang-22
x86_64                randconfig-1001-20261018    clang-22
x86_64                randconfig-1002-20261018    clang-22
x86_64                randconfig-1003-20261018    clang-22
x86_64                randconfig-1004-20261018    clang-22
x86_64                randconfig-1005-20261018    clang-22
x86_64                randconfig-1006-20261018    clang-22
x86_64                randconfig-1007-20261018    clang-22
x86_64                randconfig-1008-20261018    clang-22
x86_64                randconfig-1009-20261018    clang-22
x86_64                randconfig-1010-20261018    clang-22
x86_64                randconfig-1011-20261018    clang-22
x86_64                randconfig-1012-20261019    gcc-14
x86_64                randconfig-1013-20261019    gcc-14
x86_64                randconfig-1014-20261019    gcc-14
x86_64                randconfig-1015-20261019    gcc-14
x86_64                randconfig-1016-20261019    gcc-14
x86_64                randconfig-1017-20261019    gcc-14
x86_64                randconfig-2000-20261017    clang-22
x86_64                randconfig-2001-20261017    clang-22
x86_64                randconfig-2100-20261017    clang-22   cocci
x86_64                randconfig-2100-20261018    clang-22   cocci
x86_64                randconfig-2101-20261017    gcc-14     cocci
x86_64                randconfig-2101-20261018    clang-22   cocci
x86_64                randconfig-2102-20261017    gcc-12     cocci
x86_64                randconfig-2102-20261018    clang-22   cocci
x86_64                randconfig-2103-20261017    clang-22   cocci
x86_64                randconfig-2103-20261018    clang-22   cocci
x86_64                randconfig-2104-20261017    clang-22   cocci
x86_64                randconfig-2104-20261018    clang-22   cocci
x86_64                randconfig-2105-20261017    clang-22   cocci
x86_64                randconfig-2105-20261018    clang-22   cocci
x86_64                randconfig-2200-20261017    clang-22   smatch
x86_64                randconfig-2300-20261017    gcc-14     sparse
x86_64                randconfig-2300-20261018    clang-22   sparse
x86_64                randconfig-2301-20261017    gcc-14     sparse
x86_64                randconfig-2301-20261018    clang-22   sparse
x86_64                randconfig-2302-20261017    clang-22   sparse
x86_64                randconfig-2302-20261018    clang-22   sparse
x86_64               randconfig-r2111-20261017    gcc-14     cocci
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
xtensa                randconfig-1000-20261019    clang-20
xtensa                randconfig-1001-20261019    clang-20
xtensa                randconfig-2000-20261017    gcc-13.4.0
xtensa                randconfig-2001-20261017    gcc-11.5.0
xtensa               randconfig-r2107-20261017    gcc-14.3.0 cocci
xtensa                          virt_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
