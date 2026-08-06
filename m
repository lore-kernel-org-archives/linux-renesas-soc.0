Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E493B5E19
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030147; cv=none; b=kQvRAJJQJUiqK4ZSDdWf+R5a5FQGgrialzi0Je3FaTiBafNcCpzAtRnMHPPApZAvJEZVUiMXttzo/hYzuyuGDPQKZ/2D2DORjxxU7uo30VuFhn3QV13qsNuJhQzJc/zicWH5dVwxx9ONBI4GPj808lT8tDWcKOf/CfFJv6vWJWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030147; c=relaxed/simple;
	bh=Hh6XzUY/iDiGIEAijdEnsDpks3VJjKJdUvH8wlwXeGA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WS1SymzXAINnDbKceUexYO+AluChcOZiJfuPPvMI4Q0ONFZKBtHWx0xLYf0esPlzTA6E9peWUP+a8pKYDMkS0mvUjTIGSve9vVr9hc2Gtv+i5tKVTbI70RcQBsMw1U8yVR6V2Khk0sIjYopvzMhPF7CNr9E2gC8103xwoci9kLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8Kpe7Lc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8Kpe7Lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786030144; x=1817566144;
  h=date:from:to:cc:subject:message-id;
  bh=Hh6XzUY/iDiGIEAijdEnsDpks3VJjKJdUvH8wlwXeGA=;
  b=I8Kpe7Lcz/eeZ4HqE/LU6PjSJS3Hc3L4Pcrr0sx59FiRYyfZ+cfYjM+J
   7f9q/IgA+1yOcXtEphkbhz94MMRfPLp/A5qU/378R7b7jjnL048bAhUZI
   sYoeDlJ2dg9wXSw15JyX7FOVohKTzoh+w4Sgb/mXkgMJdVeypsFQs21dz
   rZJH5dT6lWr9ZJoEcU3bIl1+Z3dTaMbrOq0mW9KTGrJHBkeYAEh7c7OyW
   xUvgQCCQn5Kab1lqjagPsvt3BhjwFuXWYaNKXAy7YuUWajb+eWZdsNY9p
   3jCzIcOf03ACxAnmNbtlvSAoRjAzhN3AephMFWp7sNMC6PLBQTqkK6zjn
   g==;
X-CSE-ConnectionGUID: cT4DUkqxQ8+6w8I/WiviDQ==
X-CSE-MsgGUID: np7KaTcnT8aLwoFtsppCMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104163221"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="104163221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 08:29:03 -0700
X-CSE-ConnectionGUID: /sTmWaYQQri4zpjKpii84Q==
X-CSE-MsgGUID: iPn78QACRM2Irk3fJqE1uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="259518748"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Aug 2026 08:29:03 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws01k-00000000FUP-1y5K;
	Thu, 06 Aug 2026 15:29:00 +0000
Date: Thu, 06 Aug 2026 23:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 e17ae2ae6c5e0089e46bba46537d09e24b7119f0
Message-ID: <202608062344.nMwWle2Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: e17ae2ae6c5e0089e46bba46537d09e24b7119f0  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 2919m

configs tested: 99
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260805    gcc-12.5.0
arc                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-001-20260805    gcc-12.5.0
arm                  randconfig-002-20260805    gcc-12.5.0
arm                  randconfig-003-20260805    gcc-12.5.0
arm                  randconfig-004-20260805    gcc-12.5.0
arm                      spear13xx_defconfig    gcc-16.1.0
arm64                randconfig-001-20260805    gcc-10.5.0
arm64                randconfig-002-20260805    gcc-10.5.0
arm64                randconfig-003-20260805    gcc-10.5.0
arm64                randconfig-004-20260805    gcc-10.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260805    gcc-10.5.0
csky                 randconfig-002-20260805    gcc-10.5.0
hexagon              randconfig-001-20260805    clang-18
hexagon              randconfig-002-20260805    clang-18
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260805    clang-22
i386       buildonly-randconfig-002-20260805    clang-22
i386       buildonly-randconfig-003-20260805    clang-22
i386       buildonly-randconfig-004-20260805    clang-22
i386       buildonly-randconfig-005-20260805    clang-22
i386       buildonly-randconfig-006-20260805    clang-22
i386                 randconfig-001-20260805    gcc-13
i386                 randconfig-002-20260805    gcc-13
i386                 randconfig-003-20260805    gcc-13
i386                 randconfig-004-20260805    gcc-13
i386                 randconfig-005-20260805    gcc-13
i386                 randconfig-006-20260805    gcc-13
i386                 randconfig-007-20260805    gcc-13
i386                 randconfig-011-20260805    gcc-14
i386                 randconfig-012-20260805    gcc-14
i386                 randconfig-013-20260805    gcc-14
i386                 randconfig-014-20260805    gcc-14
i386                 randconfig-015-20260805    gcc-14
i386                 randconfig-016-20260805    gcc-14
i386                 randconfig-017-20260805    gcc-14
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260805    clang-18
loongarch            randconfig-002-20260805    clang-18
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260805    clang-18
nios2                randconfig-002-20260805    clang-18
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260805    gcc-9.5.0
parisc               randconfig-002-20260805    gcc-9.5.0
powerpc              randconfig-001-20260805    gcc-9.5.0
powerpc              randconfig-002-20260805    gcc-9.5.0
powerpc64            randconfig-001-20260805    gcc-9.5.0
powerpc64            randconfig-002-20260805    gcc-9.5.0
riscv                randconfig-001-20260805    gcc-8.5.0
riscv                randconfig-002-20260805    gcc-8.5.0
s390                            alldefconfig    gcc-16.1.0
s390                 randconfig-001-20260805    gcc-8.5.0
s390                 randconfig-002-20260805    gcc-8.5.0
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260805    gcc-8.5.0
sh                   randconfig-002-20260805    gcc-8.5.0
sparc                randconfig-001-20260805    gcc-11.5.0
sparc                randconfig-002-20260805    gcc-11.5.0
sparc64              randconfig-001-20260805    gcc-11.5.0
sparc64              randconfig-002-20260805    gcc-11.5.0
um                   randconfig-001-20260805    gcc-11.5.0
um                   randconfig-002-20260805    gcc-11.5.0
x86_64     buildonly-randconfig-001-20260805    gcc-14
x86_64     buildonly-randconfig-002-20260805    gcc-14
x86_64     buildonly-randconfig-003-20260805    gcc-14
x86_64     buildonly-randconfig-004-20260805    gcc-14
x86_64     buildonly-randconfig-005-20260805    gcc-14
x86_64     buildonly-randconfig-006-20260805    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260805    gcc-14
x86_64               randconfig-002-20260805    gcc-14
x86_64               randconfig-003-20260805    gcc-14
x86_64               randconfig-004-20260805    gcc-14
x86_64               randconfig-005-20260805    gcc-14
x86_64               randconfig-006-20260805    gcc-14
x86_64               randconfig-011-20260805    gcc-14
x86_64               randconfig-012-20260805    gcc-14
x86_64               randconfig-013-20260805    gcc-14
x86_64               randconfig-014-20260805    gcc-14
x86_64               randconfig-015-20260805    gcc-14
x86_64               randconfig-016-20260805    gcc-14
x86_64               randconfig-071-20260805    clang-22
x86_64               randconfig-072-20260805    clang-22
x86_64               randconfig-073-20260805    clang-22
x86_64               randconfig-074-20260805    clang-22
x86_64               randconfig-075-20260805    clang-22
x86_64               randconfig-076-20260805    clang-22
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260805    gcc-11.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
