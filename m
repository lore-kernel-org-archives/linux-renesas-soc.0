Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EE131E83A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2026 05:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264422; cv=none; b=lKbgwu4Ys8bi+LzHWP4pK74wmER5+ixpcDv6ujCIX+dMp94mgPq/sliWtaweiZOXZ784WFEeOr2ejV2bWhUbfmliGyu713ZF22+22UydqAF5FpnD4j5Tt329vxO9BoHVMB1fsOGWfLUh7k6zj8A62QwDFzRBVHDtmtELZGqOBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264422; c=relaxed/simple;
	bh=WyLeuxbzem/qXJm2mbofiNCs6iAnXOzePEef+JkmAlw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hZFiSW6WlXFkc9dI8//77bOsOObMH5BorHJyg/ptcgP8mkCSajyIqG+VdixwSHYv/mJr4KL2cZ7M2FGaPIEXGEimijzT2uI2pkgl80Fc/2blOo+qeEa2nr3jL75xZV47PaMbCY5cKhXLq2emntPilX72KU8cgSN5Bk0YMLKQ+/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xj8hfxwC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xj8hfxwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784264421; x=1815800421;
  h=date:from:to:cc:subject:message-id;
  bh=WyLeuxbzem/qXJm2mbofiNCs6iAnXOzePEef+JkmAlw=;
  b=Xj8hfxwCJ8h7P7z159pyPQ3qhm7SLHr8uZ0Rvba3yVExjaBXqG8O5cxE
   8GoN4ljdt+2sB9FvgtK/n5rJlZHbqcRTrm/Zy3J0k3/6BoDrAHnC7G86S
   Sfm5pXKKQiVpznhSy9sG71Pu6LfRsLjLSYXjSwkx0ti79zkGNpg5m1ijV
   pLqXqGQWN/B+xRhpAheGvYO+DK7YIq17eq+5qt7XSPwOXmjuat+3e1Gb/
   O0ua8FxrlB0JoaU36wGt9xAM6zloMcZRvDD/Ed7G1v39udtLWrHBKFym7
   d3gvz3i2/FytDxYjEUxLt8YsdPpgkZ6RNiCZae4y1nVGwwDgCPb/fnhWS
   g==;
X-CSE-ConnectionGUID: VaoFyKJ5TuuE0XWg4Sjv9w==
X-CSE-MsgGUID: Gz5pRiZkSCemgM4/WjX7iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84889274"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="84889274"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 22:00:21 -0700
X-CSE-ConnectionGUID: dounz5cjR220u6UMF1v5qA==
X-CSE-MsgGUID: GIO7IWeWTpifIavrgIaWNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="256141740"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 16 Jul 2026 22:00:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkagF-00000000SRQ-0eNL;
	Fri, 17 Jul 2026 05:00:12 +0000
Date: Fri, 17 Jul 2026 12:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 f9592c355314cb76e76078dfc58ea747e382ea15
Message-ID: <202607171205.GEiZFY7A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: f9592c355314cb76e76078dfc58ea747e382ea15  Merge branches 'renesas-arm-soc-for-v7.3', 'renesas-drivers-for-v7.3' and 'renesas-dts-for-v7.3' into renesas-next

elapsed time: 745m

configs tested: 81
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260717    gcc-11.5.0
arc                  randconfig-002-20260717    gcc-11.5.0
arm                  randconfig-001-20260717    gcc-11.5.0
arm                  randconfig-002-20260717    gcc-11.5.0
arm                  randconfig-003-20260717    gcc-11.5.0
arm                  randconfig-004-20260717    gcc-11.5.0
arm64                randconfig-001-20260717    gcc-13.4.0
arm64                randconfig-002-20260717    gcc-13.4.0
arm64                randconfig-003-20260717    gcc-13.4.0
arm64                randconfig-004-20260717    gcc-13.4.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260717    gcc-13.4.0
csky                 randconfig-002-20260717    gcc-13.4.0
hexagon              randconfig-001-20260717    gcc-16.1.0
hexagon              randconfig-002-20260717    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260717    gcc-14
i386       buildonly-randconfig-002-20260717    gcc-14
i386       buildonly-randconfig-003-20260717    gcc-14
i386       buildonly-randconfig-004-20260717    gcc-14
i386       buildonly-randconfig-005-20260717    gcc-14
i386       buildonly-randconfig-006-20260717    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260717    gcc-16.1.0
loongarch            randconfig-002-20260717    gcc-16.1.0
m68k                       mvme147_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260717    gcc-16.1.0
nios2                randconfig-002-20260717    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260717    gcc-11.5.0
parisc               randconfig-002-20260717    gcc-11.5.0
powerpc              randconfig-001-20260717    gcc-11.5.0
powerpc              randconfig-002-20260717    gcc-11.5.0
powerpc64            randconfig-001-20260717    gcc-11.5.0
powerpc64            randconfig-002-20260717    gcc-11.5.0
riscv                randconfig-001-20260717    clang-24
riscv                randconfig-002-20260717    clang-24
s390                 randconfig-001-20260717    clang-24
s390                 randconfig-002-20260717    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260717    clang-24
sh                   randconfig-002-20260717    clang-24
sparc                randconfig-001-20260717    gcc-8.5.0
sparc                randconfig-002-20260717    gcc-8.5.0
sparc64              randconfig-001-20260717    gcc-8.5.0
sparc64              randconfig-002-20260717    gcc-8.5.0
um                   randconfig-001-20260717    gcc-8.5.0
um                   randconfig-002-20260717    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260717    gcc-14
x86_64     buildonly-randconfig-002-20260717    gcc-14
x86_64     buildonly-randconfig-003-20260717    gcc-14
x86_64     buildonly-randconfig-004-20260717    gcc-14
x86_64               randconfig-001-20260717    gcc-14
x86_64               randconfig-002-20260717    gcc-14
x86_64               randconfig-003-20260717    gcc-14
x86_64               randconfig-004-20260717    gcc-14
x86_64               randconfig-005-20260717    gcc-14
x86_64               randconfig-006-20260717    gcc-14
x86_64               randconfig-011-20260717    gcc-12
x86_64               randconfig-012-20260717    gcc-12
x86_64               randconfig-013-20260717    gcc-12
x86_64               randconfig-014-20260717    gcc-12
x86_64               randconfig-015-20260717    gcc-12
x86_64               randconfig-016-20260717    gcc-12
x86_64               randconfig-071-20260717    clang-22
x86_64               randconfig-072-20260717    clang-22
x86_64               randconfig-073-20260717    clang-22
x86_64               randconfig-074-20260717    clang-22
x86_64               randconfig-075-20260717    clang-22
x86_64               randconfig-076-20260717    clang-22
xtensa               randconfig-001-20260717    gcc-8.5.0
xtensa               randconfig-002-20260717    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
