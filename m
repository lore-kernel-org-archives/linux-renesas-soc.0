Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22CA3515F6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 02:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105341; cv=none; b=Xdn9zuTKf735C9pDhVDePes4mMTmB4wQOdux4LgFsk2QChI+vaE/OPp2zL0TyYbD1TEz6UcOnhS2tv96mHactGtPUdHWyn25x7skYzXm+EFxiB1QOktZkA/XLwhgf79D1QIblS8eTIek+u6FDE3DmxUZYpFyLQCDNN4U1HAHiZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105341; c=relaxed/simple;
	bh=BJoGvQ8gdp8yiAPUl1PtS7GPnufX7jA7lhHT9z/Tpp4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oINUWf7AhRcIhFGAlkypryRKaYqD29UgempHVR3KF4v/MjjWUTGtNFuXTBzsfXOeKbkMyEKXiLnjDxmWCF5QpXWXD1T6LQX1p0HPqmLATUpxJ/CdavXCHJBLJ6Tcr/KPeHkZcP6/CEpxw5ZbOtLaS794IN/gazrfGlsu/VDyiuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enahT8dz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enahT8dz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787105340; x=1818641340;
  h=date:from:to:cc:subject:message-id;
  bh=BJoGvQ8gdp8yiAPUl1PtS7GPnufX7jA7lhHT9z/Tpp4=;
  b=enahT8dzcXUKTeKoQcSLtJIQgv5QFF5Sk0BffmioM9+zCGwLSN5QSEbH
   R63eNWcamqqOP3q1ujG+6puSlHPshEpy9VPQPGd8fSoQ4PbcaXecWz2iy
   kRBiOaEZ2sCb4iwwA2EHIf6ki5IEjNa028+4zWAAxB1oCeqxkVSRRVd/A
   sfgQ/R4SALKVgVmh+Ob6RP6+CP1l1W9dN+Uceu5RJvSuQBfUTxYENtp2R
   w6uL4X8FDA3Zuk2mGawduaE+n1dcb5GtDo6f6aU5PQcIuCrfEEdP4S7lw
   owKUwy0VJ45F6xs1srRgO9UhtGQpsqFJrhOIx+aD3xD0GirkrElulrWbI
   A==;
X-CSE-ConnectionGUID: P5BLTtS/SjiPU4GmYpbC+w==
X-CSE-MsgGUID: QPbrGHypTmSSzc7gI/RD5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91290199"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="91290199"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:09:00 -0700
X-CSE-ConnectionGUID: LuFKBnUCRCyccadjtig2BA==
X-CSE-MsgGUID: B3yc4sj9RmK92SGq7pVEeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261648496"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 19:08:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwVjb-00000000eoa-163b;
	Wed, 19 Aug 2026 02:08:55 +0000
Date: Wed, 19 Aug 2026 10:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:topic/renesas-defconfig] BUILD SUCCESS
 1fa4d26aea3c2672261ccc868117a8f801f8896a
Message-ID: <202608191054.Z7E8YO0V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git topic/renesas-defconfig
branch HEAD: 1fa4d26aea3c2672261ccc868117a8f801f8896a  Merge tag 'v7.2' into topic/renesas-defconfig

elapsed time: 1734m

