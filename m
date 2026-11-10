Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270830;
	b=gbiJBQrahUa+tMVImtKj54rNe9kUv1qkikRgnOUmR8E2S5/7rYWYXHEdavh96PmKzHhk
	 u5kwnB40okZIT/ZyxHOZUahgdHWInEfEQmKNN7ulsDEuRBHIgb3kwDXzD7B5mu1qUYW4S
	 s5bSQjI8W+FO/sweMmRN8fe3y6gjAhpjyUJhPUI1xBNabmCKy8Km0vPOppABZSSCA7auv
	 FVZWLcTUdXslPX7EG0zIz0y0Sc3yhdYrYpZONVql2n997cUg0kY1NnQwzajMgLEoKbVhE
	 Yh5l/fjNrqpcIrYi2zBRgeY9INPlKKzpif9AjsMbZiPuMMW19l2BVOLNVrZ+RAN9I8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270830;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SH4dA4YcRQWwJNWgn1bQfWy+P/5umYW/ztAuyr7N4yM=;
	b=vKB0IFPXeRsLR3SfLYbkLa2JfutxEPrKwI+Y3gYvtsB3Aj9bbxVgH+H7riC0b+43+4yS
	 IQhf5rZ/LidmKugPYvHVcmwdunHBSaaxR8YICxwdbnKmdfM6+RUp5eLoM89VL5HuMXEB3
	 6oOQFcxg+tkDEMSaGFtLYqZ9DKF9fi6sSxsBcmEL98+EcXmnQQ3kfj8Yr8cvPRA/zo8Vy
	 wLFrM5/Ms9HuxSXvO3JPOay5pui57D/R0cLx2DXpN2hy4EVEkYpiChvdj+qcMPe7xFJbs
	 ++WtRrSfoXzZyHvV23IhuhSRgE/tz5cU1W5hITOmIlySwXo2zPMa45VLthPYRGv8veg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aFLAL50i;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41062606A31C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Nov 2026 00:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41062606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aFLAL50i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794270830; x=1825806830;
  h=date:from:to:cc:subject:message-id;
  bh=PKkQvlfSU9z1ejvojHKGsHohBDw1d8uAwTgVfgBFP94=;
  b=aFLAL50ieh/Kg7wdcFuSmZOAF9d9IWoOaj2WroWXPY48cLCtJq8gWdoZ
   joHDZeA2cLxL65adjSvFsLM6SehvyxlnUHF/gAoAelGHst5H1MtUNX+4l
   K+fiI1INK01mP78262M7mmFDqbaTZQviqjzJNFliMY57hL7Vng3ZdZtqn
   c+s0NcPfkPiggFYf9nYqiYbF/rQWlkmbdBCYs6uWKZFf7F/wnUaBUmOjN
   EZjRVtepkXrhFmAq85r9FhLc6ODq8BPLL9J74bx5g1QNgoWPr7l/92Axk
   8otEkGvWnizsGggrUI/LKdlniqyguqZ03QvpSpReQggLqvF4otU9WFDfT
   Q==;
X-CSE-ConnectionGUID: KGZydA2kSvyMXW9WQUh5Eg==
X-CSE-MsgGUID: seac9z6NQJeppvn3kauD6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2899728"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2899728"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 16:33:49 -0800
X-CSE-ConnectionGUID: 1n9xLQMxRGOa8ek77+SkKA==
X-CSE-MsgGUID: e2vZtCUtS828B6P5oZ+XXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8333346"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2026 16:33:49 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQZo1-00000000vd7-31G9;
	Tue, 10 Nov 2026 00:33:45 +0000
Date: Tue, 10 Nov 2026 08:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 178130e825b05d096985ebc07dbae7457cd9a5df
Message-ID: <20261110083328.rrmjo17s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: 178130e825b05d096985ebc07dbae7457cd9a5df  Merge branch 'renesas-arm-defconfig-for-v7.5' into renesas-next

elapsed time: 828m

