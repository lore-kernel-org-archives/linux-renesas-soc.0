Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C3D221546
	for <linux-renesas-soc@vger.kernel.org>; Sun,  4 Oct 2026 06:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094797; cv=none; b=CgPq5iYwBbWcGjuo0MOd/TTBIRzF/+GL0xqtxxXFIszXL1SCB9aXc1I+reAjOlHzayMKK5yHEYPHV5sF3UqWktZYIOQ02HwKYqNFxDYfBeCp67lVyY/8b2hV4PQXN9G8mNO3IWOlUdKw9ZxHxcbFQARzBcz3H1G14wThgu0vUSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094797; c=relaxed/simple;
	bh=vEbpc7JKpZg5MqmlZHYsqpHaGeNrO7uDSbaTSTf/NQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bhxg7SWU2UlcApXZ9xf7+0sL+wLEtK+XeaNMVbjtgDdAhcwbZOs1N/mQBe0HxYmO1uTpCKNs1n7YGfFEHqB78U3oEP2/cOPfLUiBAOIr2+Y7SYpF+g/1AWmeQpgt8y3XhaH6qY2Y6AH5xt7e06cm3nKpyS2kxLrONj2/oAPpI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5ETeHQa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5ETeHQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791094795; x=1822630795;
  h=date:from:to:cc:subject:message-id;
  bh=vEbpc7JKpZg5MqmlZHYsqpHaGeNrO7uDSbaTSTf/NQ8=;
  b=W5ETeHQaNCpPHxuGt/upvpj30VAU25Mie2fq7TN4Qn4h/0H3fWUZEwjb
   +VUFxQ85sLpqJIVB0NbJ6HlkmEuS87P8SHYRqHnXV6Wydp3FB2TRam43/
   SFkXuvoC8dN11aTgzism2OvhkRPvVltlwIEsP37EEO/G+ZvROqFKVTkx0
   ue+XgNW7+h7MFr0jIqZMOjrMhcXzVO5LXVV+sdILXhvpuPDquDChKB7Sk
   28j6YtdtZyu015wfAUIeU/snbIIE2DIv66yKCh2RYEqbzys/1BcEm/vwM
   3P1lnFSaZUimixB3aGNyR6dutYkLqM8EFnVoe3KxmpBFfEXw5oUXadD47
   w==;
X-CSE-ConnectionGUID: ss915M9zSZyssQU+5pXqrg==
X-CSE-MsgGUID: Dle7qv0wSJSPqzfry9P+Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="95611763"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="95611763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:19:55 -0700
X-CSE-ConnectionGUID: nkARIeXUSeaqVjlj4UF+6g==
X-CSE-MsgGUID: doC9z12SSEC7w9WAt7wpRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="279811815"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Oct 2026 23:19:54 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDFZf-00000000UXZ-2D5T;
	Sun, 04 Oct 2026 06:19:51 +0000
Date: Sun, 04 Oct 2026 14:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [geert-renesas-devel:renesas-dts-for-v7.4] BUILD SUCCESS
 d99e991749f3b12a3a8b23224725dbc1ca15f6bf
Message-ID: <202610041416.FVzBVhNc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.4
branch HEAD: d99e991749f3b12a3a8b23224725dbc1ca15f6bf  arm64: dts: renesas: Add support for solidrun rzg2ul som on hb-ripple

elapsed time: 1485m