configs tested: 125
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                           randconfig-001    gcc-10.5.0
arc                  randconfig-001-20260818    gcc-10.5.0
arc                  randconfig-001-20260819    gcc-11.5.0
arc                  randconfig-002-20260818    gcc-10.5.0
arc                  randconfig-002-20260819    gcc-11.5.0
arm                        at91_dt_defconfig    clang-17
arm                  randconfig-001-20260818    gcc-10.5.0
arm                  randconfig-001-20260819    gcc-11.5.0
arm                  randconfig-002-20260818    gcc-10.5.0
arm                  randconfig-002-20260819    gcc-11.5.0
arm                  randconfig-003-20260818    gcc-10.5.0
arm                  randconfig-003-20260819    gcc-11.5.0
arm                  randconfig-004-20260818    gcc-10.5.0
arm                  randconfig-004-20260819    gcc-11.5.0
arm64                         randconfig-001    gcc-14.3.0
arm64                randconfig-001-20260818    gcc-12.5.0
arm64                randconfig-001-20260818    gcc-14.3.0
arm64                randconfig-002-20260818    gcc-12.5.0
arm64                randconfig-002-20260818    gcc-14.3.0
arm64                randconfig-003-20260818    gcc-12.5.0
arm64                randconfig-003-20260818    gcc-14.3.0
arm64                randconfig-004-20260818    gcc-12.5.0
arm64                randconfig-004-20260818    gcc-14.3.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260818    gcc-12.5.0
csky                 randconfig-001-20260818    gcc-14.3.0
csky                 randconfig-002-20260818    gcc-12.5.0
csky                 randconfig-002-20260818    gcc-14.3.0
hexagon              randconfig-001-20260818    gcc-10.5.0
hexagon              randconfig-002-20260818    gcc-10.5.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260818    clang-22
i386       buildonly-randconfig-002-20260818    clang-22
i386       buildonly-randconfig-003-20260818    clang-22
i386       buildonly-randconfig-004-20260818    clang-22
i386       buildonly-randconfig-005-20260818    clang-22
i386       buildonly-randconfig-006-20260818    clang-22
i386                 randconfig-001-20260818    clang-22
i386                 randconfig-002-20260818    clang-22
i386                 randconfig-003-20260818    clang-22
i386                 randconfig-004-20260818    clang-22
i386                 randconfig-005-20260818    clang-22
i386                 randconfig-006-20260818    clang-22
i386                 randconfig-007-20260818    clang-22
i386                 randconfig-011-20260818    gcc-12
i386                 randconfig-012-20260818    gcc-12
i386                 randconfig-013-20260818    gcc-12
i386                 randconfig-014-20260818    gcc-12
i386                 randconfig-015-20260818    gcc-12
i386                 randconfig-016-20260818    gcc-12
i386                 randconfig-017-20260818    gcc-12
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260818    gcc-10.5.0
loongarch            randconfig-002-20260818    gcc-10.5.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260818    gcc-10.5.0
nios2                randconfig-002-20260818    gcc-10.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260818    clang-24
parisc               randconfig-002-20260818    clang-24
powerpc                        ps3_defconfig    gcc-16.1.0
powerpc              randconfig-001-20260818    clang-24
powerpc              randconfig-002-20260818    clang-24
powerpc64            randconfig-001-20260818    clang-24
powerpc64            randconfig-002-20260818    clang-24
riscv                         randconfig-001    clang-18
riscv                randconfig-001-20260818    clang-18
riscv                randconfig-002-20260818    clang-18
s390                 randconfig-001-20260818    clang-18
s390                 randconfig-002-20260818    clang-18
sh                                 defconfig    gcc-16.1.0
sh                kfr2r09-romimage_defconfig    gcc-16.1.0
sh                   randconfig-001-20260818    clang-18
sh                   randconfig-002-20260818    clang-18
sh                          se7619_defconfig    gcc-16.1.0
sparc                randconfig-001-20260818    gcc-11.5.0
sparc                randconfig-002-20260818    gcc-11.5.0
sparc64              randconfig-001-20260818    gcc-11.5.0
sparc64              randconfig-002-20260818    gcc-11.5.0
um                   randconfig-001-20260818    gcc-11.5.0
um                   randconfig-002-20260818    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260818    clang-22
x86_64     buildonly-randconfig-001-20260819    gcc-14
x86_64     buildonly-randconfig-002-20260818    clang-22
x86_64     buildonly-randconfig-002-20260819    gcc-14
x86_64     buildonly-randconfig-003-20260818    clang-22
x86_64     buildonly-randconfig-003-20260819    gcc-14
x86_64     buildonly-randconfig-004-20260818    clang-22
x86_64     buildonly-randconfig-004-20260819    gcc-14
x86_64     buildonly-randconfig-005-20260818    clang-22
x86_64     buildonly-randconfig-005-20260819    gcc-14
x86_64     buildonly-randconfig-006-20260818    clang-22
x86_64     buildonly-randconfig-006-20260819    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260818    clang-22
x86_64               randconfig-002-20260818    clang-22
x86_64               randconfig-003-20260818    clang-22
x86_64               randconfig-004-20260818    clang-22
x86_64               randconfig-005-20260818    clang-22
x86_64               randconfig-006-20260818    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260818    clang-22
x86_64               randconfig-012-20260818    clang-22
x86_64               randconfig-013-20260818    clang-22
x86_64               randconfig-014-20260818    clang-22
x86_64               randconfig-015-20260818    clang-22
x86_64               randconfig-016-20260818    clang-22
x86_64                        randconfig-071    gcc-13
x86_64               randconfig-071-20260818    gcc-13
x86_64               randconfig-072-20260818    gcc-13
x86_64               randconfig-073-20260818    gcc-13
x86_64               randconfig-074-20260818    gcc-13
x86_64               randconfig-075-20260818    gcc-13
x86_64               randconfig-076-20260818    gcc-13
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260818    gcc-11.5.0
xtensa               randconfig-002-20260818    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
