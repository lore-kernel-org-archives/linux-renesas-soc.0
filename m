Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB973D5C05
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Oct 2026 20:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181400; cv=none; b=CLtziw7XHlagcN7JayrbD6VwRKrqj3nCMrEpx4d1aXKF2eNSfQqcQZOZ6jVu3NPQtwr9M++MfzSSTnmsonbRcbIKA6rADD/otNfn40xwO0M77DR3YPl9Mas0oonx0pXlf+vfd1HC8u5/6yVqi87AXQErLgQwmyie+SKvdSIKu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181400; c=relaxed/simple;
	bh=3Xo5TzdolWQcfafl4qIvqEfw1npWTLKaN02Y8Wn+Hlg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=crBYjXeo3BXkOvXQvL/PhxBLMjXa20KvUFTI5N8pHSAkEsIzTn75EdFaoUTKuEeBRLRFAbIGJ8JahyFSc8rNKLUiZCwMv1jSeivBtwVChDa6I6R1nzCMZnT/gMpNXBbxJPaHH5HslG21mmLu7bgm/vsAVngqA6DlsX7Oi/Sz/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7iVzj+Q; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7iVzj+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792181400; x=1823717400;
  h=date:from:to:cc:subject:message-id;
  bh=3Xo5TzdolWQcfafl4qIvqEfw1npWTLKaN02Y8Wn+Hlg=;
  b=R7iVzj+QsJd0/cfLec8iD4Zg2MIZhcldZJrI+47S9CSPMHQbU8EE4Peq
   zEIvos4idVlVMg0vnBV6xS3zl5711S1szlBDa5GfpMm14VEOuX+jffbuU
   31AsHk/kOTEHAwaT0d623uu/uTuqNn36XS2EHSZDtFScSWEYFWTvU1Idn
   dD/vo7UNXIWGhq9DlKBUgbFhtpNbH1Uk/9nRQ1+qvNiJn0w94s/DRYx7J
   ucSSOiGie/zmeU8/GAO4Toss4lzrJ1RI3j7JCZ3IygAWfj5VGJmOVyyTy
   GXxo8LnigYDLDRekaWWOuQ+Zm96f+i9fLFsFdeKCjO0Xme3KLG5KwKurT
   w==;
X-CSE-ConnectionGUID: UcPxrzqASHC15eEKG5vyLw==
X-CSE-MsgGUID: h1nYQ6CBSMWNTkjYDu/9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1072992"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1072992"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 13:09:59 -0700
X-CSE-ConnectionGUID: BHfNLKG7Qle/kGNsLninNg==
X-CSE-MsgGUID: k+Sbo0T5SeW+GAz6ps8AVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2089452"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Oct 2026 13:09:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHoFW-00000000IdK-2pzq;
	Fri, 16 Oct 2026 20:09:54 +0000
Date: Sat, 17 Oct 2026 04:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-drivers:master] BUILD SUCCESS
 7c5978e33c0df274c11d6c041098bb11d8cf6769
Message-ID: <202610170447.TN1Il5Ak-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
branch HEAD: 7c5978e33c0df274c11d6c041098bb11d8cf6769  [LOCAL] riscv: rzfive: defconfig: Update for renesas-drivers

elapsed time: 4497m

