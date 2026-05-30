Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166F424E4A1
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780104727; cv=none; b=K+jrz4svyiEJHkKIvV/ZIfIxr+OxY2ftj2cKcQrH6TMjGCxZtZWfb93UrK1/RYYSTcobFvyjs7EfBOyAvDVqlBLi8kfjrgKA45h6Fl21OBxbT0rqCHH240n4gORh+aFBxa3hcQlQnskcO1B7sifzim0gpxeuveOxWwcHaUrNvGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780104727; c=relaxed/simple;
	bh=KUT2r1+Z9j5fFX1oanGd0DIcvIuYAJk4MCmrPmmfFfI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nENiwHN/c+gGkyEmTIIXUrUxcVrkzFXSAroNCXSNxnSbldj8uuZvPCySnYu565tnLf4RJbdycLiM1J6g8hyn+N4Miu+ozttgzVg2w4WbH8rnaWetZUOLSUfyfM6nb7oYi+zuFaEKF1RG3PI1m3sV7uDqm3Qa/Wxa7OoBAQzytd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWpyOFRd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWpyOFRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780104725; x=1811640725;
  h=date:from:to:cc:subject:message-id;
  bh=KUT2r1+Z9j5fFX1oanGd0DIcvIuYAJk4MCmrPmmfFfI=;
  b=VWpyOFRdJu8oSuOGg/efSCAOYwGY1WAnqu/heKRMoD40Ce/TmcyTDKLa
   b4ldWwKj1A/sB5yOmYuZExXCSSDAIZiPP6G9MRHj8LfEevMcaa6MzlFnK
   D9/4bOzXm3EnAhaRHV0VgxKiLUSwkcrcf+pZ8OpHUDom6zreS0r25wJPI
   XC92iKmoOe2x3NheImcd1uqNohQ9AuiJ9eZVMQtcrg67eZyf4XCFwHrDg
   jeOR9V+8u92QEUmPO/1O5q29Kz4TylAO10D6ugN+4WL9cvVH5GqPqMLdn
   yfMmsQVVuXiunV4FrSVz5qDh1Mpt4srp4zadXG4B2QPiL+HuXiSE3OUvE
   A==;
X-CSE-ConnectionGUID: tcycIJmaT+yX0YeLsAMeJg==
X-CSE-MsgGUID: UrSffwMaSBqsD8e0hNAunw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="81072342"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="81072342"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 18:32:04 -0700
X-CSE-ConnectionGUID: M4lR7k7JTwqxYbHf4aGE3g==
X-CSE-MsgGUID: 0UUbfiPjQGOnJVBLxiIZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="239989782"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 May 2026 18:32:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT8YT-000000007t0-16RW;
	Sat, 30 May 2026 01:32:01 +0000
Date: Sat, 30 May 2026 09:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.2] BUILD SUCCESS
 7cfaa8b07aa76362dfe4640c79f0e436e1c7a0ae
Message-ID: <202605300957.zz9uFp6J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.2
branch HEAD: 7cfaa8b07aa76362dfe4640c79f0e436e1c7a0ae  arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

elapsed time: 738m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-15.2.0
arc                   randconfig-001-20260530    gcc-14.3.0
arc                   randconfig-002-20260530    gcc-14.3.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                                 defconfig    gcc-15.2.0
arm                   randconfig-001-20260530    gcc-14.3.0
arm                   randconfig-002-20260530    gcc-14.3.0
arm                   randconfig-003-20260530    gcc-14.3.0
arm                   randconfig-004-20260530    gcc-14.3.0
arm                             rpc_defconfig    clang-18
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260530    gcc-8.5.0
arm64                 randconfig-002-20260530    gcc-8.5.0
arm64                 randconfig-003-20260530    gcc-8.5.0
arm64                 randconfig-004-20260530    gcc-8.5.0
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260530    gcc-8.5.0
csky                  randconfig-002-20260530    gcc-8.5.0
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260530    clang-23
hexagon               randconfig-002-20260530    clang-23
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260530    clang-20
i386        buildonly-randconfig-002-20260530    clang-20
i386        buildonly-randconfig-003-20260530    clang-20
i386        buildonly-randconfig-004-20260530    clang-20
i386        buildonly-randconfig-005-20260530    clang-20
i386        buildonly-randconfig-006-20260530    clang-20
i386                                defconfig    gcc-15.2.0
i386                  randconfig-011-20260530    clang-20
i386                  randconfig-012-20260530    clang-20
i386                  randconfig-013-20260530    clang-20
i386                  randconfig-014-20260530    clang-20
i386                  randconfig-015-20260530    clang-20
i386                  randconfig-016-20260530    clang-20
i386                  randconfig-017-20260530    clang-20
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260530    clang-23
loongarch             randconfig-002-20260530    clang-23
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
nios2                            allmodconfig    clang-23
nios2                             allnoconfig    clang-23
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260530    clang-23
nios2                 randconfig-002-20260530    clang-23
openrisc                         allmodconfig    clang-23
openrisc                          allnoconfig    clang-23
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-23
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260530    gcc-8.5.0
parisc                randconfig-002-20260530    gcc-8.5.0
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-23
powerpc                     mpc83xx_defconfig    clang-23
powerpc               randconfig-001-20260530    gcc-8.5.0
powerpc               randconfig-002-20260530    gcc-8.5.0
powerpc64             randconfig-001-20260530    gcc-8.5.0
powerpc64             randconfig-002-20260530    gcc-8.5.0
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260530    gcc-12.5.0
riscv                 randconfig-002-20260530    gcc-12.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260530    gcc-12.5.0
s390                  randconfig-002-20260530    gcc-12.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-23
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                    randconfig-001-20260530    gcc-12.5.0
sh                    randconfig-002-20260530    gcc-12.5.0
sparc                             allnoconfig    clang-23
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260530    gcc-9.5.0
sparc                 randconfig-002-20260530    gcc-9.5.0
sparc64                          allmodconfig    clang-23
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260530    gcc-9.5.0
sparc64               randconfig-002-20260530    gcc-9.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260530    gcc-9.5.0
um                    randconfig-002-20260530    gcc-9.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260530    gcc-14
x86_64      buildonly-randconfig-002-20260530    gcc-14
x86_64      buildonly-randconfig-003-20260530    gcc-14
x86_64      buildonly-randconfig-004-20260530    gcc-14
x86_64      buildonly-randconfig-005-20260530    gcc-14
x86_64      buildonly-randconfig-006-20260530    gcc-14
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-071-20260530    gcc-14
x86_64                randconfig-072-20260530    gcc-14
x86_64                randconfig-073-20260530    gcc-14
x86_64                randconfig-074-20260530    gcc-14
x86_64                randconfig-075-20260530    gcc-14
x86_64                randconfig-076-20260530    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-23
xtensa                           allyesconfig    clang-23
xtensa                randconfig-001-20260530    gcc-9.5.0
xtensa                randconfig-002-20260530    gcc-9.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
