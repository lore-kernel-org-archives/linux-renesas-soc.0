Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAB5199947
	for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Oct 2026 06:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094736; cv=none; b=esR52pIH3Pb563oGT2BTo/YdWlG4L8AA7EnaAKEN5qKkvsHxAME+HGHqD48A+v0rYeOggkzRg0zmJ7ie60fEZJGbdZ8DrNUThAssMWjJrJKVNnDStDngWwKj8fcsrqbzB6ndVvNz+me+BPkLe77LA9yhLoMTY+02+UkeoAf+hzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094736; c=relaxed/simple;
	bh=F9xkA1iPGJajycpOQcqaS6WK2KodauqtBANwrHsSLXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OB0dJeuGIe+NesgEkQkq4FNtAi0ld8lSzORxjmuXPdOu9uDbyYv5ot1rIRewFMfSvFmsPtZj2laUDEZE8HZWwwKfK/7WKY/yoRhHZM+I3BlA7quvJ+2OnQBpKkp9sto0ekazQspMb7P2SNpM1Eqo8Qsvy0+ND6bVDcnHoZ/StQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJ6eSO4K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJ6eSO4K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791094735; x=1822630735;
  h=date:from:to:cc:subject:message-id;
  bh=F9xkA1iPGJajycpOQcqaS6WK2KodauqtBANwrHsSLXQ=;
  b=VJ6eSO4KGQuYolkFFwgaCVg+aM4fM+husTzdVnrgqzDKa0CotriPVeBN
   YAHgPEXivW6QOvAJWwK9LT/Uivn8WPfsHW2TtBd5NQlvH2JRXs0gz5RHu
   AFN15voH9+hVgn7eSE1E7Pv2Q1VIyM6/JxpBI8vwxVFZhq4k1EHprGExu
   CTZm04tSwgMM/6a7Z0jpgKI77DZ4T6LPRv9scFkYbDoFKzoPBPEviyWww
   3RWYAAuzHZR3rmzwL11vwoVRk1xWoqAg6ZrN4xP5chGwPEPkP6VjkkKZL
   pUKndedSTm+washdQh0AJDnw7YUf5Iiva+MCc5la91D9KWThIDV9AXvxg
   g==;
X-CSE-ConnectionGUID: uTzJl/qfQryTA8f1xpD3Ig==
X-CSE-MsgGUID: PkYBzZ0VQYCO39IwyHTSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91821347"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="91821347"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:18:54 -0700
X-CSE-ConnectionGUID: Dz3Wyr06SSWSeiihF5SRuQ==
X-CSE-MsgGUID: xPNnXJwHR/W/DpOOYWkLxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="642287"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 03 Oct 2026 23:18:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDFYg-00000000UXJ-3GXv;
	Sun, 04 Oct 2026 06:18:50 +0000
Date: Sun, 04 Oct 2026 14:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:next] BUILD SUCCESS
 fb050251fd4fe3b4d0231495651901626c2a1464
Message-ID: <202610041425.FHMRGmHO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
branch HEAD: fb050251fd4fe3b4d0231495651901626c2a1464  Merge branches 'renesas-arm-defconfig-for-v7.4', 'renesas-drivers-for-v7.4' and 'renesas-dts-for-v7.4' into renesas-next

elapsed time: 1485m

