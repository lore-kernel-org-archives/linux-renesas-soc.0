Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A817D382374
	for <linux-renesas-soc@vger.kernel.org>; Sat,  8 Aug 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786208330; cv=none; b=Oazq976ypg8gCRjfrStaIWpm1071C6qHSseEhvTu21qnfTaIiQWS9PR9xpdw/AroP15pf6fruxdPhfT9MCqSHO3DUSWZOicZ5+W6ydNr2yawWxHkE6GVRpfPOBmM8rzDxYav8jqf7r10tX+C6QwJ29LVhJbq18a3xYb4ciYsy+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786208330; c=relaxed/simple;
	bh=U0+PMgONOov4w/UtuRzuKLdKCAcPa+dG+bXhO9ZKWXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jSC08wtAWGyf9AfmX5aqVxC+3X9/k1L0x0aMfRF4kukF8ClvfMYSGSB+433DrAD1giW1+E2JrpVLMHrdMV30dKUDuvexRdfzxa70eU994pZSuO2yT7ZizJN/WhBNnJiOfThQdH0lhZBvJbV3j6UAFYSRsQKDUwcK/8jgd7aFxZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5JP1wVz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5JP1wVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786208328; x=1817744328;
  h=date:from:to:cc:subject:message-id;
  bh=U0+PMgONOov4w/UtuRzuKLdKCAcPa+dG+bXhO9ZKWXQ=;
  b=l5JP1wVz9bCe3Saa30KdqN84m1vLT7Hu9p1IRmAAdrUHq06uzhGrboic
   IiHJPBIJipWq0YUr+5rpteBN/Kp0o6p2IgwQp6TnwgiQgdogV17Cw5AQp
   N5j4OyP/oXbiBcNmtvTkXcagJFYFRrPyd0juXmfIe2O+Tksvse6qGHyVO
   ruJWWgxumvye0j6ChVwjpTCqMIHEXPDKqwgqa2nOr/95tAKqq2wryl5yE
   i1BJVqMQPQ9kDrjyzoCq8xEt8WsJ8FfzqrepEd2UfOlzjqkTwhCPHx7Uy
   0Todfmx/542DdgQHAr6Ck90JrpXqH5J3Rq61sbhNsPgzQ6KevL8f29woE
   A==;
X-CSE-ConnectionGUID: fAflX+wrSJOWnDLXYVcp3A==
X-CSE-MsgGUID: cqEzYQoORBGuw6+zaWDf8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="112336141"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="112336141"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 09:58:47 -0700
X-CSE-ConnectionGUID: pKH/HLGjQ3awoJDWPxbs7w==
X-CSE-MsgGUID: Z4etcAGPQBOeab+tgqPo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="300874603"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Aug 2026 09:58:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wskNd-00000000KSD-28bI;
	Sat, 08 Aug 2026 16:58:41 +0000
Date: Sun, 09 Aug 2026 00:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-clk] BUILD SUCCESS
 0fb9083a6e56f688aeeccfc7ef7eeba586e57dc6
Message-ID: <202608090016.YKK3lyAy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-clk
branch HEAD: 0fb9083a6e56f688aeeccfc7ef7eeba586e57dc6  clk: renesas: Add R-Car X5H CPG driver

elapsed time: 2970m

