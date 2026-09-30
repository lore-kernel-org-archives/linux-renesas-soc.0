Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80AD4FE2F2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781192; cv=none; b=SNCTZ7aFzPGUyCaZcDZtMN9u3m0k12T4gBO73CPluxWHr4G/mmJvt1F2sdHY8iaL3/2gm1ZDA9sH00HupnaW1/y+q3eL67oSk08EiZ62ijBbLJNahSTzI1tGoHVShTJHbqC+xY+m18+x1wZzHFBJsjy35xzlvtJGMF1gKlQP6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781192; c=relaxed/simple;
	bh=md32XDVoipxWTtwzwS2fMh/T0JCAC5/6wnfiKnV5Fto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=klKT4qID0OCVwQ3QprvjzJrGBeEHD+TuH8abCFxKpp84txTLiIcJazSqliKKdv2rIsQhAeKgRBunbk45MFoylb0TAiMIqXhfSmX/Dquto6pLZVI609DjF9I9f/61eiGtAXdmwoxNJteLdkQMzLfOLXRyv0ctES+Mh6WUnBisDxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esYRzyOh; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esYRzyOh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790781182; x=1822317182;
  h=date:from:to:cc:subject:message-id;
  bh=md32XDVoipxWTtwzwS2fMh/T0JCAC5/6wnfiKnV5Fto=;
  b=esYRzyOhxiZb2FXntQtwoVvvHiOqIv5KYUjbMLq5kIXt3KUFb9Xn8MZr
   MWUvAMnkL4EcHF0p91vuroxaeVXs8Z9anPFLolNKQfVTuiBNaziFKIoUd
   RFZ14yibr3bUm7yqv/yhlfi9Pm1Fuco3O9151Bo2nTSrKsps4MJ+JLXy5
   SWDgzNtjgi2myYPCwxwr70Er2qf5GWgcttHOKGz5FbB9v6jktTvMzROFT
   ekGbxrbrbXy2VykN6Ly8P/qvx4Qs0EnVLhE/rJMLfMv7jL51DI7zVSMAV
   p7Rrz53jhUrFl85oKXIzpLPJZxA2aOx8evd7+kOUdVSMRvdQkY4+Jchrt
   g==;
X-CSE-ConnectionGUID: jjwZ7ju8TROsuO3Vz77t/A==
X-CSE-MsgGUID: s+rx55D5St+PN2MAzvK9Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="94232969"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="94232969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 08:12:51 -0700
X-CSE-ConnectionGUID: HHBBbH4/R3Ga7QKsG8sv2Q==
X-CSE-MsgGUID: cY81IBngSjS6zEDbSgkseQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279508299"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 08:12:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBvzD-00000000Qn6-2kwL;
	Wed, 30 Sep 2026 15:12:47 +0000
Date: Wed, 30 Sep 2026 23:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.4] BUILD SUCCESS
 a251a759b52082627f2e78068560e29765de1ae7
Message-ID: <202609302312.Bw7bcBhY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.4
branch HEAD: a251a759b52082627f2e78068560e29765de1ae7  soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N

elapsed time: 1052m

