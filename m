Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31644D8DA1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 19:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044322; cv=none; b=M56NMY8cKqfyriMOOUDLYL31dc6ur+epIX4g281r4DwWmRUuPiWUqKdiOA2vLuVB3NLgHxCwWTv4qG6UXgD1LLEi7aIMTOpbDDWUUgO1rgv01900NU9fR8xAB6xBlnWGgUAQsqrxhJslTyRpHbcRgn9ALX95HcTfKCUTF2p47LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044322; c=relaxed/simple;
	bh=M3bz4prS6tnweCUUMozaNq84FwlaBerSlyBhcZWIutg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VoXiKtjS6C1xcIkmeWNyGWPuKew6M3b+Uxh+T6GcPVM39tcLdsCSfz5uoT14CCWAbOzvLQD0+9QoeuNRV7o+CLMq1mk0K5ziuTsmKLoUXugb1D3HUmgp5rQoVnajGc7ncX7d7jN59TWR/OvwXeT6K0zTsUUsnPGXMJQj4t4MtDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5Wn584q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5Wn584q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786044317; x=1817580317;
  h=date:from:to:cc:subject:message-id;
  bh=M3bz4prS6tnweCUUMozaNq84FwlaBerSlyBhcZWIutg=;
  b=M5Wn584qiIln+kXcBv4AP7d8ZeRK4dd+txwuJnkh3zXFYVuzkB/0MuGt
   B4F7+Dgcv8TvLQgsFcB2B762IA6qEjjv++37XknXA2F2f0yyUtEos9tU5
   R4QmtYw522U48PIjPj4+UfUZDVG6kKEX7UbzT1t/hMS4dt9fs9yeUs8bm
   UIoT+TIc5I2OleKzgrC8/Z4ZMIIB4Ju2sA6tTIWvZOfx8LId1GG6aZEoa
   ZkmKQjG4NcJXkq9SJfUiCNi1qMJu+x+s5JFlIdY5csvXeQJ9dyucZuECO
   6BTRLa3RUjE7fOza9JmdnbCiIZgM56ncwTW0V6dLvvCm1Ba2hUciPnrTB
   Q==;
X-CSE-ConnectionGUID: 6Mn3jLsoTtu4fgPfHyitjA==
X-CSE-MsgGUID: iIvw5gT5TSiXZUT2cRgslw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98160235"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="98160235"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 12:25:09 -0700
X-CSE-ConnectionGUID: cJoagab7RmuwMFkdkaZ5Lw==
X-CSE-MsgGUID: v5u9ksoPR5m1Ulv98aOp/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258866762"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2026 12:25:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws3iD-00000000G25-0aAU;
	Thu, 06 Aug 2026 19:25:05 +0000
Date: Fri, 07 Aug 2026 03:24:38 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:renesas-r8a78000-dt-binding-defs]
 BUILD SUCCESS 88656a46dfa3ecd0c878a0dc6916a1f399818334
Message-ID: <202608070325.vvGNPN2Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-r8a78000-dt-binding-defs
branch HEAD: 88656a46dfa3ecd0c878a0dc6916a1f399818334  dt-bindings: clock: Document Renesas R-Car X5H Clock Pulse Generator

elapsed time: 1641m

