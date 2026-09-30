Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE665013AB
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781244; cv=none; b=bUQnOAY+YtE//L5irtrX1vW8jsavlM9i8slF1PebJsb1pjPKgXtRkR/FiwWmzE8L5wR5ULD0HgbhlVTz18oG9DMqNR9zCSFpP1WplqPHtS4HB+fbkh8OTVkZX57P69DyZ1XaHPMWVMH/5Cfx1QZbpgHiSCnhAzib9un+bjozl8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781244; c=relaxed/simple;
	bh=/A8c12yGiwRDfdDhD4bP0FZi2YoIEnoMjf3VHz9gef8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sQWeStMnoIH772liyF1aMlWDBLdYt7e8myzWwvc6xdD0yFpQtYGUHnVWJNtAC76t9UXEfKSqVZNXtGHqBpmF6oNfQbnDl/xHVUz9TZUhLnMq3TPMbBQdXhVD0vHitNS6iseIqMh7VISuPXkpG7oirTnZ7a9O3CWav2X7OtWZObU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfb4MSPX; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfb4MSPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790781237; x=1822317237;
  h=date:from:to:cc:subject:message-id;
  bh=/A8c12yGiwRDfdDhD4bP0FZi2YoIEnoMjf3VHz9gef8=;
  b=gfb4MSPXnUXgcZ2jlBKrwfDsQeXFOXFNamG3TKAcAggmeAA403UoeUmd
   0rJ7Yb/R/eK/XzvWNrUxsPNAheK5OZwVMfQc0iAKeHfs0TOjjLD17xxN9
   JkHUPFOa4e0/JFL0QjC8R2JtFaal8uJl7EFgj6TnlOesPqyphvc0oZj+i
   Vx8nMLIg1owA33Irzy35+CUvlM/qCG3x+2Z8yWupYsbbTYWepNg2DHC4J
   Rr5KqukoF6HxybRAkDe8mmiAdrWaf/NkxxMx0IATwAllN2PidhtLT0oCd
   nSoB2Auo7pWjzMjnqh3XuG209HjRrOfXU91Tc7fNHeoNUusdWu6wYguta
   g==;
X-CSE-ConnectionGUID: 7GOKpvlWRLWKpN5JP+Df+Q==
X-CSE-MsgGUID: xxSHepsaTTmqRQH6bgaysA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94233093"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="94233093"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 08:13:52 -0700
X-CSE-ConnectionGUID: RoO0h2NbQ2uX59jtrbyHVg==
X-CSE-MsgGUID: Vax/tpG2TOihZOUGvTuE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279508650"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 08:13:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBw0B-00000000QnG-3KLW;
	Wed, 30 Sep 2026 15:13:47 +0000
Date: Wed, 30 Sep 2026 23:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.4] BUILD SUCCESS
 c9bbb744bec0c9a24c3c5cec4d23b21ef1dfc1ee
Message-ID: <202609302313.7LzhkXaM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.4
branch HEAD: c9bbb744bec0c9a24c3c5cec4d23b21ef1dfc1ee  arm64: dts: renesas: Add support for solidrun rzg2ul som on hb-ripple

elapsed time: 1053m