configs tested: 189
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260807    gcc-14.3.0
arc                  randconfig-001-20260808    gcc-9.5.0
arc                  randconfig-002-20260807    gcc-14.3.0
arc                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-001-20260807    gcc-14.3.0
arm                  randconfig-001-20260808    gcc-9.5.0
arm                  randconfig-002-20260807    gcc-14.3.0
arm                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-003-20260807    gcc-14.3.0
arm                  randconfig-003-20260808    gcc-9.5.0
arm                  randconfig-004-20260807    gcc-14.3.0
arm                  randconfig-004-20260808    gcc-9.5.0
arm64                           alldefconfig    gcc-16.1.0
arm64                         randconfig-001    gcc-11.5.0
arm64                randconfig-001-20260807    gcc-16.1.0
arm64                randconfig-001-20260808    gcc-11.5.0
arm64                randconfig-002-20260807    gcc-16.1.0
arm64                randconfig-002-20260808    gcc-11.5.0
arm64                randconfig-003-20260807    gcc-16.1.0
arm64                randconfig-003-20260808    gcc-11.5.0
arm64                randconfig-004-20260807    gcc-16.1.0
arm64                randconfig-004-20260808    gcc-11.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260807    gcc-16.1.0
csky                 randconfig-001-20260808    gcc-11.5.0
csky                 randconfig-002-20260807    gcc-16.1.0
csky                 randconfig-002-20260808    gcc-11.5.0
hexagon              randconfig-001-20260807    clang-18
hexagon              randconfig-001-20260808    gcc-16.1.0
hexagon              randconfig-002-20260807    clang-18
hexagon              randconfig-002-20260808    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386                buildonly-randconfig-001    clang-22
i386       buildonly-randconfig-001-20260807    gcc-13
i386       buildonly-randconfig-001-20260808    clang-22
i386       buildonly-randconfig-002-20260807    gcc-13
i386       buildonly-randconfig-002-20260808    clang-22
i386       buildonly-randconfig-003-20260807    gcc-13
i386       buildonly-randconfig-003-20260808    clang-22
i386       buildonly-randconfig-004-20260807    gcc-13
i386       buildonly-randconfig-004-20260808    clang-22
i386       buildonly-randconfig-005-20260807    gcc-13
i386       buildonly-randconfig-005-20260808    clang-22
i386       buildonly-randconfig-006-20260807    gcc-13
i386       buildonly-randconfig-006-20260808    clang-22
i386                 randconfig-001-20260807    gcc-14
i386                 randconfig-001-20260808    clang-22
i386                 randconfig-002-20260807    gcc-14
i386                 randconfig-002-20260808    clang-22
i386                 randconfig-003-20260807    gcc-14
i386                 randconfig-003-20260808    clang-22
i386                 randconfig-004-20260807    gcc-14
i386                 randconfig-004-20260808    clang-22
i386                 randconfig-005-20260807    gcc-14
i386                 randconfig-005-20260808    clang-22
i386                 randconfig-006-20260807    gcc-14
i386                 randconfig-006-20260808    clang-22
i386                 randconfig-007-20260807    gcc-14
i386                 randconfig-007-20260808    clang-22
i386                 randconfig-011-20260807    clang-22
i386                 randconfig-011-20260808    clang-22
i386                 randconfig-012-20260807    clang-22
i386                 randconfig-012-20260808    clang-22
i386                 randconfig-013-20260807    clang-22
i386                 randconfig-013-20260808    clang-22
i386                 randconfig-014-20260807    clang-22
i386                 randconfig-014-20260808    clang-22
i386                 randconfig-015-20260807    clang-22
i386                 randconfig-015-20260808    clang-22
i386                 randconfig-016-20260807    clang-22
i386                 randconfig-016-20260808    clang-22
i386                 randconfig-017-20260807    clang-22
i386                 randconfig-017-20260808    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260807    clang-18
loongarch            randconfig-001-20260808    gcc-16.1.0
loongarch            randconfig-002-20260807    clang-18
loongarch            randconfig-002-20260808    gcc-16.1.0
m68k                      m5275evb_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260807    clang-18
nios2                randconfig-001-20260808    gcc-16.1.0
nios2                randconfig-002-20260807    clang-18
nios2                randconfig-002-20260808    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260807    gcc-8.5.0
parisc               randconfig-001-20260808    gcc-8.5.0
parisc               randconfig-002-20260807    gcc-8.5.0
parisc               randconfig-002-20260808    gcc-8.5.0
powerpc              randconfig-001-20260807    gcc-8.5.0
powerpc              randconfig-001-20260808    gcc-8.5.0
powerpc              randconfig-002-20260807    gcc-8.5.0
powerpc              randconfig-002-20260808    gcc-8.5.0
powerpc64            randconfig-001-20260807    gcc-8.5.0
powerpc64            randconfig-001-20260808    gcc-8.5.0
powerpc64            randconfig-002-20260807    gcc-8.5.0
powerpc64            randconfig-002-20260808    gcc-8.5.0
riscv                         randconfig-001    gcc-12.5.0
riscv                randconfig-001-20260807    gcc-12.5.0
riscv                randconfig-001-20260808    clang-24
riscv                randconfig-002-20260807    gcc-12.5.0
riscv                randconfig-002-20260808    clang-24
s390                 randconfig-001-20260807    gcc-12.5.0
s390                 randconfig-001-20260808    clang-24
s390                 randconfig-002-20260807    gcc-12.5.0
s390                 randconfig-002-20260808    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260807    gcc-12.5.0
sh                   randconfig-001-20260808    clang-24
sh                   randconfig-002-20260807    gcc-12.5.0
sh                   randconfig-002-20260808    clang-24
sparc                         randconfig-001    gcc-16.1.0
sparc                randconfig-001-20260807    gcc-16.1.0
sparc                randconfig-001-20260808    gcc-8.5.0
sparc                randconfig-002-20260807    gcc-16.1.0
sparc                randconfig-002-20260808    gcc-8.5.0
sparc64              randconfig-001-20260807    gcc-16.1.0
sparc64              randconfig-001-20260808    gcc-8.5.0
sparc64              randconfig-002-20260807    gcc-16.1.0
sparc64              randconfig-002-20260808    gcc-8.5.0
um                   randconfig-001-20260807    gcc-16.1.0
um                   randconfig-001-20260808    gcc-8.5.0
um                   randconfig-002-20260807    gcc-16.1.0
um                   randconfig-002-20260808    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260807    clang-22
x86_64     buildonly-randconfig-001-20260808    gcc-14
x86_64     buildonly-randconfig-002-20260807    clang-22
x86_64     buildonly-randconfig-002-20260808    gcc-14
x86_64     buildonly-randconfig-003-20260807    clang-22
x86_64     buildonly-randconfig-003-20260808    gcc-14
x86_64     buildonly-randconfig-004-20260807    clang-22
x86_64     buildonly-randconfig-004-20260808    gcc-14
x86_64     buildonly-randconfig-005-20260807    clang-22
x86_64     buildonly-randconfig-005-20260808    gcc-14
x86_64     buildonly-randconfig-006-20260807    clang-22
x86_64     buildonly-randconfig-006-20260808    gcc-14
x86_64                                 kexec    clang-22
x86_64                        randconfig-001    clang-22
x86_64               randconfig-001-20260807    clang-22
x86_64               randconfig-001-20260808    clang-22
x86_64               randconfig-002-20260807    clang-22
x86_64               randconfig-002-20260808    clang-22
x86_64               randconfig-003-20260807    clang-22
x86_64               randconfig-003-20260808    clang-22
x86_64               randconfig-004-20260807    clang-22
x86_64               randconfig-004-20260808    clang-22
x86_64               randconfig-005-20260807    clang-22
x86_64               randconfig-005-20260808    clang-22
x86_64               randconfig-006-20260807    clang-22
x86_64               randconfig-006-20260808    clang-22
x86_64               randconfig-011-20260807    clang-22
x86_64               randconfig-011-20260808    clang-22
x86_64               randconfig-012-20260807    clang-22
x86_64               randconfig-012-20260808    clang-22
x86_64               randconfig-013-20260807    clang-22
x86_64               randconfig-013-20260808    clang-22
x86_64               randconfig-014-20260807    clang-22
x86_64               randconfig-014-20260808    clang-22
x86_64               randconfig-015-20260807    clang-22
x86_64               randconfig-015-20260808    clang-22
x86_64               randconfig-016-20260807    clang-22
x86_64               randconfig-016-20260808    clang-22
x86_64                        randconfig-071    gcc-14
x86_64               randconfig-071-20260807    clang-22
x86_64               randconfig-071-20260808    gcc-14
x86_64               randconfig-072-20260807    clang-22
x86_64               randconfig-072-20260808    gcc-14
x86_64               randconfig-073-20260807    clang-22
x86_64               randconfig-073-20260808    gcc-14
x86_64               randconfig-074-20260807    clang-22
x86_64               randconfig-074-20260808    gcc-14
x86_64               randconfig-075-20260807    clang-22
x86_64               randconfig-075-20260808    gcc-14
x86_64               randconfig-076-20260807    clang-22
x86_64               randconfig-076-20260808    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa                 nommu_kc705_defconfig    gcc-16.1.0
xtensa               randconfig-001-20260807    gcc-16.1.0
xtensa               randconfig-001-20260808    gcc-8.5.0
xtensa               randconfig-002-20260807    gcc-16.1.0
xtensa               randconfig-002-20260808    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
