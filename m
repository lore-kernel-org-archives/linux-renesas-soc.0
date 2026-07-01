Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7543A1A3F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898715; cv=none; b=pSnanj/JsP2Rks83qOP3SCWKfoLXz7B0LL1juIQcf4f+TOrfn23TILT04tpQC/J22FSiirJV3Qnt2SGxZ5lgPHe87IznSaJY0omwxoL0MMUa11cn7KiVXH2VuafULlHzKRXnufX7pa6WdU0bnIYcFy8BzHgiwPz8EhyCI9ByKfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898715; c=relaxed/simple;
	bh=WeLJG2yQk1/+YspA4GPj4+yht+OUO385m5KhqWBf8nQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JMHsMoPJQKevi15OnHgA2PKCnbMy8KKJuoI/4awmgnhRSt5DMszVdTqix2KjB+PGrWX+3OSIWMolOZbqj7KPHO3wUdIcm7O600dG/YeHoCTqPZX2H8bniGv4bMZ9svJzKP+MwPmnH/tQm7rAcixZ5QyaHUVHRRPMnqicZ7Hgp3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9m8U8Un; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9m8U8Un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782898713; x=1814434713;
  h=date:from:to:cc:subject:message-id;
  bh=WeLJG2yQk1/+YspA4GPj4+yht+OUO385m5KhqWBf8nQ=;
  b=U9m8U8Ung5wjRHf6wnDhIRwj/aCOt7y/l+hfKYVhsqRUJ1N3YupYfte7
   efjkXjjp8WRa0uWCesrhSmdyWk496ANgWR1DTR1ILG3N1Ghl4Zr07jgn7
   2JhE8H23eSp9+XNTygDfCd218Gw3WtLp+sziO92tLZ62hhQj+AxbsLuvZ
   kJ3Y+cHRau0QZ2A9Le3jSbN1XZQ8HwvmOAfAQ4DFtPfSQGZQdbaHgc9Lp
   kl8nIyPmm/bo8PEzM+U2F8RGy6Ft34XZnv/r5jjA3UOGSQq9kuJoCNl+V
   ABFhVAbFgnpAZLCr2cJ3jkRbHLmvh/p2LVQOk2jA/HTHbOaXElZGinN8h
   g==;
X-CSE-ConnectionGUID: ZYvfe9YoSFmJzu+l6nfUhA==
X-CSE-MsgGUID: GiU+px9qTAu+IQhsMu+kGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94780781"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="94780781"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 02:38:33 -0700
X-CSE-ConnectionGUID: mldk/JCbTdCXD1g2hENLTg==
X-CSE-MsgGUID: lZ+Y3A6PSrmIbFM+F/C0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="248539515"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 02:38:31 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1werOm-0000000099r-0Cic;
	Wed, 01 Jul 2026 09:38:28 +0000
Date: Wed, 01 Jul 2026 17:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: 
 [geert-renesas-drivers:topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2-wip]
 BUILD SUCCESS 54a3673b07325beb8ff2d9b39c33cb8825479da0
Message-ID: <202607011714.P7XAchuO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/rcar-x5h-ironhide-scmi-cpg-mdlc-remapping-v2-wip
branch HEAD: 54a3673b07325beb8ff2d9b39c33cb8825479da0  arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties

elapsed time: 772m

