Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE1F47AF6D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334475; cv=none; b=EydMoxherkEvMuEpSsSe7UYyT0R4oMIYzD0JayCLcCLQ5FWH41p1x4Q0JZhMBrGM4rOPn3lKdhg9bWEdooTWVElsbaEHpasmE8taR4m54/2veHaXRT3FK6dMBSDGcCGn719By91CZ7SnBgyT0YTfmeVAsEzfc9919edI7I+9VU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334475; c=relaxed/simple;
	bh=biND6afqJHEtukDyNPDoTavhzKTQwi62LElgv3B8bIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYAYByG3366B7phzgj9SNP1nxfTqF5f8+RIDP+fTef1aiMCZoeCYZd2ciQaVR0nfmwEsrkSgsoBgizOF+PzutJ9K5roID9R3BJeoxDGAh2qTYAanIaS9MZZXhCONavniLveXRabq/XpYzse+RxSD25SuZVTtkUUdCrBiKCtWfqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+JhihnU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+JhihnU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334474; x=1821870474;
  h=date:from:to:cc:subject:message-id;
  bh=biND6afqJHEtukDyNPDoTavhzKTQwi62LElgv3B8bIo=;
  b=G+JhihnUFPDi2vZ2nQgI9AvUrononHfjePV60aMbVo0QvA9aijRxksz1
   l+w4agKhEqbV2CYX9qoKiUQayZdvbGUpZ4n3gwsptiyhM8eQG2CkzoNHT
   QS/pbM4maZKf8u+jAAyU2glwNLf9Bta2ViUv+si0nQxUkJXtW8J3vmJBz
   NqHPJOBx9YxWw/8GWGAHOPDZ6YK/Ccer4djpIKUZJUMJgJuNIEOIeWYK0
   OpAVK0FLYCpucRY+AVs/7WNV7T5jSFdy8FV/dze4ZRL97BjiAaooWe63C
   BZC9V1as+bERh3QtGzOKilMsxqkiXUA6pvAHmz47qgknx7w3wAbK6MTnJ
   Q==;
X-CSE-ConnectionGUID: IVacwIodTrakl0FHc45qFQ==
X-CSE-MsgGUID: jhqbCk6tSXmnYTYnYgDMag==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="107499784"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="107499784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:07:54 -0700
X-CSE-ConnectionGUID: HW3B3peuQXejwqAi1dVkbw==
X-CSE-MsgGUID: fhrZUa+sQPGGt4GzHajQjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272123326"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 04:07:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3mQ-00000000KUo-1LyF;
	Fri, 25 Sep 2026 11:07:50 +0000
Date: Fri, 25 Sep 2026 19:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.4] BUILD SUCCESS
 1401205dedd5b266c751302fd9c2a073bdf0d3f5
Message-ID: <202609251933.c9bLozKl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.4
branch HEAD: 1401205dedd5b266c751302fd9c2a073bdf0d3f5  soc: renesas: Enable SYSC driver for r8a774a3

elapsed time: 1133m