configs tested: 290
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261002    gcc-16.1.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1001-20261004    clang-22
arc                  randconfig-r2100-20261002    gcc-16.1.0 cocci
arc                  randconfig-r2309-20261002    clang-20   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             qcom_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1003-20261004    clang-22
arm                  randconfig-r2106-20261002    clang-24   cocci
arm                  randconfig-r2106-20261002    gcc-16.1.0 cocci
arm                          s3c6400_defconfig    gcc-16.1.0
arm                     vt8500_v6_v7_defconfig    gcc-16.1.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                                defconfig    gcc-16.1.0
arm64                 randconfig-1000-20261004    gcc-16.1.0
arm64                 randconfig-1001-20261004    gcc-16.1.0
arm64                 randconfig-1002-20261004    gcc-16.1.0
arm64                 randconfig-1003-20261004    gcc-16.1.0
arm64                randconfig-r2107-20261002    clang-24   cocci
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261004    gcc-16.1.0
csky                 randconfig-r2103-20261002    gcc-16.1.0 cocci
csky                 randconfig-r2301-20261002    gcc-16.1.0 sparse
csky                 randconfig-r2305-20261002    gcc-14.3.0 sparse
csky                 randconfig-r2307-20261002    gcc-14.3.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
hexagon              randconfig-r2102-20261002    clang-24   cocci
hexagon              randconfig-r2103-20261002    gcc-16.1.0 cocci
hexagon              randconfig-r2202-20261002    clang-18   smatch
hexagon              randconfig-r2302-20261002    gcc-16.1.0 sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.1.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261004    clang-22
i386        buildonly-randconfig-1001-20261004    clang-22
i386        buildonly-randconfig-1002-20261004    clang-22
i386        buildonly-randconfig-1003-20261004    clang-22
i386        buildonly-randconfig-1004-20261004    clang-22
i386        buildonly-randconfig-1005-20261004    clang-22
i386                                 defconfig    gcc-16.1.0
i386                  randconfig-1000-20261004    gcc-14
i386                  randconfig-1001-20261004    gcc-14
i386                  randconfig-1002-20261004    gcc-14
i386                  randconfig-1003-20261004    gcc-14
i386                  randconfig-1004-20261004    gcc-14
i386                  randconfig-1005-20261004    gcc-14
i386                  randconfig-1006-20261004    gcc-14
i386                  randconfig-1007-20261004    clang-22
i386                  randconfig-1008-20261004    clang-22
i386                  randconfig-1009-20261004    clang-22
i386                  randconfig-1010-20261004    clang-22
i386                  randconfig-1011-20261004    clang-22
i386                  randconfig-1012-20261004    clang-22
i386                  randconfig-1013-20261004    clang-22
i386                  randconfig-2100-20261002    gcc-14     cocci
i386                  randconfig-2101-20261002    clang-22   cocci
i386                  randconfig-2101-20261002    gcc-14     cocci
i386                  randconfig-2102-20261002    gcc-14     cocci
i386                  randconfig-2103-20261002    gcc-14     cocci
i386                  randconfig-2200-20261002    gcc-14     smatch
i386                  randconfig-2300-20261002    clang-22   sparse
i386                  randconfig-2300-20261002    gcc-12     sparse
i386                  randconfig-2301-20261002    gcc-12     sparse
i386                  randconfig-2301-20261002    gcc-14     sparse
i386                  randconfig-2302-20261002    gcc-12     sparse
i386                  randconfig-2302-20261002    gcc-14     sparse
i386                 randconfig-r2201-20261002    gcc-14     smatch
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.1.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261004    gcc-16.1.0
loongarch             randconfig-1001-20261004    gcc-16.1.0
loongarch            randconfig-r2200-20261002    gcc-16.1.0 smatch
loongarch            randconfig-r2202-20261002    gcc-16.1.0 smatch
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          apollo_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2103-20261002    clang-17   cocci
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2300-20261002    gcc-8.5.0  sparse
microblaze           randconfig-r2306-20261002    gcc-8.5.0  sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                            ip32_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                 randconfig-r2105-20261002    gcc-10.5.0 cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2101-20261002    clang-17   cocci
nios2                randconfig-r2200-20261002    gcc-11.5.0 smatch
nios2                randconfig-r2201-20261002    gcc-11.5.0 smatch
nios2                randconfig-r2303-20261002    gcc-8.5.0  sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2202-20261002    gcc-16.1.0 smatch
openrisc             randconfig-r2303-20261002    gcc-16.1.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc               randconfig-r2104-20261002    gcc-16.1.0 cocci
parisc               randconfig-r2106-20261002    gcc-8.5.0  cocci
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc              randconfig-r2102-20261002    clang-17   cocci
powerpc              randconfig-r2104-20261002    clang-24   cocci
powerpc              randconfig-r2309-20261002    gcc-16.1.0 sparse
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2101-20261002    clang-24   cocci
powerpc64            randconfig-r2301-20261002    clang-24   sparse
powerpc64            randconfig-r2305-20261002    gcc-16.1.0 sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.1.0
riscv                 randconfig-1000-20261004    gcc-11.5.0
riscv                 randconfig-1001-20261004    gcc-11.5.0
riscv                 randconfig-2000-20261002    gcc-8.5.0
riscv                 randconfig-2000-20261002    gcc-9.5.0
riscv                 randconfig-2001-20261002    clang-18
riscv                 randconfig-2001-20261002    gcc-9.5.0
riscv                randconfig-r2107-20261002    clang-24   cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.1.0
s390                                 defconfig    gcc-16.1.0
s390                  randconfig-1000-20261004    gcc-11.5.0
s390                  randconfig-1001-20261004    gcc-11.5.0
s390                  randconfig-2000-20261002    clang-24
s390                  randconfig-2000-20261002    gcc-9.5.0
s390                  randconfig-2001-20261002    clang-19
s390                  randconfig-2001-20261002    gcc-9.5.0
s390                 randconfig-r2100-20261002    clang-17   cocci
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-2000-20261002    gcc-11.5.0
sh                    randconfig-2000-20261002    gcc-9.5.0
sh                    randconfig-2001-20261002    gcc-9.5.0
sh                            se7724_defconfig    gcc-16.1.0
sh                      sh7710voipgw_defconfig    gcc-16.1.0
sh                         sh7785lcr_defconfig    gcc-16.1.0
sparc                             alldefconfig    gcc-16.1.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.1.0
sparc                 randconfig-1000-20261004    gcc-14
sparc                 randconfig-1001-20261004    gcc-14
sparc                 randconfig-2000-20261002    clang-24
sparc                 randconfig-2000-20261002    gcc-15.2.0
sparc                 randconfig-2001-20261002    clang-24
sparc                 randconfig-2001-20261002    gcc-8.5.0
sparc                randconfig-r2107-20261002    gcc-16.1.0 cocci
sparc                randconfig-r2201-20261002    gcc-8.5.0  smatch
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261004    gcc-14
sparc64               randconfig-1001-20261004    gcc-14
sparc64               randconfig-2000-20261002    clang-24
sparc64               randconfig-2000-20261002    gcc-8.5.0
sparc64               randconfig-2001-20261002    clang-24
sparc64              randconfig-r2105-20261002    clang-24   cocci
sparc64              randconfig-r2105-20261002    gcc-16.1.0 cocci
sparc64              randconfig-r2200-20261002    gcc-15.2.0 smatch
sparc64              randconfig-r2302-20261002    clang-21   sparse
sparc64              randconfig-r2304-20261002    gcc-16.1.0 sparse
sparc64              randconfig-r2306-20261002    clang-20   sparse
sparc64              randconfig-r2308-20261002    clang-20   sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2001-20261002    clang-24
um                   randconfig-r2304-20261002    gcc-14     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-22   checkkconfigsymbols
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261004    gcc-14
x86_64      buildonly-randconfig-1001-20261004    gcc-14
x86_64      buildonly-randconfig-1002-20261004    gcc-14
x86_64      buildonly-randconfig-1003-20261004    gcc-14
x86_64      buildonly-randconfig-1004-20261004    gcc-14
x86_64      buildonly-randconfig-1005-20261004    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261004    gcc-14
x86_64                randconfig-1001-20261004    gcc-14
x86_64                randconfig-1002-20261004    gcc-14
x86_64                randconfig-1003-20261004    gcc-14
x86_64                randconfig-1004-20261004    gcc-14
x86_64                randconfig-1005-20261004    gcc-14
x86_64                randconfig-1006-20261004    clang-22
x86_64                randconfig-1007-20261004    clang-22
x86_64                randconfig-1008-20261004    clang-22
x86_64                randconfig-1009-20261004    clang-22
x86_64                randconfig-1010-20261004    clang-22
x86_64                randconfig-1011-20261004    clang-22
x86_64                randconfig-1012-20261004    gcc-13
x86_64                randconfig-1013-20261004    gcc-13
x86_64                randconfig-1014-20261004    gcc-13
x86_64                randconfig-1015-20261004    gcc-13
x86_64                randconfig-1016-20261004    gcc-13
x86_64                randconfig-1017-20261004    gcc-13
x86_64                randconfig-2100-20261002    gcc-14     cocci
x86_64                randconfig-2101-20261002    gcc-14     cocci
x86_64                randconfig-2102-20261002    clang-22   cocci
x86_64                randconfig-2102-20261002    gcc-14     cocci
x86_64                randconfig-2103-20261002    clang-22   cocci
x86_64                randconfig-2103-20261002    gcc-14     cocci
x86_64                randconfig-2200-20261002    clang-22   smatch
x86_64                randconfig-2200-20261003    gcc-14     smatch
x86_64                randconfig-2300-20261002    gcc-12     sparse
x86_64                randconfig-2300-20261002    gcc-14     sparse
x86_64                randconfig-2301-20261002    gcc-12     sparse
x86_64                randconfig-2301-20261002    gcc-14     sparse
x86_64                randconfig-2302-20261002    gcc-12     sparse
x86_64               randconfig-r2101-20261002    gcc-16.1.0 cocci
x86_64               randconfig-r2104-20261002    gcc-14     cocci
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261004    gcc-14
xtensa                randconfig-1001-20261004    gcc-14
xtensa                randconfig-2000-20261002    clang-24
xtensa                randconfig-2000-20261002    gcc-13.4.0
xtensa                randconfig-2001-20261002    clang-24
xtensa                randconfig-2001-20261002    gcc-11.5.0
xtensa               randconfig-r2100-20261002    gcc-12.5.0 cocci
xtensa               randconfig-r2300-20261002    gcc-16.1.0 sparse
xtensa               randconfig-r2307-20261002    clang-20   sparse
xtensa               randconfig-r2308-20261002    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