configs tested: 281
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261109    clang-24
arc                   randconfig-1000-20261110    gcc-10.5.0
arc                   randconfig-1001-20261109    clang-24
arc                   randconfig-1001-20261110    gcc-10.5.0
arc                            tb10x_defconfig    gcc-16.2.0
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    clang-17
arm                       integrator_defconfig    clang-17
arm                          lpc32xx_defconfig    clang-17
arm                             mmp2_defconfig    gcc-16.2.0
arm                         multi_v7_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261109    clang-24
arm                   randconfig-1000-20261110    gcc-10.5.0
arm                   randconfig-1001-20261109    clang-24
arm                   randconfig-1001-20261110    gcc-10.5.0
arm                   randconfig-1002-20261109    clang-24
arm                   randconfig-1002-20261110    gcc-10.5.0
arm                   randconfig-1003-20261109    clang-24
arm                   randconfig-1003-20261110    gcc-10.5.0
arm                           sp7021_defconfig    gcc-16.2.0
arm                          vf610m4_defconfig    clang-17
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261109    gcc-13.5.0
arm64                 randconfig-1000-20261110    gcc-12.5.0
arm64                 randconfig-1001-20261109    gcc-13.5.0
arm64                 randconfig-1001-20261110    gcc-12.5.0
arm64                 randconfig-1002-20261109    gcc-13.5.0
arm64                 randconfig-1002-20261110    gcc-12.5.0
arm64                 randconfig-1003-20261109    gcc-13.5.0
arm64                 randconfig-1003-20261110    gcc-12.5.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261109    gcc-13.5.0
csky                  randconfig-1000-20261110    gcc-12.5.0
csky                  randconfig-1001-20261109    gcc-13.5.0
csky                  randconfig-1001-20261110    gcc-12.5.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261109    clang-19
hexagon               randconfig-1000-20261110    clang-17
hexagon               randconfig-1001-20261109    clang-19
hexagon               randconfig-1001-20261110    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261109    clang-22
i386        buildonly-randconfig-1000-20261110    clang-22
i386        buildonly-randconfig-1001-20261109    clang-22
i386        buildonly-randconfig-1001-20261110    clang-22
i386        buildonly-randconfig-1002-20261109    clang-22
i386        buildonly-randconfig-1002-20261110    clang-22
i386        buildonly-randconfig-1003-20261109    clang-22
i386        buildonly-randconfig-1003-20261110    clang-22
i386        buildonly-randconfig-1004-20261109    clang-22
i386        buildonly-randconfig-1004-20261110    clang-22
i386        buildonly-randconfig-1005-20261109    clang-22
i386        buildonly-randconfig-1005-20261110    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261109    gcc-14
i386                  randconfig-1000-20261110    gcc-14
i386                  randconfig-1001-20261109    gcc-14
i386                  randconfig-1001-20261110    gcc-14
i386                  randconfig-1002-20261109    gcc-14
i386                  randconfig-1002-20261110    gcc-14
i386                  randconfig-1003-20261109    gcc-14
i386                  randconfig-1003-20261110    gcc-14
i386                  randconfig-1004-20261109    gcc-14
i386                  randconfig-1004-20261110    gcc-14
i386                  randconfig-1005-20261109    gcc-14
i386                  randconfig-1005-20261110    gcc-14
i386                  randconfig-1006-20261109    gcc-14
i386                  randconfig-1006-20261110    gcc-14
i386                  randconfig-1007-20261109    gcc-12
i386                  randconfig-1007-20261110    clang-22
i386                  randconfig-1008-20261109    gcc-12
i386                  randconfig-1008-20261110    clang-22
i386                  randconfig-1009-20261109    gcc-12
i386                  randconfig-1009-20261110    clang-22
i386                  randconfig-1010-20261109    gcc-12
i386                  randconfig-1010-20261110    clang-22
i386                  randconfig-1011-20261109    gcc-12
i386                  randconfig-1011-20261110    clang-22
i386                  randconfig-1012-20261109    gcc-12
i386                  randconfig-1012-20261110    clang-22
i386                  randconfig-1013-20261109    gcc-12
i386                  randconfig-1013-20261110    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261109    clang-19
loongarch             randconfig-1000-20261110    clang-17
loongarch             randconfig-1001-20261109    clang-19
loongarch             randconfig-1001-20261110    clang-17
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           amiga_defconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5307c3_defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   decstation_64_defconfig    gcc-16.2.0
mips                      eyeq6lplus_defconfig    gcc-16.2.0
mips                             gpr_defconfig    clang-24
mips                            ip27_defconfig    clang-17
mips                            jazz_defconfig    gcc-16.2.0
mips                      loongson2k_defconfig    gcc-16.2.0
mips                   maltasmvp_eva_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261109    clang-19
nios2                 randconfig-1000-20261110    clang-17
nios2                 randconfig-1001-20261109    clang-19
nios2                 randconfig-1001-20261110    clang-17
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261109    gcc-8.5.0
parisc                randconfig-1000-20261110    gcc-14.4.0
parisc                randconfig-1001-20261109    gcc-8.5.0
parisc                randconfig-1001-20261110    gcc-14.4.0
parisc64                          alldefconfig    gcc-16.2.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                           g5_defconfig    gcc-16.2.0
powerpc                     ge_imp3a_defconfig    gcc-16.2.0
powerpc                      kmeter1_defconfig    gcc-16.2.0
powerpc                      powernv_defconfig    clang-17
powerpc                      ppa8548_defconfig    clang-17
powerpc                        ppc64_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261109    gcc-8.5.0
powerpc               randconfig-1000-20261110    gcc-14.4.0
powerpc               randconfig-1001-20261109    gcc-8.5.0
powerpc               randconfig-1001-20261110    gcc-14.4.0
powerpc                         warp_defconfig    clang-17
powerpc                         warp_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261109    gcc-8.5.0
powerpc64             randconfig-1000-20261110    gcc-14.4.0
powerpc64             randconfig-1001-20261109    gcc-8.5.0
powerpc64             randconfig-1001-20261110    gcc-14.4.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261109    gcc-8.5.0
riscv                 randconfig-1000-20261110    clang-24
riscv                 randconfig-1001-20261109    gcc-8.5.0
riscv                 randconfig-1001-20261110    clang-24
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    clang-24
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261109    gcc-8.5.0
s390                  randconfig-1000-20261110    clang-24
s390                  randconfig-1001-20261109    gcc-8.5.0
s390                  randconfig-1001-20261110    clang-24
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                         apsh4ad0a_defconfig    clang-24
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261109    gcc-8.5.0
sh                    randconfig-1000-20261110    clang-24
sh                    randconfig-1001-20261109    gcc-8.5.0
sh                    randconfig-1001-20261110    clang-24
sh                           rsk7201_defconfig    clang-24
sh                            se7751_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261109    gcc-8.5.0
sparc                 randconfig-1000-20261110    gcc-12.5.0
sparc                 randconfig-1001-20261109    gcc-8.5.0
sparc                 randconfig-1001-20261110    gcc-12.5.0
sparc                        sparc32_defconfig    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261109    gcc-8.5.0
sparc64               randconfig-1000-20261110    gcc-12.5.0
sparc64               randconfig-1001-20261109    gcc-8.5.0
sparc64               randconfig-1001-20261110    gcc-12.5.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                              i386_defconfig    gcc-16.2.0
um                    randconfig-1000-20261109    gcc-8.5.0
um                    randconfig-1000-20261110    gcc-12.5.0
um                    randconfig-1001-20261109    gcc-8.5.0
um                    randconfig-1001-20261110    gcc-12.5.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261109    clang-22
x86_64      buildonly-randconfig-1000-20261110    gcc-14
x86_64      buildonly-randconfig-1001-20261109    clang-22
x86_64      buildonly-randconfig-1001-20261110    gcc-14
x86_64      buildonly-randconfig-1002-20261109    clang-22
x86_64      buildonly-randconfig-1002-20261110    gcc-14
x86_64      buildonly-randconfig-1003-20261109    clang-22
x86_64      buildonly-randconfig-1003-20261110    gcc-14
x86_64      buildonly-randconfig-1004-20261109    clang-22
x86_64      buildonly-randconfig-1004-20261110    gcc-14
x86_64      buildonly-randconfig-1005-20261109    clang-22
x86_64      buildonly-randconfig-1005-20261110    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261109    clang-22
x86_64                randconfig-1000-20261110    gcc-14
x86_64                randconfig-1001-20261109    clang-22
x86_64                randconfig-1001-20261110    gcc-14
x86_64                randconfig-1002-20261109    clang-22
x86_64                randconfig-1002-20261110    gcc-14
x86_64                randconfig-1003-20261109    clang-22
x86_64                randconfig-1003-20261110    gcc-14
x86_64                randconfig-1004-20261109    clang-22
x86_64                randconfig-1004-20261110    gcc-14
x86_64                randconfig-1005-20261109    clang-22
x86_64                randconfig-1005-20261110    gcc-14
x86_64                randconfig-1006-20261109    gcc-14
x86_64                randconfig-1006-20261110    gcc-14
x86_64                randconfig-1007-20261109    gcc-14
x86_64                randconfig-1007-20261110    gcc-14
x86_64                randconfig-1008-20261109    gcc-14
x86_64                randconfig-1008-20261110    gcc-14
x86_64                randconfig-1009-20261109    gcc-14
x86_64                randconfig-1009-20261110    gcc-14
x86_64                randconfig-1010-20261109    gcc-14
x86_64                randconfig-1010-20261110    gcc-14
x86_64                randconfig-1011-20261109    gcc-14
x86_64                randconfig-1011-20261110    gcc-14
x86_64                randconfig-1012-20261110    gcc-14
x86_64                randconfig-1013-20261110    gcc-14
x86_64                randconfig-1014-20261110    gcc-14
x86_64                randconfig-1015-20261110    gcc-14
x86_64                randconfig-1016-20261110    gcc-14
x86_64                randconfig-1017-20261110    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261109    gcc-8.5.0
xtensa                randconfig-1000-20261110    gcc-12.5.0
xtensa                randconfig-1001-20261109    gcc-8.5.0
xtensa                randconfig-1001-20261110    gcc-12.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