configs tested: 298
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.1.0
alpha                             allyesconfig    gcc-16.1.0
alpha                                defconfig    gcc-16.1.0
alpha                randconfig-r2102-20261002    gcc-16.1.0 cocci
alpha                randconfig-r2103-20261002    gcc-13.4.0 cocci
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.1.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.1.0
arc                  nsimosci_hs_smp_defconfig    gcc-16.1.0
arc                   randconfig-1000-20261004    clang-22
arc                   randconfig-1001-20261004    clang-22
arc                  randconfig-r2100-20261002    gcc-16.1.0 cocci
arc                  randconfig-r2300-20261002    gcc-14     sparse
arc                  randconfig-r2306-20261002    gcc-16.1.0 sparse
arc                  randconfig-r2309-20261002    clang-20   sparse
arm                                allnoconfig    gcc-16.1.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.1.0
arm                             qcom_defconfig    gcc-16.1.0
arm                   randconfig-1000-20261004    clang-22
arm                   randconfig-1001-20261004    clang-22
arm                   randconfig-1002-20261004    clang-22
arm                   randconfig-1003-20261004    clang-22
arm                  randconfig-r2105-20261002    gcc-10.5.0 cocci
arm                  randconfig-r2106-20261002    clang-24   cocci
arm                  randconfig-r2106-20261002    gcc-16.1.0 cocci
arm                  randconfig-r2304-20261002    clang-24   sparse
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
arm64                randconfig-r2309-20261002    gcc-16.1.0 sparse
csky                              allmodconfig    gcc-16.1.0
csky                               allnoconfig    gcc-16.1.0
csky                                 defconfig    gcc-16.1.0
csky                  randconfig-1000-20261004    gcc-16.1.0
csky                  randconfig-1001-20261004    gcc-16.1.0
csky                 randconfig-r2301-20261002    gcc-16.1.0 sparse
hexagon                           allmodconfig    gcc-16.1.0
hexagon                            allnoconfig    gcc-16.1.0
hexagon                              defconfig    gcc-16.1.0
hexagon               randconfig-1000-20261004    gcc-16.1.0
hexagon               randconfig-1001-20261004    gcc-16.1.0
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
loongarch            randconfig-r2305-20261002    gcc-14     sparse
loongarch            randconfig-r2305-20261002    gcc-16.1.0 sparse
m68k                              allmodconfig    gcc-16.1.0
m68k                               allnoconfig    gcc-16.1.0
m68k                              allyesconfig    clang-24
m68k                          apollo_defconfig    gcc-16.1.0
m68k                                 defconfig    clang-24
m68k                 randconfig-r2103-20261002    clang-17   cocci
microblaze                         allnoconfig    gcc-16.1.0
microblaze                        allyesconfig    gcc-16.1.0
microblaze                           defconfig    clang-24
microblaze           randconfig-r2100-20261002    gcc-8.5.0  cocci
microblaze           randconfig-r2302-20261002    gcc-13.4.0 sparse
microblaze           randconfig-r2307-20261002    gcc-16.1.0 sparse
mips                              allmodconfig    gcc-16.1.0
mips                               allnoconfig    gcc-16.1.0
mips                              allyesconfig    gcc-16.1.0
mips                           eyeq6_defconfig    gcc-16.1.0
mips                            ip32_defconfig    gcc-16.1.0
mips                 malta_qemu_32r6_defconfig    gcc-16.1.0
mips                 randconfig-r2102-20261002    clang-24   cocci
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261004    gcc-16.1.0
nios2                 randconfig-1001-20261004    gcc-16.1.0
nios2                randconfig-r2101-20261002    clang-17   cocci
nios2                randconfig-r2106-20261002    gcc-8.5.0  cocci
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.1.0
openrisc             randconfig-r2201-20261002    gcc-16.1.0 smatch
openrisc             randconfig-r2303-20261002    gcc-16.1.0 sparse
parisc                            allmodconfig    gcc-16.1.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.1.0
parisc                 generic-32bit_defconfig    gcc-16.1.0
parisc                randconfig-1000-20261004    gcc-12.5.0
parisc                randconfig-1001-20261004    gcc-12.5.0
parisc               randconfig-r2104-20261002    gcc-16.1.0 cocci
parisc64                          alldefconfig    gcc-16.1.0
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.1.0
powerpc                            allnoconfig    clang-24
powerpc                      kmeter1_defconfig    gcc-16.1.0
powerpc               randconfig-1000-20261004    gcc-12.5.0
powerpc               randconfig-1001-20261004    gcc-12.5.0
powerpc              randconfig-r2102-20261002    clang-17   cocci
powerpc              randconfig-r2104-20261002    clang-24   cocci
powerpc              randconfig-r2303-20261002    gcc-14     sparse
powerpc              randconfig-r2309-20261002    gcc-16.1.0 sparse
powerpc64             randconfig-1000-20261004    gcc-12.5.0
powerpc64             randconfig-1001-20261004    gcc-12.5.0
powerpc64            randconfig-r2200-20261002    clang-24   smatch
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
riscv                randconfig-r2307-20261002    clang-17   sparse
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
s390                 randconfig-r2300-20261002    clang-24   sparse
sh                                allmodconfig    gcc-16.1.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261004    gcc-11.5.0
sh                    randconfig-1001-20261004    gcc-11.5.0
sh                    randconfig-2000-20261002    gcc-11.5.0
sh                    randconfig-2000-20261002    gcc-9.5.0
sh                    randconfig-2001-20261002    gcc-9.5.0
sh                   randconfig-r2303-20261002    gcc-16.1.0 sparse
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
sparc64              randconfig-r2104-20261002    clang-24   cocci
sparc64              randconfig-r2105-20261002    clang-24   cocci
sparc64              randconfig-r2105-20261002    gcc-16.1.0 cocci
sparc64              randconfig-r2200-20261002    gcc-15.2.0 smatch
sparc64              randconfig-r2302-20261002    gcc-14     sparse
sparc64              randconfig-r2304-20261002    gcc-16.1.0 sparse
sparc64              randconfig-r2306-20261002    clang-20   sparse
sparc64              randconfig-r2306-20261002    gcc-16.1.0 sparse
sparc64              randconfig-r2308-20261002    clang-20   sparse
sparc64              randconfig-r2308-20261002    gcc-16.1.0 sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.1.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261004    gcc-14
um                    randconfig-1001-20261004    gcc-14
um                    randconfig-2000-20261002    clang-24
um                    randconfig-2001-20261002    clang-24
um                   randconfig-r2301-20261002    gcc-14     sparse
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
x86_64               randconfig-r2101-20261002    gcc-14     cocci
x86_64               randconfig-r2101-20261002    gcc-16.1.0 cocci
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
xtensa               randconfig-r2300-20261002    gcc-16.1.0 sparse
xtensa               randconfig-r2304-20261002    gcc-14     sparse
xtensa               randconfig-r2307-20261002    clang-20   sparse
xtensa               randconfig-r2308-20261002    gcc-8.5.0  sparse

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
