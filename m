Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DC20D4E9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Aug 2026 04:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681968; cv=none; b=VCGaVLlQ9PCQzoK9MbP5wYY8MhgQYp6WnU7bgdC97n19iAvO0aRkx5erOptTGukSMWDf7ls6DBCpNuOJxTd6nLbjgjpi75EwXDw7drzl0t67LfcRigUG2fA4+2s6WfhSPyeuJ/4wo7d9pDJGmFtfQmIhN880Ta++yxffXglIrp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681968; c=relaxed/simple;
	bh=eWJGlQQ4jpwKYUvVRUWxqCFvTUQfH7ir0sUa0SWygKU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eA4jmKIE9vHwFQwNo5gv6oXOg6qXFEwwDf+IuP/GUsY5IWhkvVeJwUiGZ0pUP1tNqajM1h8HnA8x7u+JBSiWTBmE3iRCuX2U3RA2n0hrjXBEhpYQnm4okCSC2uMcdTQ5sUyfUmFftXCtWfQiRch9tDN9/HJrrFSyQeZMIxVuY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExqAXD/g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExqAXD/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786681966; x=1818217966;
  h=date:from:to:cc:subject:message-id;
  bh=eWJGlQQ4jpwKYUvVRUWxqCFvTUQfH7ir0sUa0SWygKU=;
  b=ExqAXD/gFO5ApGXb6N7LBEKH6SCsp/lZzk6EZNA7+wdC2WDMAxLGb3G8
   ECTZ+UBckLJNfeqKeWQ0zw/tEc2e6bWbs7GP+WFbmhbGkVdLxBqMVz0ht
   PntblwKHy8JAGFLHfFEIKcrPptHhMV76TPkvV7DQ4PSvJqtuxNYwG9cfT
   8ZMxV7ent3VBOizeJj0pbsAFpc7V6TC1Dn0bR5RsnR6o33Vs3cdUXJzxt
   wTvNk28xTVbaa2qE5fZgximSv+ashn/gD/zFocvPP0LdmLT6v413LO7Dy
   gXnLnP3FGpLwEt+2a1bIvU3SBgMv9waMInRu72Z4heMYniuThzgxm3Ypd
   Q==;
X-CSE-ConnectionGUID: nCaVP5pJTEGR0iK+JOY2CQ==
X-CSE-MsgGUID: 8EFLx11/Qsy4a74EYCXYMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86381534"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="86381534"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 21:32:46 -0700
X-CSE-ConnectionGUID: Ob7dDs0sRHymKHx7kpOV9g==
X-CSE-MsgGUID: NcAaK/qWRgmD1l4kjpEVUg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2026 21:32:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wujb0-00000000Xhu-2GEl;
	Fri, 14 Aug 2026 04:32:42 +0000
Date: Fri, 14 Aug 2026 12:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-drivers-for-v7.4] BUILD SUCCESS
 218b5c89e3ca4b352537758c9b0f032e7df38f7c
Message-ID: <202608141227.2XBXNyS6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-drivers-for-v7.4
branch HEAD: 218b5c89e3ca4b352537758c9b0f032e7df38f7c  soc: renesas: Expand MFIS acronym in RCAR_MFIS help description

elapsed time: 1302m

configs tested: 79
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260814    gcc-10.5.0
arc                  randconfig-002-20260814    gcc-12.5.0
arm                  randconfig-001-20260814    gcc-16.1.0
arm                  randconfig-002-20260814    gcc-10.5.0
arm                  randconfig-003-20260814    gcc-16.1.0
arm                  randconfig-004-20260814    clang-17
arm64                randconfig-001-20260814    gcc-10.5.0
arm64                randconfig-002-20260814    clang-24
arm64                randconfig-003-20260814    clang-19
arm64                randconfig-004-20260814    clang-17
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260814    gcc-16.1.0
csky                 randconfig-002-20260814    gcc-10.5.0
hexagon                       randconfig-001    clang-17
hexagon              randconfig-001-20260814    clang-17
hexagon              randconfig-002-20260814    clang-19
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260814    clang-22
i386       buildonly-randconfig-002-20260814    gcc-13
i386       buildonly-randconfig-003-20260814    clang-22
i386       buildonly-randconfig-004-20260814    clang-22
i386       buildonly-randconfig-005-20260814    gcc-13
i386       buildonly-randconfig-006-20260814    gcc-14
i386                 randconfig-011-20260814    gcc-14
i386                 randconfig-012-20260814    gcc-12
i386                 randconfig-013-20260814    gcc-12
i386                 randconfig-014-20260814    gcc-14
i386                 randconfig-015-20260814    gcc-12
i386                 randconfig-016-20260814    gcc-14
i386                 randconfig-017-20260814    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260814    gcc-16.1.0
loongarch            randconfig-002-20260814    clang-24
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260814    gcc-11.5.0
nios2                randconfig-002-20260814    gcc-11.5.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc                        randconfig-001    gcc-8.5.0
parisc               randconfig-001-20260814    gcc-15.2.0
parisc               randconfig-002-20260814    gcc-9.5.0
powerpc              randconfig-001-20260814    gcc-8.5.0
powerpc              randconfig-002-20260814    clang-18
powerpc64            randconfig-001-20260814    gcc-14.3.0
powerpc64            randconfig-002-20260814    gcc-8.5.0
riscv                randconfig-001-20260814    gcc-14.3.0
riscv                randconfig-002-20260814    clang-24
s390                 randconfig-001-20260814    gcc-11.5.0
s390                 randconfig-002-20260814    gcc-13.4.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260814    gcc-16.1.0
sh                   randconfig-002-20260814    gcc-16.1.0
sparc                randconfig-001-20260814    gcc-16.1.0
sparc                randconfig-002-20260814    gcc-15.2.0
sparc64              randconfig-001-20260814    gcc-8.5.0
sparc64              randconfig-002-20260814    clang-24
um                   randconfig-001-20260814    gcc-14
um                   randconfig-002-20260814    clang-22
x86_64     buildonly-randconfig-001-20260814    clang-22
x86_64     buildonly-randconfig-002-20260814    clang-22
x86_64     buildonly-randconfig-003-20260814    clang-22
x86_64     buildonly-randconfig-004-20260814    clang-22
x86_64     buildonly-randconfig-005-20260814    clang-22
x86_64     buildonly-randconfig-006-20260814    gcc-14
x86_64               randconfig-011-20260814    clang-22
x86_64               randconfig-012-20260814    gcc-13
x86_64               randconfig-013-20260814    clang-22
x86_64               randconfig-014-20260814    gcc-14
x86_64               randconfig-015-20260814    gcc-14
x86_64               randconfig-016-20260814    clang-22
xtensa               randconfig-001-20260814    gcc-9.5.0
xtensa               randconfig-002-20260814    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