configs tested: 144
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                         axs101_defconfig    gcc-16.1.0
arc                  randconfig-001-20260806    gcc-11.5.0
arc                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-001-20260806    gcc-11.5.0
arm                  randconfig-002-20260806    gcc-11.5.0
arm                  randconfig-003-20260806    gcc-11.5.0
arm                  randconfig-004-20260806    gcc-11.5.0
arm64                randconfig-001-20260806    gcc-13.4.0
arm64                randconfig-001-20260807    gcc-16.1.0
arm64                randconfig-002-20260806    gcc-13.4.0
arm64                randconfig-002-20260807    gcc-16.1.0
arm64                randconfig-003-20260806    gcc-13.4.0
arm64                randconfig-003-20260807    gcc-16.1.0
arm64                randconfig-004-20260806    gcc-13.4.0
arm64                randconfig-004-20260807    gcc-16.1.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260806    gcc-13.4.0
csky                 randconfig-001-20260807    gcc-16.1.0
csky                 randconfig-002-20260806    gcc-13.4.0
csky                 randconfig-002-20260807    gcc-16.1.0
hexagon              randconfig-001-20260806    clang-24
hexagon              randconfig-001-20260807    clang-18
hexagon              randconfig-002-20260806    clang-24
hexagon              randconfig-002-20260807    clang-18
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260806    gcc-14
i386       buildonly-randconfig-002-20260806    gcc-14
i386       buildonly-randconfig-003-20260806    gcc-14
i386       buildonly-randconfig-004-20260806    gcc-14
i386       buildonly-randconfig-005-20260806    gcc-14
i386       buildonly-randconfig-006-20260806    gcc-14
i386                 randconfig-001-20260806    clang-22
i386                 randconfig-002-20260806    clang-22
i386                 randconfig-003-20260806    clang-22
i386                 randconfig-004-20260806    clang-22
i386                 randconfig-005-20260806    clang-22
i386                 randconfig-006-20260806    clang-22
i386                 randconfig-007-20260806    clang-22
i386                 randconfig-011-20260806    clang-22
i386                 randconfig-012-20260806    clang-22
i386                 randconfig-013-20260806    clang-22
i386                 randconfig-014-20260806    clang-22
i386                 randconfig-015-20260806    clang-22
i386                 randconfig-016-20260806    clang-22
i386                 randconfig-017-20260806    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260806    clang-24
loongarch            randconfig-001-20260807    clang-18
loongarch            randconfig-002-20260806    clang-24
loongarch            randconfig-002-20260807    clang-18
m68k                      m5208evb_defconfig    gcc-16.1.0
m68k                         sun3x_defconfig    gcc-16.1.0
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260806    clang-24
nios2                randconfig-001-20260807    clang-18
nios2                randconfig-002-20260806    clang-24
nios2                randconfig-002-20260807    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260806    gcc-8.5.0
parisc               randconfig-001-20260807    gcc-8.5.0
parisc               randconfig-002-20260806    gcc-8.5.0
parisc               randconfig-002-20260807    gcc-8.5.0
powerpc              randconfig-001-20260806    gcc-8.5.0
powerpc              randconfig-001-20260807    gcc-8.5.0
powerpc              randconfig-002-20260806    gcc-8.5.0
powerpc              randconfig-002-20260807    gcc-8.5.0
powerpc64            randconfig-001-20260806    gcc-8.5.0
powerpc64            randconfig-001-20260807    gcc-8.5.0
powerpc64            randconfig-002-20260806    gcc-8.5.0
powerpc64            randconfig-002-20260807    gcc-8.5.0
riscv                randconfig-001-20260806    gcc-13.4.0
riscv                randconfig-001-20260807    gcc-12.5.0
riscv                randconfig-002-20260806    gcc-13.4.0
riscv                randconfig-002-20260807    gcc-12.5.0
s390                 randconfig-001-20260806    gcc-13.4.0
s390                 randconfig-001-20260807    gcc-12.5.0
s390                 randconfig-002-20260806    gcc-13.4.0
s390                 randconfig-002-20260807    gcc-12.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260806    gcc-13.4.0
sh                   randconfig-001-20260807    gcc-12.5.0
sh                   randconfig-002-20260806    gcc-13.4.0
sh                   randconfig-002-20260807    gcc-12.5.0
sparc                         randconfig-001    gcc-8.5.0
sparc                randconfig-001-20260806    gcc-8.5.0
sparc                randconfig-002-20260806    gcc-8.5.0
sparc64              randconfig-001-20260806    gcc-8.5.0
sparc64              randconfig-002-20260806    gcc-8.5.0
um                   randconfig-001-20260806    gcc-8.5.0
um                   randconfig-002-20260806    gcc-8.5.0
x86_64     buildonly-randconfig-001-20260806    clang-22
x86_64     buildonly-randconfig-002-20260806    clang-22
x86_64     buildonly-randconfig-003-20260806    clang-22
x86_64     buildonly-randconfig-004-20260806    clang-22
x86_64     buildonly-randconfig-005-20260806    clang-22
x86_64     buildonly-randconfig-006-20260806    clang-22
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260806    clang-22
x86_64               randconfig-001-20260807    clang-22
x86_64               randconfig-002-20260806    clang-22
x86_64               randconfig-002-20260807    clang-22
x86_64               randconfig-003-20260806    clang-22
x86_64               randconfig-003-20260807    clang-22
x86_64               randconfig-004-20260806    clang-22
x86_64               randconfig-004-20260807    clang-22
x86_64               randconfig-005-20260806    clang-22
x86_64               randconfig-005-20260807    clang-22
x86_64               randconfig-006-20260806    clang-22
x86_64               randconfig-006-20260807    clang-22
x86_64               randconfig-011-20260806    clang-22
x86_64               randconfig-011-20260807    clang-22
x86_64               randconfig-012-20260806    clang-22
x86_64               randconfig-012-20260807    clang-22
x86_64               randconfig-013-20260806    clang-22
x86_64               randconfig-013-20260807    clang-22
x86_64               randconfig-014-20260806    clang-22
x86_64               randconfig-014-20260807    clang-22
x86_64               randconfig-015-20260806    clang-22
x86_64               randconfig-015-20260807    clang-22
x86_64               randconfig-016-20260806    clang-22
x86_64               randconfig-016-20260807    clang-22
x86_64               randconfig-071-20260806    gcc-14
x86_64               randconfig-071-20260807    clang-22
x86_64               randconfig-072-20260806    gcc-14
x86_64               randconfig-072-20260807    clang-22
x86_64               randconfig-073-20260806    gcc-14
x86_64               randconfig-073-20260807    clang-22
x86_64               randconfig-074-20260806    gcc-14
x86_64               randconfig-074-20260807    clang-22
x86_64               randconfig-075-20260806    gcc-14
x86_64               randconfig-075-20260807    clang-22
x86_64               randconfig-076-20260806    gcc-14
x86_64               randconfig-076-20260807    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260806    gcc-8.5.0
xtensa               randconfig-002-20260806    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
