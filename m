Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FA02E888A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105225; cv=none; b=Alt7lZ6rH1s1PagXb/M87PDiEHWd2k6bIgyHSwmK8Pptz4LRQo8ZOxLOrgi/UIz9UFa7asJSuDXb6plggt9A/mfdIQiDkJ2xds2of9ceNBtgcm74QnmEaOIUx5seJAdBNl5Nve2hg0mRsOlg20EGkff+olhG1ZNjLBPcCrNr+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105225; c=relaxed/simple;
	bh=0s478C/R8FSwHKuMpFR2mxrzsoKDeGyO3JzZWVdlhAQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KU5WGALX/g1K5Wzx1U+1YT0Ou8yXyE63EM0RVoTiTmEoCcCpk7AK+jIQD4/AhQTEyyjIZWeWDyXTjCLZbO4I4qq1Muoq6i5X7TUyp90vygKQQs0GPOsVWecBHV8Yg80mp34Rh1IFDaZwCKUpoverSfmIFG0HwufJCwzNvzgCvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS18rYUL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS18rYUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787105222; x=1818641222;
  h=date:from:to:cc:subject:message-id;
  bh=0s478C/R8FSwHKuMpFR2mxrzsoKDeGyO3JzZWVdlhAQ=;
  b=WS18rYULEaTKYcOe0pQJOmxrsLl8A5e1Gf5XU7vXpgx2+7MJB7iQW+t2
   qyExi335AcenPlimYSLnZd/qwdR9rhTf/yyNo/g8hs4vy9d5IvCXscu1z
   /P0Tdr7kv0qJNQDOsHBtSiLgwHyDqpbGs2PveSNVntMIQybecSy9gr8CD
   mZ/VFgqTS1oTyrcQ7iC5HYzc18mZxeiJ06JWvLs5Nqh9cRcp2m0OA9s1K
   LHhTAKMBszROHiaQEV4aeFlaAS4RHFiCWSSJb9hqYng65cW5+nwTXN1rl
   nKhPaI6DZC/y4PcINgzQAv5pjbVO+SKlrj+aQ+SmbpsMiTTwPuYKwX75L
   w==;
X-CSE-ConnectionGUID: ul+HGJQeQJKteqLpVOJ8iQ==
X-CSE-MsgGUID: Xs0Ev07CTFu5Xcqzhn8pOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110393205"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="110393205"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 19:06:59 -0700
X-CSE-ConnectionGUID: nYpCS9BmTSmLeuhX0/Qetw==
X-CSE-MsgGUID: tzUERlp9Ra2A8MuBHVgEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259213297"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 19:06:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwVhe-00000000eo2-26Z7;
	Wed, 19 Aug 2026 02:06:54 +0000
Date: Wed, 19 Aug 2026 10:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:master] BUILD SUCCESS
 1f348bf770d2e7b7f094bfb51de338bbeac5837b
Message-ID: <202608191005.UL0lZTF7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git master
branch HEAD: 1f348bf770d2e7b7f094bfb51de338bbeac5837b  Merge branches 'renesas-drivers-for-v7.4' and 'renesas-dts-for-v7.4' into renesas-devel

elapsed time: 1734m

configs tested: 125
configs skipped: 6

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