configs tested: 273
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2302-20260929    gcc-12.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                         nsim_700_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260930    gcc-11.5.0
arc                   randconfig-1001-20260930    gcc-11.5.0
arc                  randconfig-r2102-20260929    gcc-9.5.0  cocci
arc                  randconfig-r2105-20260929    gcc-13.4.0 cocci
arc                  randconfig-r2302-20260929    gcc-8.5.0  sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             dove_defconfig    gcc-16.1.0
arm                       integrator_defconfig    clang-24
arm                             mmp2_defconfig    gcc-16.1.0
arm                         mvebu_v5_defconfig    gcc-16.1.0
arm                             qcom_defconfig    clang-24
arm                   randconfig-1000-20260930    gcc-11.5.0
arm                   randconfig-1001-20260930    gcc-11.5.0
arm                   randconfig-1002-20260930    gcc-11.5.0
arm                   randconfig-1003-20260930    gcc-11.5.0
arm                  randconfig-r2103-20260929    gcc-15.2.0 cocci
arm                  randconfig-r2106-20260929    gcc-10.5.0 cocci
arm                  randconfig-r2305-20260929    gcc-8.5.0  sparse
arm                  randconfig-r2308-20260929    gcc-9.5.0  sparse
arm                            sama5_defconfig    gcc-16.1.0
arm                         spear6xx_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260930    gcc-16.1.0
arm64                 randconfig-1001-20260930    gcc-16.1.0
arm64                 randconfig-1002-20260930    gcc-16.1.0
arm64                 randconfig-1003-20260930    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260930    gcc-16.1.0
csky                  randconfig-1001-20260930    gcc-16.1.0
csky                 randconfig-r2307-20260929    clang-22   sparse
csky                 randconfig-r2309-20260929    clang-22   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260930    clang-24
hexagon               randconfig-1001-20260930    clang-24
hexagon              randconfig-r2306-20260929    gcc-9.5.0  sparse
i386                              alldefconfig    gcc-16.1.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260930    gcc-14
i386        buildonly-randconfig-1001-20260930    gcc-14
i386        buildonly-randconfig-1002-20260930    gcc-14
i386        buildonly-randconfig-1003-20260930    gcc-14
i386        buildonly-randconfig-1004-20260930    gcc-14
i386        buildonly-randconfig-1005-20260930    gcc-14
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260930    gcc-14
i386                  randconfig-1001-20260930    gcc-14
i386                  randconfig-1002-20260930    gcc-14
i386                  randconfig-1003-20260930    gcc-14
i386                  randconfig-1004-20260930    gcc-14
i386                  randconfig-1005-20260930    gcc-14
i386                  randconfig-1006-20260930    gcc-14
i386                  randconfig-1007-20260930    clang-22
i386                  randconfig-1008-20260930    clang-22
i386                  randconfig-1009-20260930    clang-22
i386                  randconfig-1010-20260930    clang-22
i386                  randconfig-1011-20260930    clang-22
i386                  randconfig-1012-20260930    clang-22
i386                  randconfig-1013-20260930    clang-22
i386                  randconfig-2100-20260929    clang-22   cocci
i386                  randconfig-2101-20260929    clang-22   cocci
i386                  randconfig-2102-20260929    clang-22   cocci
i386                  randconfig-2103-20260929    clang-22   cocci
i386                  randconfig-2200-20260929    gcc-14     smatch
i386                  randconfig-2300-20260929    gcc-14     sparse
i386                  randconfig-2301-20260929    gcc-14     sparse
i386                  randconfig-2302-20260929    gcc-14     sparse
i386                 randconfig-r2104-20260929    gcc-10.5.0 cocci
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260930    clang-24
loongarch             randconfig-1001-20260930    clang-24
loongarch            randconfig-r2200-20260929    clang-24   smatch
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    clang-24
m68k                           atari_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                        m5475evb_defconfig    gcc-16.1.0
m68k                 randconfig-r2304-20260929    gcc-8.5.0  sparse
m68k                 randconfig-r2305-20260929    gcc-12.5.0 sparse
m68k                 randconfig-r2306-20260929    clang-22   sparse
m68k                            virt_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2300-20260929    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                         bcm63xx_defconfig    clang-24
mips                          bigsur_defconfig    gcc-16.1.0
mips                      loongson2k_defconfig    gcc-16.1.0
mips                           malta_defconfig    clang-24
mips                       maltasmvp_defconfig    gcc-16.1.0
mips                         qi_lb60_defconfig    clang-24
mips                         qi_lb60_defconfig    gcc-16.1.0
mips                 randconfig-r2104-20260929    gcc-13.4.0 cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260930    clang-24
nios2                 randconfig-1001-20260930    clang-24
nios2                randconfig-r2202-20260929    gcc-10.5.0 smatch
nios2                randconfig-r2309-20260929    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20260929    gcc-9.5.0  cocci
openrisc             randconfig-r2107-20260929    gcc-10.5.0 cocci
openrisc             randconfig-r2304-20260929    gcc-12.5.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260930    gcc-8.5.0
parisc                randconfig-1001-20260930    gcc-8.5.0
parisc               randconfig-r2100-20260929    gcc-15.2.0 cocci
parisc               randconfig-r2101-20260929    gcc-9.5.0  cocci
parisc               randconfig-r2200-20260929    gcc-14.3.0 smatch
parisc               randconfig-r2301-20260929    gcc-12.5.0 sparse
parisc               randconfig-r2303-20260929    gcc-12.5.0 sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.1.0
powerpc                         fsp2_defconfig    gcc-16.1.0
powerpc                       ppc64e_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260930    gcc-8.5.0
powerpc               randconfig-1001-20260930    gcc-8.5.0
powerpc              randconfig-r2102-20260929    gcc-15.2.0 cocci
powerpc              randconfig-r2103-20260929    gcc-9.5.0  cocci
powerpc              randconfig-r2201-20260929    gcc-10.5.0 smatch
powerpc                      sequoia_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260930    gcc-8.5.0
powerpc64             randconfig-1001-20260930    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_k210_defconfig    clang-24
riscv                     nommu_k210_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260930    gcc-16.1.0
riscv                 randconfig-1001-20260930    gcc-16.1.0
riscv                 randconfig-2000-20260929    gcc-11.5.0
riscv                 randconfig-2001-20260929    gcc-11.5.0
riscv                randconfig-r2101-20260929    gcc-15.2.0 cocci
riscv                randconfig-r2202-20260929    clang-24   smatch
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260930    gcc-16.1.0
s390                  randconfig-1001-20260930    gcc-16.1.0
s390                  randconfig-2000-20260929    gcc-11.5.0
s390                  randconfig-2001-20260929    gcc-11.5.0
s390                 randconfig-r2105-20260929    gcc-10.5.0 cocci
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7760_defconfig    clang-24
sh                              espt_defconfig    gcc-16.1.0
sh                             hp6xx_defconfig    gcc-16.1.0
sh                    randconfig-1000-20260930    gcc-16.1.0
sh                    randconfig-1001-20260930    gcc-16.1.0
sh                    randconfig-2000-20260929    gcc-11.5.0
sh                    randconfig-2001-20260929    gcc-11.5.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260930    clang-22
sparc                 randconfig-1001-20260930    clang-22
sparc                 randconfig-2000-20260929    gcc-12.5.0
sparc                 randconfig-2001-20260929    gcc-12.5.0
sparc                randconfig-r2301-20260929    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260930    clang-22
sparc64               randconfig-1001-20260930    clang-22
sparc64               randconfig-2000-20260929    gcc-12.5.0
sparc64               randconfig-2001-20260929    gcc-12.5.0
sparc64              randconfig-r2300-20260929    gcc-12.5.0 sparse
sparc64              randconfig-r2303-20260929    gcc-8.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260930    clang-22
um                    randconfig-1001-20260930    clang-22
um                    randconfig-2000-20260929    gcc-12.5.0
um                    randconfig-2001-20260929    gcc-12.5.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260930    clang-22
x86_64      buildonly-randconfig-1001-20260930    clang-22
x86_64      buildonly-randconfig-1002-20260930    clang-22
x86_64      buildonly-randconfig-1003-20260930    clang-22
x86_64      buildonly-randconfig-1004-20260930    clang-22
x86_64      buildonly-randconfig-1005-20260930    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260930    gcc-14
x86_64                randconfig-1001-20260930    gcc-14
x86_64                randconfig-1002-20260930    gcc-14
x86_64                randconfig-1003-20260930    gcc-14
x86_64                randconfig-1004-20260930    gcc-14
x86_64                randconfig-1005-20260930    gcc-14
x86_64                randconfig-1006-20260930    gcc-14
x86_64                randconfig-1007-20260930    gcc-14
x86_64                randconfig-1008-20260930    gcc-14
x86_64                randconfig-1009-20260930    gcc-14
x86_64                randconfig-1010-20260930    gcc-14
x86_64                randconfig-1011-20260930    gcc-14
x86_64                randconfig-1012-20260930    clang-22
x86_64                randconfig-1013-20260930    clang-22
x86_64                randconfig-1014-20260930    clang-22
x86_64                randconfig-1015-20260930    clang-22
x86_64                randconfig-1016-20260930    clang-22
x86_64                randconfig-1017-20260930    clang-22
x86_64                randconfig-2100-20260929    clang-22   cocci
x86_64                randconfig-2101-20260929    clang-22   cocci
x86_64                randconfig-2102-20260929    clang-22   cocci
x86_64                randconfig-2103-20260929    clang-22   cocci
x86_64                randconfig-2200-20260929    clang-22   smatch
x86_64                randconfig-2300-20260929    gcc-14     sparse
x86_64                randconfig-2301-20260929    gcc-14     sparse
x86_64                randconfig-2302-20260929    gcc-14     sparse
x86_64               randconfig-r2107-20260929    gcc-13.4.0 cocci
x86_64               randconfig-r2308-20260929    clang-22   sparse
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
xtensa                randconfig-1000-20260930    clang-22
xtensa                randconfig-1001-20260930    clang-22
xtensa                randconfig-2000-20260929    gcc-12.5.0
xtensa                randconfig-2001-20260929    gcc-12.5.0
xtensa               randconfig-r2106-20260929    gcc-13.4.0 cocci
xtensa               randconfig-r2201-20260929    gcc-10.5.0 smatch
xtensa               randconfig-r2307-20260929    gcc-9.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