configs tested: 191
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-1000-20260925    clang-24
arc                   randconfig-1001-20260925    clang-24
arc                  randconfig-r1301-20260925    gcc-11.5.0 sparse
arc                            tb10x_defconfig    gcc-16.1.0
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                           pxa910_defconfig    gcc-16.1.0
arm                   randconfig-1000-20260925    clang-24
arm                   randconfig-1001-20260925    clang-24
arm                   randconfig-1002-20260925    clang-24
arm                   randconfig-1003-20260925    clang-24
arm                  randconfig-r1309-20260925    clang-22   sparse
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20260925    clang-24
arm64                 randconfig-1001-20260925    clang-24
arm64                 randconfig-1002-20260925    clang-24
arm64                 randconfig-1003-20260925    clang-24
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260925    clang-24
csky                  randconfig-1001-20260925    clang-24
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260925    gcc-9.5.0
hexagon               randconfig-1001-20260925    gcc-9.5.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20260925    clang-22
i386        buildonly-randconfig-1001-20260925    clang-22
i386        buildonly-randconfig-1002-20260925    clang-22
i386        buildonly-randconfig-1003-20260925    clang-22
i386        buildonly-randconfig-1004-20260925    clang-22
i386        buildonly-randconfig-1005-20260925    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20260925    clang-22
i386                  randconfig-1001-20260925    clang-22
i386                  randconfig-1002-20260925    clang-22
i386                  randconfig-1003-20260925    clang-22
i386                  randconfig-1004-20260925    clang-22
i386                  randconfig-1005-20260925    clang-22
i386                  randconfig-1006-20260925    clang-22
i386                  randconfig-1007-20260925    gcc-12
i386                  randconfig-1008-20260925    gcc-12
i386                  randconfig-1009-20260925    gcc-12
i386                  randconfig-1010-20260925    gcc-12
i386                  randconfig-1011-20260925    gcc-12
i386                  randconfig-1012-20260925    gcc-12
i386                  randconfig-1013-20260925    gcc-12
i386                  randconfig-1300-20260925    clang-22   sparse
i386                  randconfig-1301-20260925    clang-22   sparse
i386                  randconfig-1302-20260925    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20260925    gcc-9.5.0
loongarch             randconfig-1001-20260925    gcc-9.5.0
loongarch            randconfig-r1308-20260925    clang-22   sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r1304-20260925    gcc-11.5.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                        bmips_be_defconfig    gcc-16.1.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260925    gcc-9.5.0
nios2                 randconfig-1001-20260925    gcc-9.5.0
nios2                randconfig-r1302-20260925    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260925    clang-24
parisc                randconfig-1001-20260925    clang-24
parisc               randconfig-r1307-20260925    clang-22   sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                         fsp2_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20260925    clang-24
powerpc               randconfig-1001-20260925    clang-24
powerpc                     socrates_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260925    clang-24
powerpc64             randconfig-1001-20260925    clang-24
powerpc64            randconfig-r1303-20260925    gcc-11.5.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260925    clang-24
riscv                 randconfig-1001-20260925    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260925    clang-24
s390                  randconfig-1001-20260925    clang-24
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20260925    clang-24
sh                    randconfig-1001-20260925    clang-24
sh                            sh2007_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260925    gcc-12
sparc                 randconfig-1001-20260925    gcc-12
sparc                randconfig-r1300-20260925    gcc-11.5.0 sparse
sparc                randconfig-r1305-20260925    gcc-11.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260925    gcc-12
sparc64               randconfig-1001-20260925    gcc-12
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260925    gcc-12
um                    randconfig-1001-20260925    gcc-12
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20260925    clang-22
x86_64      buildonly-randconfig-1001-20260925    clang-22
x86_64      buildonly-randconfig-1002-20260925    clang-22
x86_64      buildonly-randconfig-1003-20260925    clang-22
x86_64      buildonly-randconfig-1004-20260925    clang-22
x86_64      buildonly-randconfig-1005-20260925    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20260925    gcc-14
x86_64                randconfig-1001-20260925    gcc-14
x86_64                randconfig-1002-20260925    gcc-14
x86_64                randconfig-1003-20260925    gcc-14
x86_64                randconfig-1004-20260925    gcc-14
x86_64                randconfig-1005-20260925    gcc-14
x86_64                randconfig-1006-20260925    clang-22
x86_64                randconfig-1007-20260925    clang-22
x86_64                randconfig-1008-20260925    clang-22
x86_64                randconfig-1009-20260925    clang-22
x86_64                randconfig-1010-20260925    clang-22
x86_64                randconfig-1011-20260925    clang-22
x86_64                randconfig-1012-20260925    clang-22
x86_64                randconfig-1013-20260925    clang-22
x86_64                randconfig-1014-20260925    clang-22
x86_64                randconfig-1015-20260925    clang-22
x86_64                randconfig-1016-20260925    clang-22
x86_64                randconfig-1017-20260925    clang-22
x86_64                randconfig-1300-20260925    clang-22   sparse
x86_64                randconfig-1301-20260925    clang-22   sparse
x86_64                randconfig-1302-20260925    clang-22   sparse
x86_64               randconfig-r1306-20260925    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   audio_kc705_defconfig    gcc-16.1.0
xtensa                randconfig-1000-20260925    gcc-12
xtensa                randconfig-1001-20260925    gcc-12
xtensa                     xip_kc705_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