configs tested: 355
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2103-20260930    clang-21   cocci
alpha                randconfig-r2106-20260930    gcc-9.5.0  cocci
alpha                randconfig-r2200-20260930    gcc-11.5.0 smatch
alpha                randconfig-r2302-20260929    gcc-12.5.0 sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                         nsim_700_defconfig    gcc-16.1.0
arc                   randconfig-1000-20260930    gcc-11.5.0
arc                   randconfig-1001-20260930    gcc-11.5.0
arc                  randconfig-r2101-20260930    gcc-16.1.0 cocci
arc                  randconfig-r2102-20260929    gcc-9.5.0  cocci
arc                  randconfig-r2102-20260930    gcc-16.1.0 cocci
arc                  randconfig-r2105-20260929    gcc-13.4.0 cocci
arc                  randconfig-r2301-20260930    clang-24   sparse
arc                  randconfig-r2302-20260929    gcc-8.5.0  sparse
arc                  randconfig-r2309-20260930    clang-24   sparse
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
arm                  randconfig-r2100-20260930    clang-21   cocci
arm                  randconfig-r2103-20260929    gcc-15.2.0 cocci
arm                  randconfig-r2106-20260929    gcc-10.5.0 cocci
arm                  randconfig-r2106-20260930    clang-21   cocci
arm                  randconfig-r2202-20260930    clang-17   smatch
arm                  randconfig-r2305-20260929    gcc-8.5.0  sparse
arm                  randconfig-r2306-20260930    clang-24   sparse
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
arm64                randconfig-r2104-20260930    gcc-9.5.0  cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20260930    gcc-16.1.0
csky                  randconfig-1001-20260930    gcc-16.1.0
csky                 randconfig-r2307-20260929    clang-22   sparse
csky                 randconfig-r2307-20260930    gcc-16.1.0 sparse
csky                 randconfig-r2309-20260929    clang-22   sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20260930    clang-24
hexagon               randconfig-1001-20260930    clang-24
hexagon              randconfig-r2103-20260930    gcc-16.1.0 cocci
hexagon              randconfig-r2306-20260929    gcc-9.5.0  sparse
hexagon              randconfig-r2308-20260930    clang-24   sparse
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
i386                  randconfig-2100-20260930    clang-22   cocci
i386                  randconfig-2101-20260929    clang-22   cocci
i386                  randconfig-2101-20260930    clang-22   cocci
i386                  randconfig-2102-20260929    clang-22   cocci
i386                  randconfig-2102-20260930    clang-22   cocci
i386                  randconfig-2103-20260929    clang-22   cocci
i386                  randconfig-2103-20260930    clang-22   cocci
i386                  randconfig-2200-20260929    gcc-14     smatch
i386                  randconfig-2200-20260930    gcc-14     smatch
i386                  randconfig-2300-20260929    gcc-14     sparse
i386                  randconfig-2300-20260930    gcc-13     sparse
i386                  randconfig-2301-20260929    gcc-14     sparse
i386                  randconfig-2301-20260930    gcc-13     sparse
i386                  randconfig-2302-20260929    gcc-14     sparse
i386                  randconfig-2302-20260930    gcc-13     sparse
i386                 randconfig-r2100-20260930    gcc-16.1.0 cocci
i386                 randconfig-r2102-20260930    gcc-16.1.0 cocci
i386                 randconfig-r2104-20260929    gcc-10.5.0 cocci
i386                 randconfig-r2107-20260930    gcc-11.5.0 cocci
i386                 randconfig-r2202-20260930    gcc-13     smatch
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
m68k                 randconfig-r2105-20260930    gcc-9.5.0  cocci
m68k                 randconfig-r2300-20260930    clang-24   sparse
m68k                 randconfig-r2304-20260929    gcc-8.5.0  sparse
m68k                 randconfig-r2305-20260929    gcc-12.5.0 sparse
m68k                 randconfig-r2306-20260929    clang-22   sparse
m68k                 randconfig-r2307-20260930    clang-24   sparse
m68k                            virt_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2200-20260930    gcc-11.5.0 smatch
microblaze           randconfig-r2300-20260929    gcc-8.5.0  sparse
microblaze           randconfig-r2306-20260930    gcc-16.1.0 sparse
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
mips                 randconfig-r2101-20260930    clang-21   cocci
mips                 randconfig-r2104-20260929    gcc-13.4.0 cocci
mips                 randconfig-r2308-20260930    clang-24   sparse
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20260930    clang-24
nios2                 randconfig-1001-20260930    clang-24
nios2                randconfig-r2101-20260930    gcc-16.1.0 cocci
nios2                randconfig-r2104-20260930    gcc-11.5.0 cocci
nios2                randconfig-r2202-20260929    gcc-10.5.0 smatch
nios2                randconfig-r2309-20260929    gcc-9.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20260929    gcc-9.5.0  cocci
openrisc             randconfig-r2100-20260930    gcc-16.1.0 cocci
openrisc             randconfig-r2102-20260930    clang-21   cocci
openrisc             randconfig-r2103-20260930    gcc-16.1.0 cocci
openrisc             randconfig-r2107-20260929    gcc-10.5.0 cocci
openrisc             randconfig-r2304-20260929    gcc-12.5.0 sparse
openrisc             randconfig-r2309-20260930    clang-24   sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20260930    gcc-8.5.0
parisc                randconfig-1001-20260930    gcc-8.5.0
parisc               randconfig-r2100-20260929    gcc-15.2.0 cocci
parisc               randconfig-r2101-20260929    gcc-9.5.0  cocci
parisc               randconfig-r2200-20260929    gcc-14.3.0 smatch
parisc               randconfig-r2201-20260930    gcc-16.1.0 smatch
parisc               randconfig-r2301-20260929    gcc-12.5.0 sparse
parisc               randconfig-r2303-20260929    gcc-12.5.0 sparse
parisc               randconfig-r2309-20260930    gcc-16.1.0 sparse
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
powerpc              randconfig-r2105-20260930    clang-21   cocci
powerpc              randconfig-r2106-20260930    gcc-11.5.0 cocci
powerpc              randconfig-r2201-20260929    gcc-10.5.0 smatch
powerpc              randconfig-r2201-20260930    gcc-14.3.0 smatch
powerpc              randconfig-r2202-20260930    gcc-8.5.0  smatch
powerpc              randconfig-r2302-20260930    clang-24   sparse
powerpc                      sequoia_defconfig    gcc-16.1.0
powerpc                      tqm8548_defconfig    gcc-16.1.0
powerpc64             randconfig-1000-20260930    gcc-8.5.0
powerpc64             randconfig-1001-20260930    gcc-8.5.0
powerpc64            randconfig-r2107-20260930    clang-21   cocci
powerpc64            randconfig-r2201-20260930    clang-24   smatch
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                     nommu_k210_defconfig    clang-24
riscv                     nommu_k210_defconfig    gcc-16.1.0
riscv                 randconfig-1000-20260930    gcc-16.1.0
riscv                 randconfig-1001-20260930    gcc-16.1.0
riscv                 randconfig-2000-20260929    gcc-11.5.0
riscv                 randconfig-2000-20260930    gcc-14.3.0
riscv                 randconfig-2001-20260929    gcc-11.5.0
riscv                 randconfig-2001-20260930    gcc-14.3.0
riscv                randconfig-r2101-20260929    gcc-15.2.0 cocci
riscv                randconfig-r2202-20260929    clang-24   smatch
riscv                randconfig-r2306-20260930    clang-24   sparse
riscv                randconfig-r2308-20260930    gcc-16.1.0 sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20260930    gcc-16.1.0
s390                  randconfig-1001-20260930    gcc-16.1.0
s390                  randconfig-2000-20260929    gcc-11.5.0
s390                  randconfig-2000-20260930    gcc-14.3.0
s390                  randconfig-2001-20260929    gcc-11.5.0
s390                  randconfig-2001-20260930    gcc-14.3.0
s390                 randconfig-r2105-20260929    gcc-10.5.0 cocci
s390                 randconfig-r2304-20260930    clang-24   sparse
s390                 randconfig-r2307-20260930    clang-24   sparse
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
sh                    randconfig-2000-20260930    gcc-14.3.0
sh                    randconfig-2001-20260929    gcc-11.5.0
sh                    randconfig-2001-20260930    gcc-14.3.0
sh                           urquell_defconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20260930    clang-22
sparc                 randconfig-1001-20260930    clang-22
sparc                 randconfig-2000-20260929    gcc-12.5.0
sparc                 randconfig-2000-20260930    gcc-10.5.0
sparc                 randconfig-2001-20260929    gcc-12.5.0
sparc                 randconfig-2001-20260930    gcc-10.5.0
sparc                randconfig-r2301-20260929    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20260930    clang-22
sparc64               randconfig-1001-20260930    clang-22
sparc64               randconfig-2000-20260929    gcc-12.5.0
sparc64               randconfig-2000-20260930    gcc-10.5.0
sparc64               randconfig-2001-20260929    gcc-12.5.0
sparc64               randconfig-2001-20260930    gcc-10.5.0
sparc64              randconfig-r2104-20260930    clang-21   cocci
sparc64              randconfig-r2200-20260930    gcc-10.5.0 smatch
sparc64              randconfig-r2300-20260929    gcc-12.5.0 sparse
sparc64              randconfig-r2303-20260929    gcc-8.5.0  sparse
sparc64              randconfig-r2303-20260930    clang-24   sparse
sparc64              randconfig-r2305-20260930    clang-24   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20260930    clang-22
um                    randconfig-1001-20260930    clang-22
um                    randconfig-2000-20260929    gcc-12.5.0
um                    randconfig-2000-20260930    gcc-10.5.0
um                    randconfig-2001-20260929    gcc-12.5.0
um                    randconfig-2001-20260930    gcc-10.5.0
um                            x86_64_defconfig    gcc-14
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
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
x86_64                randconfig-2100-20260930    clang-22   cocci
x86_64                randconfig-2101-20260929    clang-22   cocci
x86_64                randconfig-2101-20260930    clang-22   cocci
x86_64                randconfig-2102-20260929    clang-22   cocci
x86_64                randconfig-2102-20260930    clang-22   cocci
x86_64                randconfig-2103-20260929    clang-22   cocci
x86_64                randconfig-2103-20260930    clang-22   cocci
x86_64                randconfig-2200-20260929    clang-22   smatch
x86_64                randconfig-2200-20260930    gcc-14     smatch
x86_64                randconfig-2300-20260929    gcc-14     sparse
x86_64                randconfig-2300-20260930    gcc-13     sparse
x86_64                randconfig-2301-20260929    gcc-14     sparse
x86_64                randconfig-2301-20260930    gcc-13     sparse
x86_64                randconfig-2302-20260929    gcc-14     sparse
x86_64                randconfig-2302-20260930    gcc-13     sparse
x86_64               randconfig-r2107-20260929    gcc-13.4.0 cocci
x86_64               randconfig-r2107-20260930    gcc-9.5.0  cocci
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
xtensa                randconfig-2000-20260930    gcc-10.5.0
xtensa                randconfig-2001-20260929    gcc-12.5.0
xtensa                randconfig-2001-20260930    gcc-10.5.0
xtensa               randconfig-r2105-20260930    gcc-11.5.0 cocci
xtensa               randconfig-r2106-20260929    gcc-13.4.0 cocci
xtensa               randconfig-r2201-20260929    gcc-10.5.0 smatch
xtensa               randconfig-r2307-20260929    gcc-9.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