configs tested: 296
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260701    gcc-12.5.0
arc                   randconfig-002-20260701    gcc-12.5.0
arc                   randconfig-002-20260701    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    clang-23
arm                                 defconfig    gcc-16.1.0
arm                   randconfig-001-20260701    gcc-10.5.0
arm                   randconfig-001-20260701    gcc-12.5.0
arm                   randconfig-002-20260701    clang-17
arm                   randconfig-002-20260701    gcc-12.5.0
arm                   randconfig-003-20260701    gcc-10.5.0
arm                   randconfig-003-20260701    gcc-12.5.0
arm                   randconfig-004-20260701    clang-23
arm                   randconfig-004-20260701    gcc-12.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260701    gcc-12.5.0
arm64                 randconfig-001-20260701    gcc-16.1.0
arm64                 randconfig-002-20260701    clang-17
arm64                 randconfig-002-20260701    gcc-12.5.0
arm64                 randconfig-003-20260701    gcc-12.5.0
arm64                 randconfig-004-20260701    clang-17
arm64                 randconfig-004-20260701    gcc-12.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260701    gcc-10.5.0
csky                  randconfig-001-20260701    gcc-12.5.0
csky                  randconfig-002-20260701    gcc-12.5.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    clang-23
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260701    clang-23
hexagon               randconfig-002-20260701    clang-17
hexagon               randconfig-002-20260701    clang-23
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260701    clang-22
i386        buildonly-randconfig-002-20260701    clang-22
i386        buildonly-randconfig-003-20260701    clang-22
i386        buildonly-randconfig-003-20260701    gcc-14
i386        buildonly-randconfig-004-20260701    clang-22
i386        buildonly-randconfig-004-20260701    gcc-13
i386        buildonly-randconfig-005-20260701    clang-22
i386        buildonly-randconfig-006-20260701    clang-22
i386                                defconfig    clang-22
i386                                defconfig    gcc-16.1.0
i386                           randconfig-001    clang-22
i386                  randconfig-001-20260701    clang-22
i386                           randconfig-002    clang-22
i386                           randconfig-002    gcc-14
i386                  randconfig-002-20260701    clang-22
i386                           randconfig-003    clang-22
i386                           randconfig-003    gcc-14
i386                  randconfig-003-20260701    clang-22
i386                  randconfig-003-20260701    gcc-14
i386                           randconfig-004    clang-22
i386                  randconfig-004-20260701    clang-22
i386                           randconfig-005    clang-22
i386                           randconfig-005    gcc-14
i386                  randconfig-005-20260701    clang-22
i386                           randconfig-006    clang-22
i386                           randconfig-006    gcc-14
i386                  randconfig-006-20260701    clang-22
i386                           randconfig-007    clang-22
i386                           randconfig-007    gcc-14
i386                  randconfig-007-20260701    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260701    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260701    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260701    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260701    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260701    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260701    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260701    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch                loongson32_defconfig    clang-18
loongarch             randconfig-001-20260701    clang-23
loongarch             randconfig-002-20260701    clang-19
loongarch             randconfig-002-20260701    clang-23
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                         db1xxx_defconfig    clang-23
mips                          rb532_defconfig    clang-23
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260701    clang-23
nios2                 randconfig-001-20260701    gcc-11.5.0
nios2                 randconfig-002-20260701    clang-23
nios2                 randconfig-002-20260701    gcc-8.5.0
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260701    clang-17
parisc                randconfig-002-20260701    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                     asp8347_defconfig    clang-23
powerpc               randconfig-001-20260701    clang-17
powerpc               randconfig-002-20260701    clang-17
powerpc64             randconfig-001-20260701    clang-17
powerpc64             randconfig-002-20260701    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-23
riscv                 randconfig-001-20260701    clang-17
riscv                 randconfig-001-20260701    clang-23
riscv                          randconfig-002    clang-23
riscv                 randconfig-002-20260701    clang-23
riscv                 randconfig-002-20260701    gcc-14.3.0
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    clang-18
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-23
s390                  randconfig-001-20260701    clang-23
s390                           randconfig-002    clang-23
s390                  randconfig-002-20260701    clang-23
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-16.1.0
sh                             randconfig-001    clang-23
sh                    randconfig-001-20260701    clang-23
sh                    randconfig-001-20260701    gcc-10.5.0
sh                             randconfig-002    clang-23
sh                    randconfig-002-20260701    clang-23
sh                    randconfig-002-20260701    gcc-16.1.0
sh                           se7206_defconfig    gcc-16.1.0
sh                   secureedge5410_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                          randconfig-001    gcc-13.4.0
sparc                 randconfig-001-20260701    gcc-13.4.0
sparc                 randconfig-001-20260701    gcc-8.5.0
sparc                          randconfig-002    gcc-13.4.0
sparc                 randconfig-002-20260701    gcc-13.4.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64                        randconfig-001    gcc-13.4.0
sparc64               randconfig-001-20260701    gcc-13.4.0
sparc64               randconfig-001-20260701    gcc-8.5.0
sparc64                        randconfig-002    gcc-13.4.0
sparc64               randconfig-002-20260701    gcc-13.4.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    clang-23
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                             randconfig-001    gcc-13.4.0
um                    randconfig-001-20260701    gcc-13.4.0
um                    randconfig-001-20260701    gcc-14
um                             randconfig-002    gcc-13.4.0
um                    randconfig-002-20260701    clang-23
um                    randconfig-002-20260701    gcc-13.4.0
um                           x86_64_defconfig    clang-23
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260701    clang-22
x86_64      buildonly-randconfig-001-20260701    gcc-14
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260701    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260701    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260701    clang-22
x86_64      buildonly-randconfig-004-20260701    gcc-14
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260701    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260701    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260701    clang-22
x86_64                randconfig-001-20260701    gcc-14
x86_64                randconfig-002-20260701    gcc-14
x86_64                randconfig-003-20260701    gcc-14
x86_64                randconfig-004-20260701    clang-22
x86_64                randconfig-004-20260701    gcc-14
x86_64                randconfig-005-20260701    gcc-14
x86_64                randconfig-006-20260701    gcc-14
x86_64                randconfig-011-20260701    clang-22
x86_64                randconfig-011-20260701    gcc-14
x86_64                randconfig-012-20260701    clang-22
x86_64                randconfig-012-20260701    gcc-14
x86_64                randconfig-013-20260701    gcc-14
x86_64                randconfig-014-20260701    clang-22
x86_64                randconfig-014-20260701    gcc-14
x86_64                randconfig-015-20260701    clang-22
x86_64                randconfig-015-20260701    gcc-14
x86_64                randconfig-016-20260701    clang-22
x86_64                randconfig-016-20260701    gcc-14
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260701    clang-22
x86_64                randconfig-071-20260701    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260701    gcc-13
x86_64                randconfig-072-20260701    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260701    clang-22
x86_64                randconfig-073-20260701    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260701    clang-22
x86_64                randconfig-074-20260701    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260701    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260701    clang-22
x86_64                randconfig-076-20260701    gcc-14
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                         randconfig-001    gcc-13.4.0
xtensa                randconfig-001-20260701    gcc-13.4.0
xtensa                randconfig-001-20260701    gcc-8.5.0
xtensa                         randconfig-002    gcc-13.4.0
xtensa                randconfig-002-20260701    gcc-13.4.0
xtensa                randconfig-002-20260701    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