configs tested: 229
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2104-20261013    clang-22   cocci
alpha                randconfig-r2106-20261013    clang-22   cocci
arc                               allmodconfig    gcc-16.1.0
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    gcc-16.1.0
arc                                  defconfig    gcc-16.1.0
arc                   randconfig-2000-20261013    gcc-8.5.0
arc                   randconfig-2001-20261013    gcc-8.5.0
arc                  randconfig-r2107-20261013    clang-22   cocci
arc                  randconfig-r2300-20261013    gcc-8.5.0  sparse
arc                         vdk_hs38_defconfig    gcc-16.1.0
arm                                allnoconfig    clang-17
arm                               allyesconfig    gcc-16.1.0
arm                                  defconfig    clang-24
arm                            h3600_defconfig    gcc-16.1.0
arm                   randconfig-2000-20261013    gcc-8.5.0
arm                   randconfig-2001-20261013    gcc-8.5.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261016    gcc-8.5.0
arm64                 randconfig-1001-20261016    clang-19
arm64                 randconfig-1002-20261016    gcc-8.5.0
arm64                 randconfig-1003-20261016    clang-17
arm64                 randconfig-2000-20261013    gcc-9.5.0
arm64                 randconfig-2001-20261013    gcc-9.5.0
arm64                randconfig-r2306-20261013    gcc-10.5.0 sparse
csky                              alldefconfig    gcc-16.1.0
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261016    gcc-13.4.0
csky                  randconfig-1001-20261016    gcc-11.5.0
csky                  randconfig-2000-20261013    gcc-9.5.0
csky                  randconfig-2001-20261013    gcc-9.5.0
hexagon                           allmodconfig    clang-24
hexagon                            allnoconfig    clang-24
hexagon                              defconfig    clang-24
hexagon               randconfig-1000-20261016    clang-24
hexagon               randconfig-1001-20261016    clang-17
hexagon               randconfig-2000-20261013    gcc-9.5.0
hexagon               randconfig-2001-20261013    gcc-9.5.0
hexagon              randconfig-r2101-20261013    clang-24   cocci
hexagon              randconfig-r2103-20261013    clang-24   cocci
i386                               allnoconfig    gcc-14
i386        buildonly-randconfig-1000-20261016    clang-22
i386        buildonly-randconfig-1001-20261016    gcc-14
i386        buildonly-randconfig-1002-20261016    gcc-13
i386        buildonly-randconfig-1003-20261016    clang-22
i386        buildonly-randconfig-1004-20261016    clang-22
i386        buildonly-randconfig-1005-20261016    clang-22
i386                                 defconfig    clang-22
i386                  randconfig-1007-20261016    clang-22
i386                  randconfig-1008-20261016    gcc-14
i386                  randconfig-1009-20261016    gcc-13
i386                  randconfig-1010-20261016    clang-22
i386                  randconfig-1011-20261016    clang-22
i386                  randconfig-1012-20261016    gcc-14
i386                  randconfig-1013-20261016    gcc-12
i386                  randconfig-2000-20261013    gcc-8.5.0
i386                  randconfig-2001-20261013    gcc-8.5.0
i386                  randconfig-2100-20261013    gcc-14     cocci
i386                  randconfig-2101-20261013    gcc-14     cocci
i386                  randconfig-2102-20261013    gcc-14     cocci
i386                  randconfig-2103-20261013    gcc-14     cocci
i386                  randconfig-2104-20261013    gcc-14     cocci
i386                  randconfig-2105-20261013    gcc-14     cocci
i386                  randconfig-2200-20261013    gcc-14     smatch
i386                  randconfig-2300-20261013    gcc-14     sparse
i386                  randconfig-2301-20261013    gcc-14     sparse
i386                  randconfig-2302-20261013    gcc-14     sparse
i386                 randconfig-r2102-20261013    clang-24   cocci
i386                 randconfig-r2111-20261013    clang-22   cocci
loongarch                         allmodconfig    clang-19
loongarch                          allnoconfig    clang-20
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261016    gcc-16.1.0
loongarch             randconfig-1001-20261016    clang-24
loongarch             randconfig-2000-20261013    gcc-11.5.0
loongarch             randconfig-2001-20261013    gcc-11.5.0
loongarch            randconfig-r2201-20261013    clang-24   smatch
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    gcc-16.1.0
m68k                                 defconfig    gcc-16.1.0
m68k                        m5235evb_defconfig    gcc-16.1.0
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    gcc-16.1.0
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                       maltaaprp_defconfig    clang-17
mips                 randconfig-r2301-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2302-20261013    gcc-8.5.0  sparse
mips                 randconfig-r2310-20261013    gcc-10.5.0 sparse
nios2                             allmodconfig    gcc-11.5.0
nios2                              allnoconfig    gcc-11.5.0
nios2                                defconfig    gcc-11.5.0
nios2                 randconfig-1000-20261016    gcc-11.5.0
nios2                 randconfig-1001-20261016    gcc-8.5.0
nios2                 randconfig-2000-20261013    gcc-11.5.0
nios2                 randconfig-2001-20261013    gcc-11.5.0
openrisc                          allmodconfig    gcc-16.1.0
openrisc                           allnoconfig    gcc-16.1.0
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2100-20261013    clang-24   cocci
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    gcc-16.1.0
parisc                            allyesconfig    gcc-16.1.0
parisc                               defconfig    gcc-16.1.0
parisc                randconfig-1000-20261016    gcc-15.2.0
parisc                randconfig-1001-20261016    gcc-8.5.0
parisc                randconfig-2000-20261013    gcc-11.5.0
parisc                randconfig-2001-20261013    gcc-11.5.0
parisc               randconfig-r2108-20261013    clang-24   cocci
parisc               randconfig-r2311-20261013    gcc-10.5.0 sparse
parisc64                             defconfig    gcc-16.1.0
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    gcc-16.1.0
powerpc                    microwatt_defconfig    gcc-16.1.0
powerpc                       pasemi_defconfig    clang-24
powerpc               randconfig-1000-20261016    clang-17
powerpc               randconfig-1001-20261016    clang-17
powerpc               randconfig-2000-20261013    gcc-14
powerpc               randconfig-2001-20261013    gcc-14
powerpc              randconfig-r2110-20261013    clang-22   cocci
powerpc              randconfig-r2305-20261013    gcc-8.5.0  sparse
powerpc64             randconfig-1000-20261016    clang-24
powerpc64             randconfig-1001-20261016    clang-21
powerpc64             randconfig-2000-20261013    gcc-14
powerpc64             randconfig-2001-20261013    gcc-14
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    gcc-16.1.0
riscv                             allyesconfig    clang-24
riscv                                defconfig    clang-24
riscv                 randconfig-1000-20261016    clang-24
riscv                 randconfig-1001-20261016    clang-24
riscv                 randconfig-2000-20261013    gcc-15.2.0
riscv                 randconfig-2001-20261013    gcc-15.2.0
riscv                randconfig-r2308-20261013    gcc-10.5.0 sparse
s390                              allmodconfig    clang-24
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    clang-18
s390                  randconfig-1000-20261016    clang-24
s390                  randconfig-1001-20261016    gcc-8.5.0
s390                  randconfig-2000-20261013    gcc-15.2.0
s390                  randconfig-2001-20261013    gcc-15.2.0
s390                 randconfig-r2109-20261013    clang-24   cocci
s390                 randconfig-r2304-20261013    gcc-8.5.0  sparse
s390                 randconfig-r2307-20261013    gcc-10.5.0 sparse
s390                        zfcpdump_defconfig    clang-22
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    gcc-16.1.0
sh                                allyesconfig    gcc-16.1.0
sh                    randconfig-1000-20261016    gcc-16.1.0
sh                    randconfig-1001-20261016    gcc-15.2.0
sh                    randconfig-2000-20261013    gcc-15.2.0
sh                    randconfig-2001-20261013    gcc-15.2.0
sparc                              allnoconfig    gcc-16.1.0
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261016    gcc-16.1.0
sparc                 randconfig-1001-20261016    gcc-15.2.0
sparc                 randconfig-2000-20261013    gcc-16.1.0
sparc                 randconfig-2001-20261013    gcc-16.1.0
sparc                randconfig-r2303-20261013    gcc-8.5.0  sparse
sparc64               randconfig-1000-20261016    clang-20
sparc64               randconfig-1001-20261016    clang-24
sparc64               randconfig-2000-20261013    gcc-16.1.0
sparc64               randconfig-2001-20261013    gcc-16.1.0
sparc64              randconfig-r2200-20261013    clang-24   smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-17
um                                allyesconfig    gcc-14
um                    randconfig-1000-20261016    gcc-14
um                    randconfig-1001-20261016    gcc-14
um                    randconfig-2000-20261013    gcc-16.1.0
um                    randconfig-2001-20261013    gcc-16.1.0
x86_64                             allnoconfig    clang-22
x86_64      buildonly-randconfig-1000-20261016    gcc-14
x86_64      buildonly-randconfig-1001-20261016    clang-22
x86_64      buildonly-randconfig-1002-20261016    gcc-14
x86_64      buildonly-randconfig-1003-20261016    clang-22
x86_64      buildonly-randconfig-1004-20261016    gcc-14
x86_64      buildonly-randconfig-1005-20261016    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1006-20261016    clang-22
x86_64                randconfig-1007-20261016    clang-22
x86_64                randconfig-1008-20261016    clang-22
x86_64                randconfig-1009-20261016    clang-22
x86_64                randconfig-1010-20261016    clang-22
x86_64                randconfig-1011-20261016    gcc-14
x86_64                randconfig-1012-20261016    gcc-14
x86_64                randconfig-1013-20261016    gcc-12
x86_64                randconfig-1014-20261016    gcc-14
x86_64                randconfig-1015-20261016    gcc-14
x86_64                randconfig-1016-20261016    clang-22
x86_64                randconfig-1017-20261016    clang-22
x86_64                randconfig-2000-20261013    gcc-14
x86_64                randconfig-2001-20261013    gcc-14
x86_64                randconfig-2100-20261013    clang-22   cocci
x86_64                randconfig-2101-20261013    clang-22   cocci
x86_64                randconfig-2102-20261013    clang-22   cocci
x86_64                randconfig-2103-20261013    clang-22   cocci
x86_64                randconfig-2104-20261013    clang-22   cocci
x86_64                randconfig-2105-20261013    clang-22   cocci
x86_64                randconfig-2200-20261013    gcc-13     smatch
x86_64                randconfig-2300-20261013    gcc-14     sparse
x86_64                randconfig-2301-20261013    gcc-14     sparse
x86_64                randconfig-2302-20261013    gcc-14     sparse
x86_64               randconfig-r2202-20261013    gcc-14     smatch
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                            rhel-9.4-ltp    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    gcc-16.1.0
xtensa                randconfig-1000-20261016    gcc-11.5.0
xtensa                randconfig-1001-20261016    gcc-9.5.0
xtensa                randconfig-2000-20261013    gcc-16.1.0
xtensa                randconfig-2001-20261013    gcc-16.1.0
xtensa               randconfig-r2105-20261013    clang-22   cocci
xtensa               randconfig-r2309-20261013    gcc-10.5.0 sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
